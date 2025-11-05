Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BFBCCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 16:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4766510E2DE;
	Wed,  5 Nov 2025 16:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXmQqtKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207EA10E2DE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762361958; x=1793897958;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=o/lE/Z4hSW+5G0vk83FWWWfkdge/1toH8qw4L+/St8I=;
 b=dXmQqtKf168055P+wYtEvEHw2manGsZl0qfyNhvJRNEaeweDiJ8dBCRn
 UYRDA3jnsVy1TdD1yaJFXbUijEOB1/fpFdrgpi4RKgQtSOql7r0WG7YxB
 ut7IgDUqt4w986MqnS9Mg4WVZ1PU2TOL36gPXNySWMnb67fEeO2ugOWVb
 tl13cL+Z8ApomoO9jepuhrGNg+LKn1pBzybdmr3Y9I7dRi8LJwqW/gHb3
 XxDU39ER1XYzlVCCGD/gm1dM1hjhrUHSwEmW0ZYUlVjh9HZK/eqW7bn4r
 di2LphT/gKPydKUABIX/kPjS7hlTtCsyO1bOToNdPb91TSiJA4sdd5X2o g==;
X-CSE-ConnectionGUID: Md9AZsebQ0qgyuNfDJ4rUw==
X-CSE-MsgGUID: PcHY+roHQqC3RWC1RyA6lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52052216"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="52052216"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:59:17 -0800
X-CSE-ConnectionGUID: Xz/XIrOXRWe1P97MHYvWzw==
X-CSE-MsgGUID: nAOhbeckTc2lqIzwcdPW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187204329"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:59:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 08:59:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 08:59:17 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 08:59:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhLWpBjDrbmzdSlLPzqx8eZ4yUOxUTzzbRratNqmT+MDbaPtI9tM7iqboan+zU8KNq3c5Fxjyk3AVhsnYyoL9q0AlVTNPjvoTYI4cAzd5SWYHu5NFsI/bmn/YOZxX4FGf9sqozdJL18z0F21tY7QH+RxkQ3R/8nUZtmWsX4A2f84Go9acCjwIp3KYaVLRvlKKsAyLNU34LDnGysjKbl+tO0CtrhACxhsaFOt7Hm7satxXaEkJaBl9z6Te9i5iAA8BAwGjl9EEZxckEGLxLJMVnopMvax36tmOFZgc9Gf3UWamoWr1ODh05hO/hwd6nsRmwhf72EqZ+6qCXrpVta6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FokCtLy9YQcrSRZDjgYsTDOd3pICjseidD/1rw99TBI=;
 b=BWKIP0HKvMjxXzl5PGDhXcLOTg0Q7MyJP5CjqF+cm6xAB8XMZbSf0sJgqX5Ty+aWdgTrrgYC1YVClNvJiVxB9FZV79YLCHyUCL0XQFJsdJrEBJe5xk1nSZWECm6Y2eKKmWwtNaKMPC5GWXYoir3F5x2Y2F+1X7K8vtP7Ulyoe71aOeAk+vlfz61cozmm2X0m+b5ubxB9OA6oXZSfnu6VYhB1JzsCTADKpUCDSNS7pyaoBYubuR0B3REdURAQqooGwvBM/m982U2HkJ9iyCGQXNM5/ZSSbh7Us009bb/b4PBu0xxKkCzXEXpdPftF5MMWDCS0av0T/owt9sEVhhycSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.18; Wed, 5 Nov
 2025 16:59:14 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 16:59:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1] drm/xe: Move VRAM MM debugfs creation to tile level
Date: Wed, 5 Nov 2025 17:59:05 +0100
Message-ID: <20251105165905.3509314-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0325.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 071c592d-9ee6-4576-a226-08de1c8ca637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFZyN25JNVpDL0RJckpaVGQwZTJQczRxVU9nS01uZlpBZVJvR3E3YnlqRnpM?=
 =?utf-8?B?Rk1ubkE5MXVxT25MLzhiSld2eEpiNmovNk5XaVUxSWhRWW5oS0RYREZDZUc1?=
 =?utf-8?B?eGJFUjdYUFIvSEsyejFZaDIxckdkLzVGMzdHOGhwWk5FZHVQU3M3VE1BUjU2?=
 =?utf-8?B?QnZyTUw2bU8wZlAwdm5YT25tdXZ5OEhKYmgxSjltMmZESzA4b2hodlI3bFp3?=
 =?utf-8?B?YlJaQ0U4V2d3aXg0dHZaTWxxSVNIeGsyVUR0RWxDT2ErWUtUdTZQSkpNUjZQ?=
 =?utf-8?B?MFdFZEIvbWdDY3lzVkQ0cVBSQyt0d1NVMzdnL0lBeDJrajB5UEVQdXluNS8v?=
 =?utf-8?B?NmVzRUgzZUk5NERzMXRUaVk5eS9oaTI1RzJBRWNrNUhkay9LcWl0ekZYdGgr?=
 =?utf-8?B?akFxWGxNSW1JbUhPZy9GVFMyWUQxdTV4TEdFekR0SXp6T2ZJNnlrbFhBcXgz?=
 =?utf-8?B?eG16cXYxM29zRS9UbFkzWmRNQlYvUXZqakg4d0VFUkpUVVNnNDBjNmVsQXFQ?=
 =?utf-8?B?bnJHU3E3SWR1NGY1a2NDaHNqYmhQWnE2RFVDdk9vVm5yOWNXY0RZckNudkVE?=
 =?utf-8?B?QThMWm1aSlFzaTlIRzBGNDY3Q1FGaDNHcTAwM1NmdHBXMlVlT2JtVDBDbllQ?=
 =?utf-8?B?ZHVhU0tjRU55M29HY3V1UU9jTlplWjNnOWV6WmZEbFFPSnlVVFNkVWRadWk5?=
 =?utf-8?B?ajkwNFN0RVhzVEVNT08wNXY4b2ZCc2oxR21OV043T1ovb3JxUDYvK2tiazUv?=
 =?utf-8?B?MXV2T2lMT3FyQjNHZVFCTURzSjRYUGJmNmZhckkwZ3J5amY2c1g5V2NHL2d4?=
 =?utf-8?B?bHNGa3pIeFVyMXoxRjB1Wmp6dTl5bEZiVGFRanlQRHpQZ0VETW8rNWxueFZk?=
 =?utf-8?B?Rk9pbzdlekVnQ3d3eThDN3FFTXBGMlhlU3ZUbGY1VXZrLzM0MEJXWnk2akRs?=
 =?utf-8?B?cjVrMXBLZnF4M3N2eVRxeHkzSGUwUXJGMnR5YmJoZzN4WHQwYTlkaUVSL0VZ?=
 =?utf-8?B?SThLQVBqT0puNkpGVUNhNEt6UDZHVEt3TEErQ0RjZCtDTG9iNW1YQTE0a05J?=
 =?utf-8?B?dTRDZ2t5T0w5NUZHenJJbk9nOVQyVjVvWjJDSTJObnpVRTQ4bzhuL2tmVDZB?=
 =?utf-8?B?T0lpWWwwZlg2ZkVqRWprT3NmWmdCVDRMYjVXbDhpdlU3UDNwdDZYMUJ2QXRR?=
 =?utf-8?B?cCs1elNSdlNiT01DNDdoVVlSeUJxVmZ6QlpSbVVCRjlHWVlweFJZdUZYOXpN?=
 =?utf-8?B?a3FoamtiZWpqckNpeWVxQ3FVSmtoYmt3RXd5dFpFL2Z2cUF6SWlzOHhva2Fm?=
 =?utf-8?B?cUZ3Z3Nib21pcFkyNjFpcm8wOHN2OHRycHNIZGJhQ0c3STdtRzAxb2lFZkw2?=
 =?utf-8?B?dng4ZWdiQWdjU2NGQS9BOWw2Vk5vM2JiS2xsNlBxbHFkYm1oTUtESTUzazNq?=
 =?utf-8?B?bzJLcTBybmJsZ1E1SWxwdC9QTnV0SUhtRmNtVlJ3Qy9vV0U4NGsvL0NZeWw1?=
 =?utf-8?B?REFkSW5BWXhTazlqQXc2dW90ZkxDRkNyMFBoUiszYlNGYTE3YVdybXRabXlJ?=
 =?utf-8?B?UTNyY0pheGJGYnlPWUN5cG9qczBqdnJUNm4zUXAvSlJaTXdCbGpTNEhGQmlN?=
 =?utf-8?B?V1dpdk9RVEh2VTJDcXpZRnBzWVhLWmdmS3llb25RdDJnNnZCakNmRVJ0UlRZ?=
 =?utf-8?B?U2ZMV1piaXFTU1IyOXRSSVdMelZkTTY4aWJuUFkrdFZjSzJFbzBWUE5XSHBR?=
 =?utf-8?B?WktiWGUwYWFwbndiTGtCQ2Z5Qko0OUQ2ZFB4QVh0TlFxNGtJOHdXeG1raGs3?=
 =?utf-8?B?blZLdGllbk5NNURmaDcxQ1V0VmVaeXZvNmZ6SjRQaE95WGx5dkd0UVBQTUhj?=
 =?utf-8?B?SFJ4RkE4ZXNqL296cUd3V1hnMzhyRTRoSldXN0VRZFk0cHRuamU3TGYwVG5H?=
 =?utf-8?Q?lMA4GD1H65ZIKe2t1O/ijUOb/lARYA5z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVodk55S2FvZ3p3RnF0ZDBtM1FpN2hOeFArN2Z5aVp4YVZNZ0pwVkJKYXZX?=
 =?utf-8?B?c0hPdHcvdkFrUlVJNDZ4WDlUQyt1MFVtSkFYOG8wWDFvdUF3T0pXU3dmKzQ2?=
 =?utf-8?B?MktHNjVSMHhQdkJOMU5EY1dnVzZBRllmTUNUWnpyV09mYUVIUGlsNTd1KzdK?=
 =?utf-8?B?Wk8vdmh6TEFLMDl3YWZ1K2JkM2tsY0hSYXA4YnlzVDErZDBoUVJDRjBLcWRJ?=
 =?utf-8?B?aGNETmNvVGFMcjljdHJNT2F2R0IwOEZmdk5LNzJjM2d6Ni80YU5IVWhTdldl?=
 =?utf-8?B?TndNc21ieWJsYXJ4bFJ2SzNoRS9CeVZWRnQxb1JQM3VReW00dXlrdUhEOGNt?=
 =?utf-8?B?QU5odFRXOGRTQlhXSktGYnhrSndIbUN4UmM4aWxCWlJDV25vSWEwSTlsOFkv?=
 =?utf-8?B?cytzSG5QcVo1b3VPcmVPb2FKVk00cWRLRGl2T1lHS3VpNnozYmZUKzVBNTYr?=
 =?utf-8?B?TjE0U0FVTmZ6dWpHa2p1NGJndWJtWDd6aUVJM2ZRTUdUOVZPbkRrWXRMMzRx?=
 =?utf-8?B?cExVbG1KbnRNSFpoWXdrT09KWFlJV09rQjdVQkdFRDNhU3FUTVpwOWozTGMy?=
 =?utf-8?B?bUJPVHQ0Y1BDNk5FMERCaWFnM0JRY1d3WEVpYjNaUmZGd3QzOXppUExHRVVn?=
 =?utf-8?B?RlUxZ0hNZnczajg0NHBhdTJHQ3BlT3lGWEREeDVBSHB3NFhTT284UndHNUdz?=
 =?utf-8?B?cHZFUTI3UmN1R1pHR2RMandWM0NjY2Q5WkpKYkhEcVRXaWFJSm9EcjViQ3lt?=
 =?utf-8?B?dUpnZ25CcmliblFpOTJZRE9nWHhscjlENWRNWHo2NHRmY3pEV2tlQ01ubTBL?=
 =?utf-8?B?QUswRWxjUENoSUF5bVlITEVvMnlMVzF1SStadmYrMFpSdU16NDMrYzlXbmpo?=
 =?utf-8?B?SEk0Y2ZWd0FwNkJ2T0lXdHFHL2F2QkhEWG04WGpScE1BY1hsZkljQzNFQW52?=
 =?utf-8?B?REhRYjRnRGwwUndHLzgxc211TXJQSEdBVzFGcy9BR1dKQWNoM1Q4UzliRDRx?=
 =?utf-8?B?UDNnOVQ5WUFzcnFaWmJRZldhb20zUGhrTmQ5NHd1OC9ENVp1RFR4bVJORnRU?=
 =?utf-8?B?c1BONFlTTDQwb0NjUEFoaVZ1REIzOW0vWXNIMXhteENtMklGRisxRWxlR2RL?=
 =?utf-8?B?MW1uUXV4TlVxdW9RSHQrUmNTOWRHdW9QM3hVVEhVNkJ4ajVjVFZ6SEZBc2RP?=
 =?utf-8?B?c3NTQytReThRVmRuN3pQNDlYNmtuMXVHU1VaQjJ2VGo0Z2FMalpRV3pQMXE0?=
 =?utf-8?B?QTByQ0Fkd1pCSUZHZjZIUFFXc0dXbytrNmFiOFFzVDRUaE9OQi9Kcmp3REh3?=
 =?utf-8?B?eUVHOUtJUDZhRUJNSkFHMkJuKzIrcHJZdjZKdU1sbjFKdktNaWJQbUdjUDdt?=
 =?utf-8?B?dkd6L0tqYWZjUmZhR0xvWnNRa2xyWDhMT3lUQmFHRS83NlMrWmFxTWdCaVBG?=
 =?utf-8?B?ZmY2ajFNTTZpZHNVc2gyVUQ0NXpwUnd0MS9wMjJBYTZldy9LL3Zpb2V5enFM?=
 =?utf-8?B?akNoZCt5T0VtRmpkQUtoTWpqZ2FMeGVWcWNuRHhDamkxbzdmT1h2dmV6azdE?=
 =?utf-8?B?Z3gzUlA3S2ZVMiszVWtuTlNBQ0tJMEZHWk5YemxJSEZDTWxxODhqN2pYK1Vp?=
 =?utf-8?B?ZW1vcDNSMUFwbzl3a1FXeGI2Sk9mRHhrTFVVRXpmMGtBdTFtL0cxQ3VZZnpQ?=
 =?utf-8?B?QmNhc25rcEhIcHVJZzdDMllISmdKNUJuakJCN1ZqN2VzOW1ON3ZSYkhlMkE1?=
 =?utf-8?B?RW43aHZpSzV6eFUvQlhhaHZseVBKb3dWd2tBY3JFZDFPc0p4M1ZINFc3ckZG?=
 =?utf-8?B?bHloODlLMDA5d0VGT294cENKL0Y0TE9jYkRiZ0RGbEZjbWxPL29ZZW53dVM1?=
 =?utf-8?B?VmxURnhVaXRXSEtXaklXWDllaEExcHh2NXJGcTBpUnVmNE9BNWJlWkVRQno0?=
 =?utf-8?B?ZGFKVHY1WWo3ZVFWSzhuK1paODRWNnhQTUdXM0V3WHE2Y21HQVlyRzhuRUVk?=
 =?utf-8?B?ZEJmZnVRZDF1dU05MWt4NEI2MmVRWXdQYXpEdjJqcVJPY1NBQTRSTTJ3UVBY?=
 =?utf-8?B?bDl0VmZaQlhZNEEwT1g2ZkFFVUxhTnZpNm5ESzltekFXVGkyRzdrMi9iemNK?=
 =?utf-8?B?RWdmVi9waDdTQ29xZytxcXlva3I4UWk5WStaZmpGdmF2N2dHV2MxR2xDRkFs?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 071c592d-9ee6-4576-a226-08de1c8ca637
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:59:14.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9a9ivqPhOgOYAxLPxYeDgVTJxs9qf/WcDvftmebdan+peOI41h1GNrTqQhwGSABGTN9U7X5o4tCbr4yBcikXWRSeso9SyNBI/iGLvHiWVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Previously, VRAM TTM resource manager debugfs entries (vram0_mm / vram1_mm)
were created globally in the XE debugfs root directory. But technically,
each tile has an associated VRAM TTM manager, which it can own.
Let's create VRAM memory manager debugfs entries directly under each tile's
debugfs directory for better alignment with the per-tile memory layout.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 12 ------------
 drivers/gpu/drm/xe/xe_tile_debugfs.c |  9 +++++++++
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..8ac78e560d28 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -375,7 +375,6 @@ void xe_debugfs_register(struct xe_device *xe)
 	struct ttm_resource_manager *man;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
-	u32 mem_type;
 	u8 tile_id;
 	u8 id;
 
@@ -403,17 +402,6 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
-	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
-		man = ttm_manager_type(bdev, mem_type);
-
-		if (man) {
-			char name[16];
-
-			snprintf(name, sizeof(name), "vram%d_mm", mem_type - XE_PL_VRAM0);
-			ttm_resource_manager_create_debugfs(man, root, name);
-		}
-	}
-
 	man = ttm_manager_type(bdev, XE_PL_TT);
 	ttm_resource_manager_create_debugfs(man, root, "gtt_mm");
 
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index fff242a5ae56..b4a1929535da 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -110,6 +110,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "sa_info", .show = xe_tile_debugfs_show_with_rpm, .data = sa_info },
 };
 
+static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
+{
+	if (tile->mem.vram)
+		ttm_resource_manager_create_debugfs(&tile->mem.vram->ttm.manager, tile->debugfs,
+						    "vram_mm");
+}
+
 /**
  * xe_tile_debugfs_register - Register tile's debugfs attributes
  * @tile: the &xe_tile to register
@@ -139,4 +146,6 @@ void xe_tile_debugfs_register(struct xe_tile *tile)
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 tile->debugfs, minor);
+
+	tile_debugfs_create_vram_mm(tile);
 }
-- 
2.34.1

