Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96CC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 03:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8B610E07E;
	Wed, 28 May 2025 03:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVs0KsKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659A410E07E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 03:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748403564; x=1779939564;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ni2eWqqpDUzClEZk6zFFFLWPzH58HoFsuIRNm6RK0P4=;
 b=WVs0KsKcm//lHMskrhWOJkO2aRjalmYlETRaivHrUtjIV4gSJATzgu/W
 Ue2rXG6eWrvqIZDp+v4QJ6R6XQiRsbFvIm/umcaucH4NecjT13l3G21QP
 jLpC8sUsQyeRWn2AEsj3fvYVUFD0MOQtwcL1XmS2Cy8kGiLq3KQLS8MZ+
 FplYSn2UWc20XMM0kAORaGLPwlQGOBbFqlgwd0mq1Lck4wuN3fPoup+ky
 aM+vZb1q+LzVYuhl1VE2xOR9zXXLnyjLPhFhD8KhqqbwiuPkZBsftP/B4
 kOSC15sWr1ErrmKG4KMJKiLZgTIF7/k+LdTBSXgbpTWcnFVcAjslcgHPm A==;
X-CSE-ConnectionGUID: fQ/0laRASceuEcslyE91Xw==
X-CSE-MsgGUID: A8d3aPDeQceZCxbI6oaQpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75804513"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="75804513"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:39:22 -0700
X-CSE-ConnectionGUID: hErP6/YzQgW+5bTMT2s3xg==
X-CSE-MsgGUID: AbDE4gGlS3KA4oNjBDqixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143710117"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:39:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 20:39:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 20:39:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 20:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arpQ4rffo5q0oMJxgjG8aWV82AhuhJR53yjkIaWkcIFfjCurDED/NyxdUokr3DlXwsvE2RIg0h0LruqG+oC1dJYHv0hAb/AUKyWIydW82u7Fza1HhgWB9yvbSk5DFco3h6579MvenlXP6dsSA7udriU6hM/4rluqw7lXw5mA4uykBwU24dHla4Ut5SZjrAHDgrtcHeLVKR8dOJ+jh7BbhxWfTleJODOFkKYLR3TjcjYqromOEHs+frLlzu/vJ8OKgLYksBiCyqetSmxyXH0cz6KhpfaGp3eNbLV6mub8YWoKDnDCEO5+Rallexwm3OF2k/1diW//zF51QsDaNptixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS7Bu1Kb1hg9qc1bFQw+g1/mxAeaaO0bxQmqw8Q9x/I=;
 b=wf5ph2zaXMbtzYqDLND3q0eugxNlYiiV/GvKikgOiu/1BlZuzj6dUcPt96XxIcxrorVuDey9SuGOHpSzcuFfqlxgGGLvuac2dCsmEyFc6nfMZEqGyJIVP6UI6xVRdZd+BJMWMQQ4xhZCKo9ljSgjHrGtyzcgEPJYGHOjrDKwEqwMT5iagZFw0cOxIpQO2oSNYZaAj158yVHegRR5m90IbgpNVco1vQu84ApfpUf2WfXkhpGdLzXnT6dyOIFtgRFtFTO6KLyid6JtSjUGV9KyxA2lQnWW8l3xxtGpReiyC7OjXwKjYRg4/kjjf1Fkq7oJqeSCX944Rxy4isNG+qJK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 03:39:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 03:39:14 +0000
Date: Tue, 27 May 2025 20:40:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aDaFvYK6dsYw5j7Z@lstrano-desk.jf.intel.com>
References: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
 <20250521141141.17572-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521141141.17572-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:303:b4::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 5688b664-0f0d-4968-f7ac-08dd9d99376f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVpTUHZwZ1BmaXoyVGZrdWREc0N2OG9SczlJTGp6eFFqVWdLUVRGS1lpdEtE?=
 =?utf-8?B?WEtVMmp4aHZHZHZOMkRmMTlVVGxYditDeE5HNTA0cUc0T2ZXUWd2OVNmUzRF?=
 =?utf-8?B?cjhDV1V5SUJjTVBTN04xN3h1bTNzSFJjUmRVZ1hrbWNFbm00SFUvRU1adU5H?=
 =?utf-8?B?b2o4czQweERuZHhucE84RStRZ3ZZVE1hRHI0aEMzNm5oSnlPaXgyYXVzd3FJ?=
 =?utf-8?B?eFhRbUxvVi9lOWhrMG1zMHhMTUhUNmszRlNvNkhZSU1aNlBENDV2NzUvOXZ2?=
 =?utf-8?B?S0tXRnlMYWFGQm8wZVE5a29tekpXcWc1ajNYL1M0YkhxS0NZVmszUE9JN0ov?=
 =?utf-8?B?dThjdGlZTWtMN1NvY21sK2UwVmw2c0JyZytHMzhhMnpWZ25odTc4a3Q4UHNZ?=
 =?utf-8?B?ekt3MWtKemdsS3ZLb2xmcmh0cnJxUDZMbEF2b3NDWEc4V1puSDJyR0lKU2dn?=
 =?utf-8?B?Z0xJQ1B0TGFJQXFHRFkxaExMOXJmMi9GV0JTdVdSSjc3ZGNtSHJaUWc5Rm1M?=
 =?utf-8?B?MHVrT2tRZ2xtVGxwcUk0anlySU1qRXFyR0M2b0VMMHI5elY4Y3RsRSszbzhl?=
 =?utf-8?B?UE1YR2tFWk1MR0FJNjhsQ3R0aGR0elNNVWhBcFYxOGR6SmY4RDNyMDF3c2E3?=
 =?utf-8?B?UG9TSHlzampOdFNQeDEvYlVsMkFRRm1ndkR5MTQyeXEyLzBSTk1zZWVTV2p5?=
 =?utf-8?B?TUh0UGFPNGJFV3YwVHkxaEJRbzZtSUsyd1hsaVVCL0szTnFpZGRQZ1JmUnVs?=
 =?utf-8?B?SmdzM0tmbGxlcHZlNEc4V2c3L3JNUXBDUXlkaGxXT1FScGc4dTk0SzN1aVpa?=
 =?utf-8?B?UXh0TDFjRGZ2c0hRUndOVWhhRUw2ZjlyVVJJS0tTQUs3QnBvUVVHV0d4WW1i?=
 =?utf-8?B?dzJNTjl4bGs0b3BYekI3blJLcm1EWHNXTW9aWDlkMG5YT1VmdHZCcHdNSC9Z?=
 =?utf-8?B?Rjd5eE04bm1RSEZ1MCtqZzZqMDBwd1RFUU1iTG1RejRJcTBnZmdrQ1NyaC9n?=
 =?utf-8?B?NzJNMWtOOUh3MmhBbWZ3WnVxWXo3c2ltQ05DenV3bVk5QVlYdmFxN2lkTkNO?=
 =?utf-8?B?VWNHK3hYRGw3Z0Z4U1BkQjhSa2pRTW5YVmVXSDg0UTNIdzAyUWxTT2tIcU5W?=
 =?utf-8?B?NUd5Vkh1SFdtQ3k2cksvSlpVc2pubG85UWcxQzlPVVQ0RWZ1YWxpRVRGTnYv?=
 =?utf-8?B?d1YwVjN3QXdnc3lPaTN0N2QrQjFyeHlXZndEUEFycVc1eXF2UVpMUGJTUzZV?=
 =?utf-8?B?ZUpGV0xtcmhld1g2aXNDV2VzUkxlTmM4YlBQN3J6QytlTks0S1Q4d04rSm5i?=
 =?utf-8?B?Z1lSMk05aHRYNytxc25tekhxelFxc2pReXlwQnE5OG1oeFdvRG9KWHA5eWc3?=
 =?utf-8?B?S0dMRUUrekRlaGQ2dklnK2hjdXloUHlFMHFMd0ZSeVJHN3NxcWZiZ3BqdVBZ?=
 =?utf-8?B?ZWl5TEFpS3hjRUFGQkVidVh1Umh3dFdOVkVLU3RtbktEbkQvM1h5cFQrM0Q5?=
 =?utf-8?B?Zk5Ia2ZtSTJwTTRudjlQVHd6ODB1bzBxTFk5RDBhb0d6VVR2ZVRwcWNQZU1l?=
 =?utf-8?B?aWk2THBoNXgxc1pvSmY2QUFBUDhpS2ZmajUvTlEwd3czQWRocDExQWR1b1dm?=
 =?utf-8?B?TTZOTWhRb0VqaUxMNkhyclNKdThUMnpYNkh6OU1mTXdxZzN0SkFvODRmQVFQ?=
 =?utf-8?B?UGoyNjdzYTVBR3dBQlJabzM3WDVkZXRBNytMWHhFUWsxV2xia3hZRHF4cWpa?=
 =?utf-8?B?b2c1OUc3RkpVZ1YvY1JaZnk5NzNFM0hsZVl5L3NzdXBYcjE3S090cndmV0po?=
 =?utf-8?B?dWZ1WjBmMitaSDZQNXIvSDEvRExrVUJjL2RFQ1c1MkliaWFNTlpmMGNJcGdq?=
 =?utf-8?B?RXVDeDRYTGxab1hYc3hWbDNxZ0ZDcW9jV2l6YkZlNjlUSW5ZblBBV2tJZ01s?=
 =?utf-8?Q?wS/MF3M3nQo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnN1MGoreXIxVmVkd0hlZytWemErSWw2VHpwWUJBbXdDNXhWRDBRSlVOT3lS?=
 =?utf-8?B?R0VFbjVUZG1rbTZ2YlZXbENIZFFSa0FLZ1lRM2xNVWdrNlYxMnFOay8xanlW?=
 =?utf-8?B?dHpKMHlKSisxbk5nT3ErSjF6NWN0RWo0a0s3YUw0a1JJZHlSTWYzekdLY1M5?=
 =?utf-8?B?ZHFBdGNJSGg1ekhSbnlIbjFHaFppc0M2N0pNZmZ6Q1pSZFpUS3gxQSsxdmJ0?=
 =?utf-8?B?OTU1MktxdUhsYS9hYUpTUmJjQXhWOWhSOFNUVUVIV296L3dYeEtBd0Zaak1v?=
 =?utf-8?B?K1F3cW5oZ1A4TFlwcEpyUEYrek5SMS9uNHU1Rk9VOTBkR0NCa3hLZzNJdXZy?=
 =?utf-8?B?VVZCdy9ZN0ljbXV4TnJFOERldFdaOXdSVml0ZEVMdXkwemtOYWNNbmlqUlRF?=
 =?utf-8?B?aENKUVNMSy9FKzZIUURRTjFRLy9XMEZkYVpLSkRNdHNrZDBDVDZrbzduZWxF?=
 =?utf-8?B?anNCU2N6YUZDUnFVUFZKL2tubDRPc2J4QXJISGh3MUJGYmpHWUtnaUNCQUpu?=
 =?utf-8?B?RXNnem9remd3emxHTWtHVDN2OTl2bm9Cb0twaWhQQ0ljMlNNaG5zTHZLTlFs?=
 =?utf-8?B?bDZmejVCZGNONTRMTFQ3SVdXN3dvdEtKdmNESHQvaWVNcFY1VjRzTTVjSG1I?=
 =?utf-8?B?Si9zQjhtYWFWenJrc2FMVGdRYmRkb2ZhOGk0UVhTbm8rUC9KODRrblg2UitG?=
 =?utf-8?B?OVY0VGpXcThyNDFybS9VY2drSmh0a2p2YkZpU0dKRUk4bUQ4UFBYWnpKUENZ?=
 =?utf-8?B?aGJuT2dtZEsyYWNLNCtPaDJ4cG5uejhGRy9tTlJ1UTFiaVAxTkg1bXJJbFJm?=
 =?utf-8?B?SHZsbXRhWGZQbHhRUjVnR3JVd1ZhVEVaKy9tYmwrQUg2MjNFYTNPTVpUVFRX?=
 =?utf-8?B?MG9QT1FRYUlmQ3VnN1NYWDBpL016Q2VHRXg3R0JJaEtsNldyblo1UktIWGRV?=
 =?utf-8?B?c1FQb2RYR2V0N1hPVlFhY0FGY0JzS2NrT25sclFDSitTMWY3M1lQZlUwY281?=
 =?utf-8?B?WVhBRE1vMEp4YTdQWFIwS1lWbDJHTXBvaitmN1Yxb0gva0crNmxRK1BsZEYx?=
 =?utf-8?B?bDQwSmM3c1FzUzV4aVV2ZW5oV2l0bkZjNENDOGY4c3J4L0x4Mjkrc2c4Q3ph?=
 =?utf-8?B?QVpabm4wc09qd1JmOG0wam9UYmZGK25KbW9xcXAzMGVqSXozQWxpTzlTSHJp?=
 =?utf-8?B?cGdBUFhTUWpRR0tkZ0ZJSW81Q0xRSU5Tc2VhaEFwMVlLNmVhRTh0RVJSSVEv?=
 =?utf-8?B?NHU2Z2h6K2Z5aGxud3AxbmdVQzJFMXU0OGZLbS80U0cwa1dmUy9KOVdBNzhh?=
 =?utf-8?B?Tm1USmM2bFpGdjZiZ3VhMG1PSWNYcm80WXJCQ0lEL2ZEdjNsZ21mdVdYcnAv?=
 =?utf-8?B?UXFtZXphd25PWFpJdTA0MENHR1pkVlZUN1FwQUlnYjZSZjNyV1I0aGg4YXd1?=
 =?utf-8?B?ZW5QcTFmRmRrdXV3MGF2dHJhNnBEMlRVUmJsa2VPN1I3aW1mb3NCSG9XVU0w?=
 =?utf-8?B?VllqNW8rSGVwUVcrN0dIT1h2eGtuZmthTDdjbFlwbmE0b3BzVXB1dms2UDNU?=
 =?utf-8?B?RUxRQU1zdkVnYUdGa0VGK0hJU1Fzbm15b0NLTVhMdk1qM1kxTkxaQXpNZjRT?=
 =?utf-8?B?WHpMZXZ1NmNkMEp5bmVQWWkyVGNUQkRvNkFvQTMvUmxUSWJZRHRxNTlDQm1V?=
 =?utf-8?B?SHo4SGZnQllHU3owY1JMYnNuR1VXQkd5Y2dTVkUxN1ppeUk4T0pWb1RmU0dO?=
 =?utf-8?B?cjNGQ3lRbkpBcmtTM3gzc3M4dFBxOE10eTRVaFVraTFQUk9ZcUx1a3VsZWsy?=
 =?utf-8?B?WUwvcXZza2lZRDBpcTkwMEJoUERGNTlIeis5Ty9FSEdNay9WWTFlSXRjSEgy?=
 =?utf-8?B?citHaGttUnZaZktCNWpRbVY0RDZvNXRValpZTlhWV1NSTXJNazRFK0NRVEJq?=
 =?utf-8?B?RjNKM3dDTFF5dG9wdFV1dUxBMVRNRmRsdEl2NytvbGZ1d0J3NzhyZExhdlpu?=
 =?utf-8?B?eEk1ZkpBM2cxd1BLUUs1V0hzN3dKa2ZUMHpmQktPQWtRNDJ0czJIQ2hLb3Zk?=
 =?utf-8?B?ejVROThETG1HS0NGOEpJWTZnbndVOEYzU3gzTU44YnpHMmhXMUUrdVZTRHFi?=
 =?utf-8?B?Szhwbnp1SnB0Z0VVcjJ5dHNkMk8vT3gvajl4SFhPZGtUb0hpdDlvUVhGWFJO?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5688b664-0f0d-4968-f7ac-08dd9d99376f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:39:14.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9b5g/kzZBxvlOiAEQBn45UYoO/ARhQuzeXUxeVegku0mHmQ+OJ/kCGPzYATyH+ELLIf/AYRKeEo5m24VrfqVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

On Wed, May 21, 2025 at 07:41:39PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   3 +-
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 +++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  20 +++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 159 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  35 +++++
>  10 files changed, 279 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..ad2fb025463a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,7 +139,8 @@ xe-y += \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o \
> -	xe_sriov_vf.o
> +	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..56ade9b7c564 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -929,6 +929,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 902b2e30b3b9..5611cedf3f49 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -237,6 +238,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..48412ebcacb5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -152,6 +152,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int ctx_id;
> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -323,6 +347,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -363,6 +394,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..a773bc4acb6f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,22 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_SRIOV_VF(xe) && !IS_DGFX(xe) && xe_device_has_flat_ccs(xe) &&
> +	    GRAPHICS_VER(xe) >= 20)
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..3ef801a1f117
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta
> + * Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |   Register LRCA with Guc     |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-----------------------      |         |
> + *      |           |                    [ ]  Allocate main memory |     |         |
> + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> + *      |           |                    [ ]<----------------------      |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      | Update Main memory & CCS pages  |                              |         |
> + *      |   PPGTT + BB cmds to save       |                              |         |
> + *     [ ]<------------------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Update Main memory  |                              |         |
> + *      |           | & CCS pages PPGTT + |                              |         |
> + *      |           | BB cms to restore   |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Pause                         |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Restore                       |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *
> + */
> +
> +#define MAX_CCS_RW_BB_POOL_SIZE	(SZ_4K * XE_PAGE_SIZE)
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	int offset, err;
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, MAX_CCS_RW_BB_POOL_SIZE, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      MAX_CCS_RW_BB_POOL_SIZE);
> +
> +	offset = MAX_CCS_RW_BB_POOL_SIZE - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err = 0;
> +
> +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> +		       xe_device_has_flat_ccs(xe)));
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			migrate = xe_migrate_init(tile);
> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..f07bb4741cf2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> +#define _XE_SRIOV_VF_CCS__TYPES_H_
> +
> +#define XE_SRIOV_VF_CCS_READ_CTX	0
> +#define XE_SRIOV_VF_CCS_WRITE_CTX	1
> +#define XE_SRIOV_VF_CCS_RW_MAX_CTXS	(XE_SRIOV_VF_CCS_WRITE_CTX + 1)

Maybe an enum for these. This goes along with some my comments in patch
#3 about the oddness of 'read_write' bool argument to
xe_migrate_ccs_rw_copy.

Matt

> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
