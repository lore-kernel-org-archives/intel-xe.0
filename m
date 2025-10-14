Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FE8CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 15:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8A310E643;
	Tue, 14 Oct 2025 15:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlKQabMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600BF10E643
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760454932; x=1791990932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OJP+p5ivKfJyD6bU/1W1LH46+Hk62yvtha4ZzsdCErI=;
 b=XlKQabMKOXj4Ug7PeAEg+xKE5iuIwq1/1hCdW17vmaIVkrrMXg0AwqD/
 3aorxJy/qRU4a0N5NXBcfc3oXXiLSwEJt5m6ktprz0Vqs5qeYarE/S6QQ
 i3wdW4HriSWYpjckXR8xMm+IM/hmT2zJVlryfBHqafOLjZE2/2v5AMMIx
 ysvTSkb1/vxI5HFtVN/wyxcfw5VNZpMIXiY5agUQgY77s2yNKso9PrgW2
 wWrhcFHjy3aAhhBTxGJzlO2dUDskRQMw06n2sMBTr8gLa5vbNkhxE32h6
 mE4XlCEWEqfN19UtQd1wrt61wtHMcQABhsq0RTgyrHsbh4b2zqMloEfOm g==;
X-CSE-ConnectionGUID: ku+cVBNkSQaT8P1ZlTuouw==
X-CSE-MsgGUID: Ptd2r3TTRIuDFOc9PwJfxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="65238771"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="65238771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:15:32 -0700
X-CSE-ConnectionGUID: ue8x4Ee8TeWzfaQZWWPjHg==
X-CSE-MsgGUID: A0SPNd8tRLmhqF5EiZVQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="187213240"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:15:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:15:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 08:15:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vk1OW79/T+QZ275gbvM/YegPbNqFVOoaAxxcmpWkUBTJNpnSId3EqckRzMofBFvgGxJ1yCP8oBxRvk+KqHHfAhh+7yOaU85tUbGGf/tazF+oqTJsB21sz3MNaQwHneIzQWUy+N5hnyHMLRy5nVzuO5DNaLqKoctw2agzNVS6c2k7JtRoe+066HGEg8HjBFNMgvn+C5f5YzC5QvWZBRMYOYjp52NiLu2x0Q/F9eo8VUfvgrioVP0yKyguVvc/vw6CNGovqPanBhTrpTUotjgX64fFGQgo4sRhcVyCKfuHB5VGl/HFz3jPkIHsNuvUQJdsBuj49RYJS+TSt7ckf14rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJP+p5ivKfJyD6bU/1W1LH46+Hk62yvtha4ZzsdCErI=;
 b=TLhW5uo/4vGdeOeD7sJuoStKZi8VpXQi9Crj12DI/FMlZML+ZbRlCoyzkfECfevPJtpxUf4Od2yMf2ahHAAVn39pOKVFBoVV7fryx0eXK7m3rRQrieur3CZiwTiPKp86SB8AJzV8vdSI5kro6SEC4T29TEHW8WUFA+cM/1zu6HL6/litLeEyxZlmj1SaWy3FC6t3Fgg1jszb15OBBUFQXesSZAHjJxNAMnR2afsSHxC+EqaWzERrzEq8bmzZQEyPzMVR4dZ2/QwnFVrTtXztX034KlQZEgRPLUG+wuY8ANRRocZWaHeRbsFe/7Zys4nMXn+O0hsgSF5r+VKsI2qqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:15:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:15:28 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Thread-Topic: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Thread-Index: AQHcOgt07V6eeBEepki4Cp06wSlH47TBXWgAgABllWA=
Date: Tue, 14 Oct 2025 15:15:27 +0000
Message-ID: <DM4PR11MB5456166C345BE2D6D7E72944EAEBA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <20251010172529.2967639-2-shuicheng.lin@intel.com>
 <9d6c807a-0d7a-4141-abb0-0ea115666614@intel.com>
In-Reply-To: <9d6c807a-0d7a-4141-abb0-0ea115666614@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: ec070168-9f88-4f88-c0ad-08de0b348205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZHdtandKZVFQcTJzU0JZbzJLSXFqRmE2dXFxNlhkNUhzeDNWTFk5VjlhU1FV?=
 =?utf-8?B?VVE0a2pXejFENTU5c0JVNXFLZ1ZXNlpUeUh2M3gyOEEvS1UwU2FZa3FVMUNG?=
 =?utf-8?B?eDZOdW92QXpJRkpUQmZOM2pmNG03ZkRGL21aRGlqYnlqVDI5YXpvVUlaNVlQ?=
 =?utf-8?B?aDZuNHJzcWk1aGNTTXZOUlBuaGRRUWFiUjBNSk5OLy9oS05VelpBY2xQak03?=
 =?utf-8?B?cWNSbHBENE9KTSthVG5PODFXNnBSRzNMUTdMMStENkZ0U0dIenZXMWNXVGZv?=
 =?utf-8?B?MkQ3cTZGa24rdEFJc1ExNnB3SFZpU2l3TTBLRHNad3FOa1hHb0ROTExSaXhy?=
 =?utf-8?B?NXdUclUyOVd2b0dsOGtzaVh1MGkzL3NXL0pacEhEaWdCS0o5SVlQVXZiTUtD?=
 =?utf-8?B?ZDNEM2t4eWdoR0FJaW1wNTVhVUpNUHhaSXJBSDNKNmpwQUN2RjVRTGVsOG1M?=
 =?utf-8?B?c0ZmY0M1ekxUVFgxUFRoWUhkTlBtVy9nSW8vUUpHU2lxcWh6UE9HWC9uMWg0?=
 =?utf-8?B?MkdvWWh4czlJaE05dFV0eFFUTCs1bmhiQWlYREZ5VGJseHdIS1NCWGJ2NS8x?=
 =?utf-8?B?eTNMeTM0bGVBY2V1SC9TdlZwaEJnTXVFUWRFZWVDWnE5MjV2SDQzbGppbTdn?=
 =?utf-8?B?UlBUL3hiYm41Zm5tMEVXUnpmSktzUCtRa3MrMWFBUThLVUZqRnA0RFcxU2U3?=
 =?utf-8?B?UkxVYzM5aUIvUHkyVkRlbENCbUVHTXExM0t6aUJBdXljMGQ2UVFZcUZHck5q?=
 =?utf-8?B?dUtUbVVjMEtiTERBR3FCZmh2cnVaSnExMGZpMDlnZU1TN1ZBV1pxc1F3S2tp?=
 =?utf-8?B?RWRsSWhmRkl6dnAvUVoxMEJma0xDaks5VzBGcHo2cnpLV1ljZ2tKUzA2N3lj?=
 =?utf-8?B?N0xLNWtyWFEzcTlhdHJMUm05dWxHVFJhSEo3bDlnWk1rQ3FqeVloMCtBUDVZ?=
 =?utf-8?B?V1lDY1pHTVZmNlFZcnZQbUh6WXlqL3VtdXdEY0hacWtNL2oyVklpVVVqZnFH?=
 =?utf-8?B?dnl1WU1TeHJoOUFPRGpDTk9Hbk5tVjZTelNXdmpEZDZCNTA4eDFOUTVsZDVH?=
 =?utf-8?B?OGtVSktQSkJNSnJDREFYWDFZQU9Bc3JqRU1BMFF5c2prM3JzZWo0Z3FvZHZq?=
 =?utf-8?B?U3hSNERnaDR4N0I1STAva2xvMTZKNXJzU2pDU05EUjhwM29CaVhUaTdLNzlm?=
 =?utf-8?B?K005RjNVTlp3RFhxYk5yN0phOWY3TlN1Y2I1bmQ4NWZhM2VtUUc1RVFmQnJ1?=
 =?utf-8?B?K1RMbTRGR0lOTUVUWEUvRytXamNXd1lmTG5DenFkRnAyeDRvdFJiaVBCSHQ0?=
 =?utf-8?B?RVpGNG9LUVpNSWlzMU9GL0FCM1JiZld2SXVmblRKcE1qbjJqTjV0TThCb3Vk?=
 =?utf-8?B?R09SbUwzZ3JnaFd4eEU0VU5pb1VxMEFzb3FjTFZpOTJZZUpFNEg2V2ZWMmF6?=
 =?utf-8?B?NXlENDJ5REVSTEI4ZExvUjNMZ1graElEYkFseXdZSHJhWTVsejZOTkJiQ05x?=
 =?utf-8?B?NExQUFlOaXZrV3lPRWlGdXFveXg0OXdjZm9xcUhRK3VnTzZQbGphUk1aY3hG?=
 =?utf-8?B?empkb3laYkJraWZVNG5xNzY4ZVhqOENMaEg3MTNEaHh3RXQvUExFczZBSTkz?=
 =?utf-8?B?S1U5U1NHdFJ3T1ZsM1NyazNTQWVjUnZxZkt2K2FUeDBWOUJMa0hPaFR6NGdD?=
 =?utf-8?B?bWx6V2U3OEFtWWFvbDEvNXAvYmp6WWdmOWJOMTBJZmdUQ2pLRm5RZURVZUVr?=
 =?utf-8?B?cnIycXdmSGZ1T0hKcEE3YmpUYXNxbWNnRTk3aHlGY0pKZjhFTk16MnVzNzZH?=
 =?utf-8?B?a3VoKzBMZGFpaWVGQTh4bjRucmg0NDNCSVkwaU01eUJiMStrL2VqSlpuWDVD?=
 =?utf-8?B?cDNlcEYyaE9mQnpOWTBpYUhVVmppSDAyS3prdnpsWjROZHFpSlBjSWFpVWww?=
 =?utf-8?B?OHFUQ2Q4UzZFYjhMY3FaSG5TazhvZzBmdHlKYW9LdUJMUHcxdU1Pd0lsbEZN?=
 =?utf-8?B?eWZiL3dVSXRpdTlJNHJHTjg2OEl0c2RWZnBuRGo2S29WL0k3MkNxSXU5T2N5?=
 =?utf-8?Q?HjGcdy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1ZpRmkwanE0cWJ1QzZ2Q2JIYVI5S00rc3ZDK3ZoQUl2b2lIa044Tms0T2xM?=
 =?utf-8?B?T2pNcWozRlFwTzNXNDZMUWZYV2pLZVhDYUpEcUFMei8zNy9NVHgwV05oSUVR?=
 =?utf-8?B?clpFR3lQR3l1WVhFODFEUU5oTmpIVWpIWVczWWhvYmxhbnN1aWVpcFE3MEEx?=
 =?utf-8?B?aFpOQnEwTGozcGpnWnJ4WTBodjFPSDFiNGRleDQvcFZlb3NqNmo0cGtpeU9G?=
 =?utf-8?B?QmFiWEtsVVVmNzlDME9BdFVMd0lCY0hFdVVZaGZFeDBKa0NidW9CSFBsUnZE?=
 =?utf-8?B?VHYyNWo5SEt4NVZjVTliTTBWUWlDZGNCc2luUTdNTVdJajM1emJzdmF1aTFq?=
 =?utf-8?B?SmNVSU1lZG15RThEZDBzUmdrWlZOWXVsbmtmVEpubTU5NzVvaXpMZUg0K0xJ?=
 =?utf-8?B?cHBVOVdpeSs1TGFDL1VkM0ExckNaUnR0aW1ZTjZOY3FTS0krWGRQOFl2S0pj?=
 =?utf-8?B?eUMxbnRoaUtDUzdDWE5nb1Q1U0xoMGgvKzBpOEE4Ylo2aVRCSmY4dEFjT3NU?=
 =?utf-8?B?VmZMK0lOYWJGK1dQcDhwYVNCdFEwZTlnTEJDMjNMWFRPNk95ZWt3M3oxdmZr?=
 =?utf-8?B?WnNwNFdmeWNtaW5SSTlRekhyYUwvMzN2Y3crWWRnWE1RQjA0ZjVQTllxbm9F?=
 =?utf-8?B?YW5TL2RmYlhSdS95SngxeWI3MTRiYzhCMlZEdHkvTGpISFNhMmZqQUcwRXls?=
 =?utf-8?B?RjRmdjFLb0JBbEZXSGp4T1d3UVExYW9oY1BWQXloMXNhZVBoU0lYZFFzNDZj?=
 =?utf-8?B?Q3QzTlR1cHB4eWdiYURUb1FrMGV3aEFqRFFKbHpGU1A2ZWhwZlVHV3NHbkFE?=
 =?utf-8?B?T0FQUnlrMFpGN2hoZmtrT3gvWDYwaENTVVNkNTRwZXJsOE1DNHZZSEdDRy9O?=
 =?utf-8?B?Q1NsRzRvQU1MQkhQZjRacENaNWJZdlduRUQ2ZDdxZ0dEMXJnQUc0M0E3TXJx?=
 =?utf-8?B?SU45ZnptTVg2ak9RdFNQWk9GL0paM3BSL0xodWFIK1ppVkxaK1UyL2NHYU1m?=
 =?utf-8?B?dm1TN0FJUFpzY09KMGo5TTVuVnY5TVdWTk5ZQWhmUTFaUlc4ZUh1N0xuS3hP?=
 =?utf-8?B?bFNWTmRVeFJHRlMyQWJucG1RVGF2dnAwUEV6c3Y4UmtCNWdGZkVqLzEyUHMz?=
 =?utf-8?B?RTBrRnBZMGF6UVh5TGpqUFRQZ0hoZ0xnN216dmIvZ0tFT0NjYmRpdWh1bnBw?=
 =?utf-8?B?N1JoeGpPQ05rQ1pDdnE5Tis4VHl3RDNheGtNd0FmdzByejNRc2dZMkZ6Q1VP?=
 =?utf-8?B?RzBEeXFQa2FZMk1KNlJtUWFDSlVvcTRUK2E4cXUzdm1DOWFGSnloU0tuTUl5?=
 =?utf-8?B?M1pXOEEvNVZzenhPR3UvVXVSV09Eak9DdjNiRTBaNHZsb2QxdEl6WTdTdUMw?=
 =?utf-8?B?ZjM5VUtocmFvLzJSbEFnVVZSZmdCVk9ZdlhQa3g3QzBhT2V4dmJUZmNkWFIr?=
 =?utf-8?B?SVRIZG5EN3FYdUQxdWtVWVhFNGlWa3V3TWFMZEZRNEU1WHJhZFAxSW4zeW9v?=
 =?utf-8?B?MDVhamdLTEZxNmNWdnZyc29NdUtUeHhvNXJ5bVZXTWpPNHY5dVkyNVgvcDlN?=
 =?utf-8?B?bEZrNitvMmhzOWQ1aVczam9ZUGI0UEF6aHdlakFIaVFhWW10LzlwT29OMFZu?=
 =?utf-8?B?RVFQMmU4NTIxNjNUZDBsWnFUby9NY2ViTVZ2bFFDR3Q3REE5SVUzUXdWcTZs?=
 =?utf-8?B?TlozbEw5R3UxZnVGMVovejd2V08zWnRpMW45Wm11YkhxRWU2bDExRzA5THpx?=
 =?utf-8?B?dDA4YkFlRFQ5MUptZnQzQ2cxS291Qks4Zk1nblNOTlVOVWVVcnAyYlYwUXlN?=
 =?utf-8?B?cjNWYmVkSytpdUs3VnRESjBiNTd3T3hPajBsbS9CU044R2ErRzFZdTNWTDF1?=
 =?utf-8?B?UGRaZE4vRFZOendPL0szUUM5Y00yM0VGNnBTcjc5dlNVRkxFU3MvRmVIelFJ?=
 =?utf-8?B?WWE0U2Q3MDhiNkhoTFo2cEVCVXRyYjJtU0xabjNkMTMyMExrWWRxektUZnBT?=
 =?utf-8?B?Z3VSa0RBcER5djBNQlBTTUlzM21qZ1RMeUp0VEwrYUtSdXVPSkdNZW5SWmlv?=
 =?utf-8?B?Vzg5ZG1LamgxRzVrZk5DNmRXdDhtWit0bTNCd29Tayt5b1htZGlwMmlpdGNT?=
 =?utf-8?Q?F5FQtZPY/d4iUbtZNj1qFliAR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec070168-9f88-4f88-c0ad-08de0b348205
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 15:15:28.0484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JE5RyDw8vUJGI6VmltzMNLAx7kprLKk6Jdywx5jflMxJ+WeFYLl88qFm74E2aWHgIx5v/I7cWSSDpRwx88zV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

T24gVHVlLCBPY3QgMTQsIDIwMjUgMTo1OSBBTSBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+IE9uIDEw
LzEwLzIwMjUgMTg6MjUsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gSW4gbm9ybWFsIG9wZXJh
dGlvbiwgYSByZWdpc3RlcmVkIGV4ZWMgcXVldWUgaXMgZGlzYWJsZWQgYW5kDQo+ID4gZGVyZWdp
c3RlcmVkIHRocm91Z2ggdGhlIEd1QywgYW5kIGZyZWVkIG9ubHkgYWZ0ZXIgdGhlIEd1QyBjb25m
aXJtcw0KPiA+IGNvbXBsZXRpb24uIEhvd2V2ZXIsIGlmIHRoZSBkcml2ZXIgaXMgZm9yY2VkIHRv
IHVuYmluZCB3aGlsZSB0aGUgZXhlYw0KPiANCj4gV2l0aCBmb3JjZWQgdG8gdW5iaW5kIGRvIHlv
dSBtZWFuIHRoZSBkZXZpY2UgdW5wbHVnL3VuYmluZCBmbG93PyBJZiBzbywNCj4gd291bGQgaXQg
bWFrZSBzZW5zZSB0byB1c2UgdGhlIGRybV9kZXZfZW50ZXIvZXhpdCBBUEkgaGVyZT8gQ2hlY2tp
bmcNCj4geGVfdWNfZndfaXNfcnVubmluZyBzb3VuZHMgbGlrZSBpdCBjb3VsZCBiZSByYWN5Pw0K
DQpZZXMsIEkgbWVhbiBkZXZpY2UgdW5iaW5kLg0KSGVyZSBpcyBhIHdheSB0byByZXByb2R1Y2Ug
dGhlIGlzc3VlIHdpdGggQk1HOg0KMS4gUnVuICJzdWRvIC4veGVfZXhlY19iYXNpYyAtLXIgb25j
ZS1iYXNpYyIuIExldCB0aGUgcHJvZ3JhbSBzdHVjayBiZWZvcmUgZGVzdHJveSB0aGUgZXhlY19x
dWV1ZSAoYWRkIGEgc2xlZXAgYmVmb3JlIHRoZSB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koKSkuDQoy
LiBVbmJpbmQgeGUuIChzdWRvIGJhc2ggLWMgJ2VjaG8gLW4gMDAwMDowMzowMC4wIHwgc3VkbyB0
ZWUgL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvdW5iaW5kJykNCjMuIEN0cmwtQyB0byByZWxlYXNl
IHRoZSB4ZV9leGVjX2Jhc2ljLiBUaGVuIHRoZSBpc3N1ZSBvY2N1cnMuDQoNClRoZSBsb2dpYyBp
cyB0aGUgZXhlY19xdWV1ZSBpcyByZWxlYXNlZCBhZnRlciBkcml2ZXIgYWxyZWFkeSB1bmJvdW5k
LCBzbyBHdUMgaXMgYWxyZWFkeSBzdG9wcGVkIGZyb20geGUgZHJpdmVyLg0KQXMgdGhlIGV4ZWNf
cXVldWUgaXMgc3RpbGwgaG9sZCBieSB0aGUgdXNlciBhcHBsaWNhdGlvbiwgaXQgaXMgbm90IGRl
c3Ryb3llZCBkdXJpbmcgdGhlIHVuYmluZCBwcm9jZXNzLg0KQW5vdGhlciBwb3NzaWJsZSB3YXkg
dG8gZml4IHRoaXMgaXNzdWUgaXMsIHNob3VsZCB3ZSByZWxlYXNlIGFsbCBhY3RpdmUgZXhlYyBx
dWV1ZXMgZHVyaW5nIHVuYmluZCBhbmQgbGV0IGFwcGxpY2F0aW9uIGZhaWwgYXQgdGhlIG5leHQg
dWFwaSBjYWxsPw0KV2hhdCBpcyB5b3VyIGlkZWEgYWJvdXQgaXQ/IFRoYW5rcy4NCg0KU2h1aWNo
ZW5nDQoNCj4gDQo+ID4gcXVldWUgaXMgc3RpbGwgcnVubmluZywgdGhlIHVzZXIgbWF5IGNhbGwg
ZXhlY19kZXN0cm95KCkgYWZ0ZXIgdGhlIEd1Qw0KPiA+IGhhcyBhbHJlYWR5IGJlZW4gc3RvcHBl
ZCBhbmQgQ1QgY29tbXVuaWNhdGlvbiBkaXNhYmxlZC4NCj4gPg0KPiA+IEluIHRoaXMgY2FzZSwg
dGhlIGRyaXZlciBjYW5ub3QgcmVjZWl2ZSBhIHJlc3BvbnNlIGZyb20gdGhlIEd1QywNCj4gPiBw
cmV2ZW50aW5nIHByb3BlciBjbGVhbnVwIG9mIGV4ZWMgcXVldWUgcmVzb3VyY2VzLiBGaXggdGhp
cyBieQ0KPiA+IGRpcmVjdGx5IHJlbGVhc2luZyB0aGUgcmVzb3VyY2VzIHdoZW4gR3VDIGlzIG5v
dCBydW5uaW5nLg0KPiA+DQo+ID4gSGVyZSBpcyB0aGUgZmFpbHVyZSBkbWVzZyBsb2c6DQo+ID4g
Ig0KPiA+IFsgIDQ2OC4wODk1ODFdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0t
LSBbICA0NjguMDg5NjA4XSBwY2kNCj4gPiAwMDAwOjAzOjAwLjA6IFtkcm1dICpFUlJPUiogR1Qw
OiBHVUMgSUQgbWFuYWdlciB1bmNsZWFuICgxLzY1NTM1KQ0KPiA+IFsgIDQ2OC4wOTA1NThdIHBj
aSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdUMDogICAgIHRvdGFsIDY1NTM1DQo+ID4gWyAgNDY4LjA5
MDU2Ml0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAgdXNlZCAxDQo+ID4gWyAgNDY4
LjA5MDU2NF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAgcmFuZ2UgMS4uMSAoMSkN
Cj4gPiBbICA0NjguMDkyNzE2XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0g
WyAgNDY4LjA5MjcxOV0NCj4gPiBXQVJOSU5HOiBDUFU6IDE0IFBJRDogNDc3NSBhdA0KPiBkcml2
ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmM6Mjk4DQo+ID4gdHRtX3ZyYW1fbWdyX2Zp
bmkrMHhmOC8weDEzMCBbeGVdICINCj4gPg0KPiA+IHYyOiB1c2UgeGVfdWNfZndfaXNfcnVubmlu
ZygpIGluc3RlYWQgb2YgeGVfZ3VjX2N0X2VuYWJsZWQoKS4NCj4gPiAgICAgIEFzIENUIG1heSBn
byBkb3duIGFuZCBjb21lIGJhY2sgZHVyaW5nIFZGIG1pZ3JhdGlvbi4NCj4gPg0KPiA+IENjOiBN
YXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxMyArKysrKysrKysrKystDQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBpbmRleCBlOWFhMDYy
NWNlNjAuLjBlZjY3ZDM1MjNhNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiA+IEBAIC00NCw2ICs0NCw3IEBADQo+ID4gICAjaW5jbHVkZSAieGVfcmluZ19vcHNf
dHlwZXMuaCINCj4gPiAgICNpbmNsdWRlICJ4ZV9zY2hlZF9qb2IuaCINCj4gPiAgICNpbmNsdWRl
ICJ4ZV90cmFjZS5oIg0KPiA+ICsjaW5jbHVkZSAieGVfdWNfZncuaCINCj4gPiAgICNpbmNsdWRl
ICJ4ZV92bS5oIg0KPiA+DQo+ID4gICBzdGF0aWMgc3RydWN0IHhlX2d1YyAqDQo+ID4gQEAgLTE1
MDEsNyArMTUwMiwxNyBAQCBzdGF0aWMgdm9pZA0KPiBfX2d1Y19leGVjX3F1ZXVlX3Byb2Nlc3Nf
bXNnX2NsZWFudXAoc3RydWN0IHhlX3NjaGVkX21zZyAqbXNnKQ0KPiA+ICAgCXhlX2d0X2Fzc2Vy
dChndWNfdG9fZ3QoZ3VjKSwgIShxLT5mbGFncyAmDQo+IEVYRUNfUVVFVUVfRkxBR19QRVJNQU5F
TlQpKTsNCj4gPiAgIAl0cmFjZV94ZV9leGVjX3F1ZXVlX2NsZWFudXBfZW50aXR5KHEpOw0KPiA+
DQo+ID4gLQlpZiAoZXhlY19xdWV1ZV9yZWdpc3RlcmVkKHEpKQ0KPiA+ICsJLyoNCj4gPiArCSAq
IEV4cGVjdGVkIHN0YXRlIHRyYW5zaXRpb25zIGZvciBjbGVhbnVwOg0KPiA+ICsJICogLSBJZiB0
aGUgZXhlYyBxdWV1ZSBpcyByZWdpc3RlcmVkIGFuZCBHdUMgZmlybXdhcmUgaXMgcnVubmluZywg
d2UNCj4gbXVzdCBmaXJzdA0KPiA+ICsJICogICBkaXNhYmxlIHNjaGVkdWxpbmcgYW5kIGRlcmVn
aXN0ZXIgdGhlIHF1ZXVlIHRvIGVuc3VyZSBwcm9wZXINCj4gdGVhcmRvd24gYW5kDQo+ID4gKwkg
KiAgIHJlc291cmNlIHJlbGVhc2UgaW4gdGhlIEd1QywgdGhlbiBkZXN0cm95IHRoZSBleGVjIHF1
ZXVlIG9uIGRyaXZlcg0KPiBzaWRlLg0KPiA+ICsJICogLSBJZiB0aGUgR3VDIGlzIGFscmVhZHkg
c3RvcHBlZCAoZS5nLiwgZHVyaW5nIGRyaXZlciB1bmxvYWQgb3IgR1BVDQo+IHJlc2V0KSwNCj4g
PiArCSAqICAgd2UgY2Fubm90IGV4cGVjdCBhIHJlc3BvbnNlIGZvciB0aGUgZGVyZWdpc3RlciBy
ZXF1ZXN0LiBJbiB0aGlzDQo+IGNhc2UsDQo+ID4gKwkgKiAgIGl0IGlzIHNhZmUgdG8gZGlyZWN0
bHkgZGVzdHJveSB0aGUgZXhlYyBxdWV1ZSBvbiBkcml2ZXIgc2lkZSwgYXMgdGhlDQo+IEd1Qw0K
PiA+ICsJICogICB3aWxsIG5vdCBwcm9jZXNzIGZ1cnRoZXIgcmVxdWVzdHMgYW5kIGFsbCByZXNv
dXJjZXMgbXVzdCBiZSBjbGVhbmVkDQo+IHVwIGxvY2FsbHkuDQo+ID4gKwkgKi8NCj4gPiArCWlm
IChleGVjX3F1ZXVlX3JlZ2lzdGVyZWQocSkgJiYgeGVfdWNfZndfaXNfcnVubmluZygmZ3VjLT5m
dykpDQo+ID4gICAJCWRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKGd1YywgcSk7DQo+ID4g
ICAJZWxzZQ0KPiA+ICAgCQlfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koZ3VjLCBxKTsNCg0K
