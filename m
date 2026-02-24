Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C47EFB7E4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 02:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993B010E0A9;
	Tue, 24 Feb 2026 02:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzB+vDTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7810E0A9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 02:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771898590; x=1803434590;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FrlK9zsq1oRcSU53mD4+wqRZ9NjZjZW275Q3B9Ni19I=;
 b=bzB+vDTbI4TPzHMQHHZ0so15TIP9PaYu68Olk95ZDd+lYJapR8QJsaOK
 Z1/1hdPiWuF+94a5zINaiBi1sBBngZtETtB3junsZXl9YJ3KiKCF9qTE8
 xp2nYtuNyY8v3qhaskw0yc6iagEcQrxYeV/Evq/0dWUZWlMAMFNh903rZ
 AdgXpriIfNtDp0r2e22TnekwrsTya62JZehdvTpyT/aK7iu1pDUKCSxds
 Kv3ZhnibvfrBwwXBnn5mEq4HdB6AXVOKwKxZXPwGkuU2II+VF09wOgq5I
 T19mPw5pqq+2Yo12FCSpqvIT3lCC5nxr4Bya3nGGMzBJFgcXCxevRHgPG Q==;
X-CSE-ConnectionGUID: QMYayb+TShSuLp3IJs0baw==
X-CSE-MsgGUID: m5RKaWcaQYGWIksnVC+deA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73014191"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73014191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:03:04 -0800
X-CSE-ConnectionGUID: UqbqrfCMSla5rwhMcaJ2Qg==
X-CSE-MsgGUID: VaCx7H+sTwSXANDesgfmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214127169"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:03:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:03:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 18:03:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:03:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0gAePmM25CV9H9wngiMO9+XFQFjoFQ6arOqrZaf7PvTWZUUUBx3zWMjTP2Hwmi8hgyXo7bvZomIdyvQ75g3StuI5N6aF3vGwC2LL/3/v/6QOvdXXxtfOGj5ujWojpGiZoV1OKNy4/ydv3z95t/uCaUN9LKwoQZupfG3kWfEx2FgNX0EnbiAK5+93yUhRXa0ugbYE76w2DCN1PvP8Bsm8OLB/rhMkaY5QJnqX+GeNSeOourbMMMpuJIbYNIe3uhonBjrXoZoiQ3WeTlJyL67LwjeZOnRZe6Um7uDy63qpySSOa7JlQZJa3PvkgV/phCtjhUlzhj8SOBYb/2r0OMTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHa5vprydiRVa8TDnMBSjzwH+SIV/XkL5ZhC5epmink=;
 b=l4dDdh9Xe0rofIPSx6fDujsWMeCOfAFYU48K3pkThEWESxX1hgpgTiVcO457ZLzbloPnS16pDia5/bVkhatMwr4fsewFmhEUxEExg7tyNrs4xgEKM4Oy2Vl8nRvmRQj0KEoKs/7/36YpPQjyWjHs1c/VcYu9bmJPUFf8ceqg+dbDmZkVLWT5Uuf9l4fegSdsyWQL11EWHXpWXUe+TmkPiI9r9ODXeW/QNuubUa1Cz+NOL/tCm8NizOiOJFDryGVipjgLP1Qm6rJxjc7VXIuCMedZ33i8VwfdQNrYEG2Rm0DaUEkBzd+S5afF9Jn9dQNTA+GpdbL+sJNJv2OsuwHCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:03:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:03:00 +0000
Date: Mon, 23 Feb 2026 18:02:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aZ0G0lw+NCrP4bu0@lstrano-desk.jf.intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
 <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
 <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
 <SA1PR11MB88390D32C4A1C2BDC6629BD3AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aZ0Csw/3hh2Jv1/k@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ0Csw/3hh2Jv1/k@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:303:dc::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5073de80-64c0-4e15-6fa9-08de7348d67e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnNjWGhibFFWYWhORXY4YlNsbkpIWnpQSmxBTWk4YmtWZ05JTmR6cWhRYmpt?=
 =?utf-8?B?QjFMTDZvYlBhbGk5bW9SR25udHVweWttc0tXSGtIR09wNFRJY2JzMjlIc1Vn?=
 =?utf-8?B?NHJ6VE5VMUpMcGRtUXZpQ0c4QzArNHFjbWFQUFVsV3BWTXhuOTBUSDI5YnlE?=
 =?utf-8?B?ZUlteTUvMmlFcTQ2c2E5VUNadngvRWxGUys0Y1ltZDYrWm1nN2tVakxmeUpq?=
 =?utf-8?B?a3Z2Yno4OUVMRkpMaWRHNVRnTDFFd1lYYVlVb3lSTTdKSy9jRVZFK3I0bzdC?=
 =?utf-8?B?Z2oxOHh6Yy9WSklqYmpCZ1RveE9rUWYvSnBINHU5a3BleSs4a3krM1BkSldZ?=
 =?utf-8?B?dG04T3d2OVNUc2lITHkzcGV1NEp5R3QrL1JTeitHN09GK1orMFJhMGN2bzJv?=
 =?utf-8?B?aXN2OHNwMTdaeUR3dVpHbkdKZWppL3F0V1oza0N0RGM1blBzOUIrMnliR0NH?=
 =?utf-8?B?N0tjS2RobUJHV2pudHMzd0pmdTFHRkV0cDVqU2tnalJINmltV2c0Q205Qjc5?=
 =?utf-8?B?SkVpSytkVlVTZUpCRVF6bHQvVGpVUUk4Zm45RXl5aHBBSmZVZ1Yvd0N0MW5q?=
 =?utf-8?B?SzM4cG9vVlJnbU92VHZkTUhhc1NQdzFwY1ZvN1ovaWZORFAzckNXQWo4a1hF?=
 =?utf-8?B?UWQ3VGJicm0wZUF3aVk3WjlHM2VwNjROK05JT2tVa2cwNEY1ZWgyc3N6Vnhp?=
 =?utf-8?B?djFHbTk2bnBZblFvd2ErUE1ackZFWUtOVTd2QnJTbUN5WDE3WTBLbmVjSG1v?=
 =?utf-8?B?cVkyTlFOcmpMd0xBTHVYUCtnbVZwSFdBcGZFdXEyazVoRHlyaEF5aWFTODFk?=
 =?utf-8?B?RkJEN1hEMWJDMTNPdEY1UmRaZ1lwYUl1QVcrRmdENys0WHVLR2FrRU0rcWF4?=
 =?utf-8?B?eXJ5UFRmOUlKdklNWmh3cWNubnJETTFhTzBhUU5vMkxWYjM0Y0ErZ29SVzVv?=
 =?utf-8?B?L1RvN211Q0Q3Z3U3c2szcGFkanI4WTNueW5hYTY1TkpXUjFWTTNQTmZhNGVF?=
 =?utf-8?B?L1EzeUE3Z01jOFFVS0ZTekZXS0dueHhqNndYakpPWjJUVlRISURMUENBNXJk?=
 =?utf-8?B?NDBMYmwxZDhhbzRWTkVPL1d3VlRKVE5CS0pHbWtSSjZkbkxnS1hWMFNrVGVx?=
 =?utf-8?B?SmxCdGdRVUJKK09FR1htY2tSRldGeW5lNTFOZklQOXRFZFU5V1dQNCtnZW51?=
 =?utf-8?B?akF5cytTZlJwTXBobk96bWhVS1pBSitEcDRpNnNqTU1HTFZHYUo5My9zZHNu?=
 =?utf-8?B?aUtBZERTTWZvQzZ5aUNzeXMzYzUvMDlLVGxHdmVTck9QS0NzSC9PVjl0VFBl?=
 =?utf-8?B?V2pxSllPbW9xSGRzcEF1aDRSUkZJN3ZlVTk2R01nWjNFS2tvNXY0M3R5UG9R?=
 =?utf-8?B?a0xIayt3amU1TzZIc1RSVWZwNU04TjBvZzR5Z2VPQVR1MlZmblBBSGRDMk1k?=
 =?utf-8?B?MEc0aXdCTVd3eUZpM0JUTGk5VUpjOW01ZTdsODRiczdoYitsMThnbTJZTXhW?=
 =?utf-8?B?ZHJReU1tTmsvQytCaWVZdEJpWXduTXJDb24wbWxiM3gwc1NsTkRKTUw2N1pT?=
 =?utf-8?B?Y29TbXEwVzQyL1o2UC9tQlhqWVJWY1ZHSWwyL2p3QjNBU2xBRTRwaGRudjVE?=
 =?utf-8?B?T1F3bjFlRXJCc3ovSnRqalJyN2RKUzlmWGcwQTdBY0x5WkF0L1dreFkwWnht?=
 =?utf-8?B?R2kyU3hOTkNMVzlReDgxeHVtU3VlS3EzYmFjVzdaYzZMTkJveTIyaTVONCtt?=
 =?utf-8?B?UXJzQ2E5djAvZTA3STFiRFEydG9jWGlUZmdzanNISTZlQm5LcHpmMkYyeWc0?=
 =?utf-8?B?T2Rjd0NFYkdUQXNCWWJhNElJR2xZZkdyeC9iSFkwSTlmNnlTSS9tVlFadkNu?=
 =?utf-8?B?a1VpcEdOUnVpWGNzYUQ0UXVlYjIwMWJ4WFc4b042WmtseDd5dFdnRzQ4RTNE?=
 =?utf-8?B?MlZvWHVCTjc1bm5uN0RrWlNRLytVVzF1OTI0V0hzbFpLYjVaZWZ1SEhOeWdF?=
 =?utf-8?B?TmJCV1U4VnBOUWg4WGJ3NGFJU2JsTUNsUUVDZ3d3ZEpZOWdZMjhSUnZIeUdT?=
 =?utf-8?B?akNWaU9YS1c5Ky9nY0tuM3QzV2JSSWw0QW1FS21pN0U0cVN1MjdVOGtFMXI0?=
 =?utf-8?Q?rDpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUIrazl1blJIbW1CSVZTRG9Ka1UyQTJYaTlhc1lkVTlqV1Rrbjhpb0pYR0VQ?=
 =?utf-8?B?NFIvcGtMTHphUU9TZEUvM0d5azlVQVBSZzFtdnJEN0xZaGNVaytLdkVxaVY0?=
 =?utf-8?B?VGxaR3YxSHk4VE52cHVxWWNNWUdYU1ErZVcwbVc4aFJ4ODZRQVhoRnJwajlX?=
 =?utf-8?B?M1cxVlJMWmtBc1JqTExKa0Rvc1BOVElOQUNneUlzeFpyWERFUytqQ0Z0NEpy?=
 =?utf-8?B?Z2h1K0JFdWcvUEZ0NDBleGdOcVExakdIQlllRzM1R2EvODJDaHIxekcrRVMr?=
 =?utf-8?B?M1pSMjhvakpFaWcvdDVRaXRqSnJvb0ZCUFYwOXZVaDF0U3o4T2FLMnJBRkg4?=
 =?utf-8?B?TlRzTWdLWVNKTXhneUpMaGgzTVkzZS9FS2tHWGpwQTJSRExlcy83WmQ1TE9T?=
 =?utf-8?B?R0gzSTlUWFgxL2pxQlJMdEVRQktydldmdGNWMG9IaWpOcTFtb0hLcCtyLzJz?=
 =?utf-8?B?Y3dKbXdVbFBLbkhBMFcrblFJRytFM2ZrNFpNZHdaMC9NMUl3bFZnaGpmMy80?=
 =?utf-8?B?OHBkVGFhajlUUHo5dENOYWZ0ZzJ3YnFiK204c1ZueEtqR2JXUFFiQmN5RlpR?=
 =?utf-8?B?cW1NOHZLd3VlOGE2NnRmSWkvM0w5K1JCMmhWeGRnUXpBeE5iS3daQXFrV0pL?=
 =?utf-8?B?U0dTT00zMGw4RUh3VDQ0VnorbFZBemVNeVcrZ0pPUk1zbVBUc0lwNEpYZFNh?=
 =?utf-8?B?Qld6VkJmbVpGMmpmUGFXK1UvQVF3a011Wk50Sy9FcGcwQ2F4Sm9IaDRzTEJv?=
 =?utf-8?B?Y29qdkZIbFhSWDlLeFVwYjlrUm5lbW5WRDI5TVQzamliZ2FZY1o2aTNyb1h5?=
 =?utf-8?B?bUFia1dUVE1oell4Y094Z3lhL0hMK3kvVXpaM1VacnNHcGtuNTJYNDJrTzNr?=
 =?utf-8?B?QlZsVERSODVvMVFqSnUyTkNTVUt2NlRRcmdySTkvTEhpazRyOWZ1TFZ2SVhK?=
 =?utf-8?B?eGNDMU1Rb1ZzeGsrTDkxQXhQNm43U1NwOVozYi9MSzd2RklvNjBPaWZXd0Vw?=
 =?utf-8?B?a1I1ZnNzdkM4NmVHNnpONEpLbmdGZVVZdzZmNDJGNXhXQldrWTVWOEtqU1FL?=
 =?utf-8?B?R2grUE1CdVdpbEFHSThJaWF4OUZvMm9rWTRYVVlZYS9HcGFNaytoVFEza21R?=
 =?utf-8?B?NkFXY3JveStUVWNHMGVnVXpoOHMyUkQzSGE3Y1g4ZjF3TDEySStuSlVTZWF0?=
 =?utf-8?B?ZzVJZnFUS3F3TzU4OGdlMDhrYk11enU1ZHU1dE1YR2VUanFGMThRL0tGalRH?=
 =?utf-8?B?OTNOTDJiS2NZVFBvTVJvNGZOVmh2UGYrQlR6dE90VFpsYVdPUFA0Ujhwb1Zt?=
 =?utf-8?B?OWt4ZjJza1locTQwYy92RWVGMC9ITDRpSHJaNjZHTGMvZDIxS2d0YjZZdVRm?=
 =?utf-8?B?cHJ0ajlGdHM4eHZhNEM3WUxaRWZhSFNuMTI3RklPN0gvOCtvK0prcUhVb1o0?=
 =?utf-8?B?RU4yeXFQODc4Y1k2STBkQnNFbUNIK0puRG0yTkdoT0hlSzJUME1XN0JlZ3dw?=
 =?utf-8?B?WTJhN1MyNGJ6OU1OSmt3OXVoTGRXL0FUZXFLTmFmSEtTTjZHOTUvaVI5R0hN?=
 =?utf-8?B?QjJEOU82T1hFam1VQ1l5OWZWbUtjVTRIM3hGVndDYVNTSkxydTdSOEN6N3dL?=
 =?utf-8?B?SEVWc0h2di9IYXMrbHBMTEU4TW5kaUVraVQrSDBrY1RNY1Jpcm4ya05VMU1Q?=
 =?utf-8?B?aDY5WjF2ZWh5U2dzVFM4UkJuczRHWVdUd0hRcnFndFNDOWxldDNhZmpXeGdr?=
 =?utf-8?B?bW5VdXlGU2VFNEtmTzFDMDFsYS96dXUwaTlidGIxV2E1bGx2OTFtRHNRSUtk?=
 =?utf-8?B?SHdGdG9FMjVEVzd4bTMzR1YzRVk2MWdTTkExRmF4RTR1RmkrRzJ3WWdoNnRj?=
 =?utf-8?B?bXZpOEszLzlnMk1MWHJJSENSYStCdEFwaU9OdlZnRXZBR0pyejI0amJoQzZE?=
 =?utf-8?B?cnorNFdBb1UrNDlhOXdtTHpHQ0RKeFpzNUQrWDljdVJjZGRCRUg2bTRKTnJn?=
 =?utf-8?B?TkJHRzU5NWMxV091ODdQQmt5dDMyNUY3VkswNkFHOGQ1eDBGWWxiYWFVNFpm?=
 =?utf-8?B?d0hGQ3h3VXQvMEwrUXpmY3M4SHpmQXdlRFlJTW16TDNGcDBqcW5BeTlkRFl3?=
 =?utf-8?B?STJHZnJ4L1hCekUxTjAvLzB1aXJMU0IzQmJFV291WCtzQ3BObmNOcGorbjhU?=
 =?utf-8?B?OTBuSkhSVWg3TVd3b2pUMkFqdFAxM0hYWFRDWlg4cS9OMnlDb1RqaEhnMWNF?=
 =?utf-8?B?S2FNL1Urc3VxaWdlMExZUWl3VzJ1OHJwZFg5RzRxOGpLL1FValBUV3pDenFL?=
 =?utf-8?B?MFM2MmdsWCtlbTRVRE1LczBBc0J6WGtwNVBPNUxvVXd6TkNQdTI2c0h0N0xH?=
 =?utf-8?Q?pxsxB9e1odCarXxI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5073de80-64c0-4e15-6fa9-08de7348d67e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:03:00.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2q1j9I2chJCRk0n4YKZ2zYsw2iRDXHbPhNRFW22wOv65UQQdBzlS0kqSvwY3u5cZrXnwdqYg/p+in3hlFPChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

On Mon, Feb 23, 2026 at 05:45:23PM -0800, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 04:33:30PM -0700, Nguyen, Brian3 wrote:
> > On Monday, February 23, 2026 3:07 PM, Stuart Summers wrote:
> > > On Mon, 2026-02-23 at 14:59 -0800, Matthew Brost wrote:
> > > > On Mon, Feb 23, 2026 at 10:49:21PM +0000, Summers, Stuart wrote:
> > > > > On Thu, 2026-01-29 at 08:27 +0000, Brian Nguyen wrote:
> > > > > > The check using xe_child->base.children was insufficient in
> > > > > > determining if a pte was a leaf node. So explicitly check for if a
> > > > > > pte is a leaf through the bit checks.
> > > > > >
> > > > > > Fixes: b912138df299 ("drm/xe: Create page reclaim list on
> > > > > > unbind")
> > > >
> > > > Move the Fixes tag by other tags (Signed-off-by, Cc)
> > > >
> > 
> > Got it, will move.
> > 
> > > > > >
> > > > > > v2:
> > > > > >  - Remove old assert. (Matt R)
> > > > > >
> > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
> > > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > b/drivers/gpu/drm/xe/xe_pt.c index 6703a7049227..b73a356d0fa1
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > @@ -1655,7 +1655,7 @@ static int xe_pt_stage_unbind_entry(struct
> > > > > > xe_ptw *parent, pgoff_t offset,
> > > > > >
> > > > > >         XE_WARN_ON(!*child);
> > > > > >         XE_WARN_ON(!level);
> > > > > > -       /* Check for leaf node */
> > > > > > +       /* Optimistically check for leaf node, may not be
> > > > > > guaranteed
> > > > >
> > > > > I would keep the comments the same - we're still trying to check a
> > > > > leaf node here and we aren't really doing anything special. If we
> > > > > have questions, we can look at the commit history to determine what
> > > > > changed from your prior implementation.
> > > > >
> > > > > Or if you want documentation here, it's more interesting to me
> > > > > *why* we
> > > > > can't see this from the child alone than just the fact that we can't
> > > > > (which we can observe by the if condition).
> > > > >
> > > > > Also applies to the comment below too.
> > > > >
> > 
> > Ahh got it. Let me reword the comments here with more details depending on the changes
> > we make in the comments below. 
> > 
> > > > > Thanks,
> > > > > Stuart
> > > > >
> > > > > > from children alone */
> > > > > >         if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk-
> > > > > > >prl)
> > > > > > &&
> > > > > >             (!xe_child->base.children || !xe_child-
> > > > > > > base.children[first])) {
> > > > > >                 struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > > > > @@ -1675,10 +1675,13 @@ static int xe_pt_stage_unbind_entry(struct
> > > > > > xe_ptw *parent, pgoff_t offset,
> > > > > >                                 break;
> > > > > >                         }
> > > > > >
> > > > > > -                       /* Ensure it is a defined page */
> > > > > > -                       xe_tile_assert(xe_walk->tile,
> > > > > > -                                      xe_child->level == 0 ||
> > > > > > -                                      (pte & (XE_PTE_PS64 |
> > > > > > XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > > > > > +                       /*
> > > > > > +                        * The check for xe_pt's children is
> > > > > > insufficient to determine leaf.
> > > > > > +                        * If not leaf, break out and continue in
> > > > > > next page walk level.
> > > > > > +                        */
> > > > > > +                       if (xe_child->level > 0 &&
> > > > > > +                           !(pte & (XE_PTE_PS64 | XE_PDE_PS_2M |
> > > > > > XE_PDPE_PS_1G)))
> > > >
> > > > I don't think XE_PTE_PS64 needs to be checked here as that should only
> > > > be set at level 0.
> > > 
> > > Oh that's a good catch. PS64 has a specific meaning within the PDE. Are we trying to check if this is > 4K basically?
> > > 
> > 
> > This was checking if one of the bits indicating that this is a leaf entry was raised and if not, skip adding this.
> > So, checking for if it’s a leaf PTE (which would have one of those bits raised), not necessarily if it is just > 4K.
> > 
> > Previously I had thought to remove XE_PTE_PS64 since level == 0 covers the condition but just for clarity of
> > checking all leaf PTE, I kept it with the assert and then kept it since I inverted condition in this patch.
> > I'll remove XE_PTE_PS64 in next patch. Thanks.
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > >
> > > > I agree we xe_child->base.children can be set at level > 0 but now I'm
> > > > thinking the outer if statement is wrong wrt to
> > > > 'xe_child->base.children[first]'. Couldn't
> > > > xe_child->base.children[first] be NULL when subsequent
> > > > xe_child->base.children[first + 1] be non-NULL?
> > > >
> > 
> > I believe this was the issue I was running into with one of the test cases. Having some sort of non-NULL subsequent child declared here
> 
> Yes, but any check at outer level of individual children doesn't seem
> right.
> 
> Let's give an example of a 6M unbind.
> 
> Case 1:
> - children[0] == NULL (leaf)
> - children[1] == Valid (not a leaf)
> - children[2] == NULL (leaf)
> 
> I believe you correct code correctly generate PRL for children[0], break
> on children[1], so children[3] is skipped. I don't think this is
> correct... On hitting children[1], I believe in addition to breaking the
> loop, you the PRL needs to be invalidated, right?
> 
> Case 2:
> - children[0] == Valid (not a leaf)
> - children[1] == NULL (leaf)
> - children[2] == NULL (leaf)
> 
> The entire PRL generation is skipped but the PRL is not invalidated
> which seems to be problem as leafs are skipped here.
> 
> So I believe this entire logic needs a bit more rework than this patch
> alone.
> 
> I believe the logic is roughly - at level 1 / 0 always walk all the
> PTEs in the PRL is valid, at level 1 if any non-2M pages are found
> invalidate the PRL if we are not going to desend further down (i.e., we
> cover the entire 2M range).
> 
> This fairly complicated, so I'd have to type this out + get on test
> machine to provide further advise here.
> 

I can give you some test cases I suppose...

- Test case A - 2M binds:

BO[0] = alloc(8M);
bind(BO[0], aligned VA, 8M);
unbind(aligned VA, 8M);	/* Get four 2M PRL */

- Test base B - 4k binds - Same as above but 4k

- Test case C - 2M mixed:

BO[0] = alloc(2M);
BO[1] = alloc(4K);
BO[2] = alloc(2M);
bind(BO[0], aligned VA, 2M);
bind(BO[1], aligned VA + 2M, 4K);
bind(BO[2], aligned VA + 4M, 2M);
unbind(aligned VA, 6M);	/* PRL should be invalid */

- Test case C - 2M mixed:

BO[0] = alloc(4K);
BO[1] = alloc(2M);
BO[2] = alloc(2M);
bind(BO[0], aligned VA, 4k);
bind(BO[1], aligned VA + 2M, 2M);
bind(BO[2], aligned VA + 4M, 2M);	/* PRL should be invalid */
unbind(aligned VA, 6M);	/* PRL should be invalid */

- test case D - 2M, partial:

BO[0] = alloc(2M);
BO[1] = alloc(4k);
bind(BO[0], aligned VA, 2M);
bind(BO[1], aligned VA + 2M, 4k);
unbind(aligned VA, 2M + 4k);	/* Get one 2M PRL, one 4K PRL */

- test case E - 2M, partial:

BO[0] = alloc(4K);
BO[1] = alloc(2M);
bind(BO[0], aligned VA - 4K, 4K);
bind(BO[1], aligned VA, 2M);
unbind(aligned VA - 4K, 2M + 4K);	/* Get one 2M PRL, one 4K PRL */

- test case F - 1 GB, partial:

BO[0] = alloc(1G);
BO[1] = alloc(2M);
bind(BO[0], aligned VA, 1G);
bind(BO[1], aligned VA + 1G, 2M);
unbind(aligned VA, 1G + 2M); /* PRL should be invalid */

Matt

> Matt
> 
> > with the xe_child->base.children[first] = NULL. But determining if this PTE is a leaf entry would require us to iterate through all the childrens
> > I believe, which is why I had kept that check (xe_child->base.children[first] != NULL) as sort of an optimistic filter and had this new inner if statement
> > to ensure that these entries are leaf entries.
> > 
> > So, what is your suggestion here?
> > 
> > Thanks,
> > Brian
> > 
> > > > Matt
> > > >
> > > > > > +                               break;
> > > > > >
> > > > > >                         /* An entry should be added for 64KB but
> > > > > > contigious 4K have XE_PTE_PS64 */
> > > > > >                         if (pte & XE_PTE_PS64)
> > > > >
> > 
