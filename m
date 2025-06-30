Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F48C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 15:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B44E10E490;
	Mon, 30 Jun 2025 15:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fo9AZovz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC76A10E490
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751297644; x=1782833644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=oJ3dMdu9SAWkJVkPt1ZbB6qYfOLs0UlKDHwFGg7iHMU=;
 b=Fo9AZovzLkpaR5u8sfKMuhqJMwahv/6K35VMYawambQAdRuEJ4b5xNvE
 RxNhlhmesrmw2LWZEvEinHYe2vfWyxUoHkMejUJvVwsAyZL1kgS7ziiWq
 efUBJGNt9S/0ikKUy9rXuHuB8ztAkfaVXPh4IkuXYhqHaupaM01gddB6B
 4bO7CN/1HboZx4ZVwvPPLHd7+RbUsXC0+RizFxUq2Zg5tpm0P4mgs7p7r
 wDjle+Wr4lsnyvWr47ugU9DcLggM2prvfhOnxzxRkdZVec8rJjepfRIZ5
 nMaLPMqKrhaZsFaIyltu2nrIvQ+tnyVIs58ejPLJA2uSyBkQxizNqmlhz g==;
X-CSE-ConnectionGUID: Q1IMHbPwTruzuJBV18oNeg==
X-CSE-MsgGUID: 5dbQ7TSNRbOv9p7Q2kekVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70961609"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208,217";a="70961609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 08:34:02 -0700
X-CSE-ConnectionGUID: 6BSEcThBQ9mdIibAg1sz1Q==
X-CSE-MsgGUID: eErVktb5Q6G6SG7V2zmF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
 d="scan'208,217";a="153122768"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 08:33:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:33:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 08:33:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVczELRL4wg3ycD+u5vgKqmxH9pMIKL0NuWbvSuOxPXpUPBJ9/RQra294m8y73cJs0QtlJjq9yxYFrUplBO9zPOrbZk0BablNtzEaVyFPgKuSpTxA+gNnrkY/8sP4x/3Lu4KwY8PAU7pjSqB1LYGytbKEVVUDnXdrSIRofmRMmaozAS6b/c1rHptZt9URT6Ow5LesOeD0s6xnHrBN/PiCFl5e5TZRavmqW8xI7ckPSVgDdS1ZjZpcusjAYjHs3TXti7bGDkSxPZpZmebgXiGgxt+KBYrShMpNBO2SHhyHjppbdMjiuo8B4k5ka7gP6M0GWVtgN+hHTpO8iOTg9VUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q42jke/yW658+5Tn7EVVbsIP0iBYh/hwmEckm5hC6Ao=;
 b=IelHUsEtwclmGr7QRE7kat6BWi6whHGRAhxYa91bgrg/wGw02MEJ6qBHSE+rHgDU8CHKn9AFjpp0i+ZnlFTBWklwFsGxbo5oRNNu2HFDg2gR9QjeKbvYlrcSBM8R51zpgBpUU0ZH7+PUv23oxB9lO/H7NEXOeyvVBLow8d88kr82pF0WClgiE6Sn/OXQ1xY/NpYjppb1RX1cWisYrUJd6NJ96ug9ddIl/f7K0zMdLKw3UlIMoM73CyLi3V/85PnPvaQdwoF0NL0ioupL2gq6MsLFeu74IN62RGHzPF9FZqIJZXG94f8lpw75Ip8D5mD64UpLwhmzUjfHoXTW2buJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 15:33:52 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 15:33:52 +0000
Content-Type: multipart/alternative;
 boundary="------------DXs5uVPq0x6Ax5XP3da6F01T"
Message-ID: <c895113f-d502-46f3-8be2-7e5edec731e1@intel.com>
Date: Mon, 30 Jun 2025 21:03:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/xe_pmu: Validate gt in event supported
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250630093741.2435281-1-riana.tauro@intel.com>
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c56186f-be2d-425e-201e-08ddb7eb840a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODJIOVVEeURlK05uMnpLWC9ESVN0T1l4bCtNQ1dCa2R1TDNiRTJIUGY5MGlM?=
 =?utf-8?B?aDJHYzNVYUFMK090NlRnelpVdnlOTkFHMjJLdjl2NmQ3VlRFZE5nSmRNRXJP?=
 =?utf-8?B?Tk9aeG5BbGhMSGJLa0prWDlJQXVLRnk0Ym1IY0RLZ0FMMjRIdFpYUGVaUWZN?=
 =?utf-8?B?eHY1eW0yVld2aEpBQlFWSE5EZTNNclRQMFpqRGpCa2tMalZ3ZEZYdFFvMGhU?=
 =?utf-8?B?bnVVSjkwQThWQmZMdW9oY0M2TGtzdTNYMEZ2VjREajEwVldtZzZDcXVYOUQ4?=
 =?utf-8?B?bDlUMUtSckhPUE5hdGN2MDB0YXUrOGVFaDE2aGRpZFRXODFJaVZFRitSNVdu?=
 =?utf-8?B?Y2xVb1E3TFBVR2lOQUMyYVZHUHFNZXF2ZnFmdFBBdE5PaXBYNmhpemJNeHhm?=
 =?utf-8?B?dWhBRHpkazJoeHFHekU2RDhqMytNTkUwN1h4NVhERWJRU3VUMlM4YUFiZmRF?=
 =?utf-8?B?UTlLQXNoODRHb1prWDlEMy9GR3NHUnpWSEFKVndDaFdrcVpkejRlQjc2YjFO?=
 =?utf-8?B?STg5b1dNZUhscUx3ajFISFlDRWlGRzdSdDJ3eDJ3QVczUUVsTXBBQ3NrQkgw?=
 =?utf-8?B?SjFKTU1laGtVQlZvWDFUSi8zSEwyWWVjYmhXRytGdEhzSzExbUdZb3hhZEZV?=
 =?utf-8?B?QXZQUDB1VTRuSUtTWlg1Y3ZTWndFaWcwMHp2YTZET3A2NkJJc0JUWGIvT2ln?=
 =?utf-8?B?M1FXcjZyMkZkUEpyWHdYeWJUcFl4V1V6ZEZsV1ZwbWJuN1RETW5tWUJpR2U2?=
 =?utf-8?B?RXQrbEc4aWF4bytsUE9vbzFCVUgxUERXVlFlUGpFUmV5aVdudXlubWFaOWt1?=
 =?utf-8?B?TTk5SjRxMEExdFE2MUxYaW44NEoxazBDOEY3NUNTdm92eTlmMjFxaGJzRjAx?=
 =?utf-8?B?ckxTWmYwcGdrKzNzYndkdlV4Zlhrd0JTUVVnSUZpZ3VDakpOVkpRdnArdUJj?=
 =?utf-8?B?TmMySTFaNU1IeUVnUW1hL2FOT2NCNU5hb3FXRm1UeWwyd3BNbll6Q3ZsT244?=
 =?utf-8?B?d0REQ2ZvS0ltbkdxN0pjUDJDd0ZFVExTY0IxTm9pVDcrdXBxTU9kK0JmWEsy?=
 =?utf-8?B?V3ZzQ2x5bTlSbXkxNTVBYkF4VUpaTHQvNSthK2laVisvNGVDaW5CUnhpUy9v?=
 =?utf-8?B?aWtqVVZqeDVxWk9RaldKMUV1WWhKS1ZZNTZBUWRXMXNQVitUaWppVXJ5NWVH?=
 =?utf-8?B?QkQwa2xVUVMvcFlqZlZqK2hPbDhPUzc1V0xkd1JsSXZMTW01U0xqV3dWcEdj?=
 =?utf-8?B?L3B4Y3FmaGxaS1ZVOEF1TlhWVTdObUV1eVhpbmp3UzdWd3VibXlQVlNNY1A0?=
 =?utf-8?B?aDVXaExtOERMbmtYRXpzN2E0NjBFdWhPT29XemxXTTE2bHkxenFJMWNUWUlW?=
 =?utf-8?B?SGU0S0x5azkzb2gwWCtLN2NpaFRtcVNqK2RVWjhxMUFIOW5tS3doVjhLS3pH?=
 =?utf-8?B?WmtyNWR5RnNadG93K3JIdmRRVG1NTU1HaEsvbVJNMm94bzBZeEpKV2NjY0Fx?=
 =?utf-8?B?MGUxVmtLYjlsOXpJM0NoVHNBZE9udkhCaTNEcEQ3TDVHV2JUQXcvRjZiS2U2?=
 =?utf-8?B?SHp4VDRzUmdoYXJ0MnpTRXVIQ1BycFp0Z2toQzhpMkFDZVgrblRPRmZwT3dk?=
 =?utf-8?B?R21YUFIwY1cxL01weFlwb0c0YkhsMUMxVjVNQmtheXhxM2RIRGw5YjBQTkJK?=
 =?utf-8?B?ZFdCWkdIUDdNK2dhSzJqYWxxYi9xNUd3enYrWFlNZTh4N09DckdrNHE0bEpn?=
 =?utf-8?B?VG10WDUrdS9uTjFhSy8rSXB6cVBiQjZNYU1mTEVTTlp4U3l3QjNTdVBIelhi?=
 =?utf-8?B?cWVIaXJHUkdob1hEaEtDbFR6T3I2b2RyYmRXQk5LMUpxc2tTMUd0M0dBcjU0?=
 =?utf-8?B?M1Ezd2loV2kvYUJRRk1JOVlDYnB6TXNZVzhSWGNpSXArNjdqQnlQVGZCTTNp?=
 =?utf-8?Q?XaqAoRC86Go=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekRwb1lkcmNWWkhBVVJtRjBJVHNRalBVSFN6U24wR2l0U3hSU3ArbzZnM3A1?=
 =?utf-8?B?YVhQait3WExQelFJQVRqVFIyUXkwQWtxZFlrUjc1d0cvZm1WN24zUHRyT1l3?=
 =?utf-8?B?RGsraTI4S05LcUlLb1dORHBheWRzemVaaGU5Nlk2RGhMOXhFM3ViaEF5d1FU?=
 =?utf-8?B?MW1yVzVRcUMwS3V1ZzkrRXY3R2R0NHlpdW96YzhFTVZweWJyTm1FWDl0bkJ3?=
 =?utf-8?B?eVQ0TXRRSWdlZUdOMEJLTEplVWw4d21uNm10V2liTDFLdFBDd2E4MW93TzQ2?=
 =?utf-8?B?VHNNZmZQRVFQTjFmS1VkQ0VNYlhnbGdtUkZQYUJ0YXg1L2wzYVlpYTM2L1Qw?=
 =?utf-8?B?eUJNS2ZCV2grVXpZUjZCclRJNkZ5VjdBNWd2d002QnBZc0M0aTNyYys3Nkww?=
 =?utf-8?B?Q1Y3eStpbEFVdU5ISVlhZFJ3S0huNTB6bjQrZ21aMFZtUmlraXM1Y09DL2Rq?=
 =?utf-8?B?RnBkdXlWeDdTd2U0SzlVcU5XVFZSQ08rL0JRNUtobkJPcGtoMnlCcDQ3VHdH?=
 =?utf-8?B?c1JCdkhkUTNLb2diSytrbU9UWEVkN2c5WkxJUmM2YTNyN05wRnJWZ0RBOUV1?=
 =?utf-8?B?TDhiQmN4OVJTWGgrbDZvYXVaSTRFNnlKOWRibFk5UDU0QVNmWnVYZlM1RkQx?=
 =?utf-8?B?ZmdtUlRGYTJlRnNlTUkzYnR6RXc2OFJRclBVYkVYWHNqZ0FsUG9McDdnVXdB?=
 =?utf-8?B?K3FtWE5DbnhJQWRTaGl3b1ZYR3VQeW5vMDcrM05oL1E1QnhTYW8rT0t0SXQ1?=
 =?utf-8?B?b2pqZTFBVjNOM0k5NXRWQTF0OXh3VzJzS0piK2F6Y0ZsMXZrcHg4Q3NHR05o?=
 =?utf-8?B?VEEvUVQwUVc1VmJhNlJCT0l2RXlkamUxSlhFNkNUZUM0YlVkVGdVOGhhS1Ft?=
 =?utf-8?B?a2gxVFRvdWxwc0MrVy8zN1lBMk1ZN044QW9rc2UxTSthaWtuWkpyQTJRU2Rz?=
 =?utf-8?B?WmhON1BvOTM1QWIvK3JENXZxcUozR0hYVlVaTjJSSmJ2d3JHTmU3aW9sWExH?=
 =?utf-8?B?a1JvaFJVcHRUVllmZmZnbE9PU3FEL25pUFB2ekUrQkNmeFJFY2x0V2k5NXJF?=
 =?utf-8?B?d1drM25SN0Vncnd5amkwdFNhOG90MmlwT21EWHdlMkFncHkyZUYyQ3dNdjdV?=
 =?utf-8?B?Yksyd3g5ejVwZUpoK0NsK0ZpaEEwTHF2Vml5UklyN2oza0o2OWVpR3ZHMkQ1?=
 =?utf-8?B?aDlZdFAxVWxhUTlhbFFydEZtb2h3UXdHa0I4NythSEVzV0pFSVQwbllIOE84?=
 =?utf-8?B?VlhSclptR2h5VHM0aXcwZExkaXV4YjhDNHZaQ1JML3F1SUdHT2tEUUFBMGMx?=
 =?utf-8?B?aG53ajhCR3Z3bDBoWk1MTXJCTVJCMlYrRFNWMCtEN2JCVjhKL2I1TVBKRzll?=
 =?utf-8?B?SnVjQWJDcXpVd0txSm41dFVqV1lTTnBEZUFNQk1hbDNzRGdGdnpzNGRZZk56?=
 =?utf-8?B?dWVVSk42UW1oMFk0UWRYMHJLakpiRHhRWlNhVzVWNTRhWEp1Q2xkUVJLYWFW?=
 =?utf-8?B?MlB2K3RJVjRiaWE2OUowTHpTWnhwRktvcjJzTEZyaWZ6YUNTOXpyVTlEa1N2?=
 =?utf-8?B?S01UWHFrQzVOMC94a3NkWGlwZmJIdkpwTGVKR0s3OEg2NDFOWm1kczVJbzNN?=
 =?utf-8?B?TmRqTkdVQzdtaytWSi9iUFhsb3NWbFJvc2NYRmdJenRDa2xCS3pNb0dCdjUw?=
 =?utf-8?B?bGVqVTVzSmdVQzQ4cGYwRk1QSWRGR3NKT01BWVZjYk9lZWVjTDBpQXJabnBG?=
 =?utf-8?B?dVQvLzBsYUcySlN2OFFTQktCWVc2dGJFOGp4eU9Ka3VuTXNDNEVUNDJtT2hE?=
 =?utf-8?B?Qy9ja0w5ZDdUWkJpbkhhYnFXS3gxMDNpRkZRb0xwSU1QSjFOekxnMHBJektR?=
 =?utf-8?B?UjgrMlovTEk5ZkFucU1GSmEyY09JRHNLYUhiSVBhbGJuRmg1RHArRFhidGp4?=
 =?utf-8?B?bnl2NHpEMjg3T1R1YS9rY1ZyMjg5YjlqT2U5RVRDZkViNk5QT1g4aU1VanNZ?=
 =?utf-8?B?VFFobG90NW05VzMzNXlacnEvMUVGT3hER1F2cHB5REduU3N5Y250TXp6bHVF?=
 =?utf-8?B?Y0VXZU9FSS94K2ZHRk9makxFbjFHenJXTGszazdlcFZuaENBQjk3YU9UUk9U?=
 =?utf-8?B?V2wzUEpIQ3pWMkduYnYrNjVkWUpob2xGVVJiaU5BV2RuMDk4K2x2blljK1hC?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c56186f-be2d-425e-201e-08ddb7eb840a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:33:52.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2tRpjO+uFXBQ7/U4iaHjUynn7eqwH8DpRUX61mSpqtrOWLWcgOzKvPn1v1Ub6FCTDlMNTnFrnkht+f7EKyC0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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

--------------DXs5uVPq0x6Ax5XP3da6F01T
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-06-2025 15:07, Riana Tauro wrote:
> Validate gt instead of checking gt_id is lesser
> than max gts per tile
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 69df0e3520a5..cab51d826345 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -157,10 +157,13 @@ static bool event_gt_forcewake(struct perf_event *event)
>   	return true;
>   }
>   
> -static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> +static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
>   			    unsigned int id)
>   {
> -	if (gt >= XE_MAX_GT_PER_TILE)
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);

Looks like xe_device_get_gt() would return primary_gt handle, instead of NULL, if gt_id > 
XE_MAX_GT_PER_TILE. gt would be always valid then !

> +
> +	if (!gt)
>   		return false;
>   
>   	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
--------------DXs5uVPq0x6Ax5XP3da6F01T
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-06-2025 15:07, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250630093741.2435281-1-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Validate gt instead of checking gt_id is lesser
than max gts per tile

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 69df0e3520a5..cab51d826345 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -157,10 +157,13 @@ static bool event_gt_forcewake(struct perf_event *event)
 	return true;
 }
 
-static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
+static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
 			    unsigned int id)
 {
-	if (gt &gt;= XE_MAX_GT_PER_TILE)
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">Looks like xe_device_get_gt<span style="white-space: normal">() would return primary_gt handle, instead of NULL,&nbsp;if gt_id &gt;&nbsp;</span><span style="white-space: pre-wrap">XE_MAX_GT_PER_TILE.
gt would be always valid then !</span></pre>
    <blockquote type="cite" cite="mid:20250630093741.2435281-1-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	if (!gt)
 		return false;
 
 	return id &lt; sizeof(pmu-&gt;supported_events) * BITS_PER_BYTE &amp;&amp;
</pre>
    </blockquote>
  </body>
</html>

--------------DXs5uVPq0x6Ax5XP3da6F01T--
