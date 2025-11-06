Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B027CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 20:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64010E9C3;
	Thu,  6 Nov 2025 20:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUPPtCsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299D710E9C3
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762459449; x=1793995449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JhHcxpPauRgFcIzG11AGo36LyK5vnRpIXv/J2ciusFA=;
 b=dUPPtCsODQckI4K/ZOxFt7GI5VURPco97fyIW2TQUY4uJoUBZwI/YAW6
 4D54uBpsfuQVTvGBptq6p9WKwRzisCqiFXoQLMZ+zHI6eXSJZBBahho7J
 BKVnEpnYGogMHs7G92exb5lo+BlkkW5CYQm9xCG/7u4FTRxIyPBrWo3R9
 PhUWmOpWQAjtHLJgT5Hw5ZlhYtKwhGVtO4pbIPI4GwyB/T/7RMssx7ABD
 6wM4WHZ4QnOJ0JjnOkZsFPelmdgEvYMQ+QjBZb7CvMGLI51eWtdtwL7wr
 EwyEr6u+9KMX3p4tQOwxPT+35JubeHOPRBXwBFDdPTxFsqRzs466UOs35 g==;
X-CSE-ConnectionGUID: jH6/lUe8RnGhjc03/uDBfw==
X-CSE-MsgGUID: 4g3s8nsJRGuv53+rF20ruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75961946"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75961946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:04:09 -0800
X-CSE-ConnectionGUID: mYzfXMK3R0CTJXnJ29iwpA==
X-CSE-MsgGUID: q+F0+QFiTbCRQbQiBoRvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188568538"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:04:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:04:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 12:04:08 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:04:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltWss2Ipku7rru+gT3WlFRvL5UmdvhE81Uy2jg/fq7KbK8jBVemfrz6vtIjEfLo/n4qhqZAD1mg9vR5r/ouMtksaCF913S+EOjBK3jd8kwbC1sleODZK4+HEJ4Mw8TK+C40aHmULRGZNaANMgm4jOdV+HWstJY+n05X2EF0gGtFwIBZJAPs7UbYXq1Aif2E+dZtNTXVf4XXLTqpYNdpisN8tbJDfM2lzunbr51SsRpUu6U1fAtptaZuWQ+fPKndhRD1cJuQD31hXIRQOeoz8Cq9t8UVuU+0kkkOy6TXVOx6DovaxhCLwpUnUhjXTWTskKbLvT5kx1b2ssRr0JsW61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhHcxpPauRgFcIzG11AGo36LyK5vnRpIXv/J2ciusFA=;
 b=H3RVKh2mJEms/3wFzQ/ahQJVu824/ZKNkMTfRMSEv5VDfugK+/x6eRRbO39JD/lTy1IrJiqRF4mn7FVc8Os7dXbD2VoYRau8fKLkJ9z6qPziTm+dPlQg4B7DBhWdm/Xgz71NH6nEOy9l1wNVggBtXvsdKAueBc6myClR+ul0oLu/cFrrZ1z4MX97jAeREnUjlot7H4gyyJMRrejDE3pBgA/3jc+d9/QxDKtD4FD/bksoyKK1GVsCzxF2Qd2dsiZ7DrMNDAQNg7rDVn+wqKk3DK4+gAmbFAHXXOy9CeIMuvhVrC2lzV99dCefU1YhMAAd0VVDJ45VtOexFHq1FHKv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 20:04:00 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 20:04:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 01/12] drm/xe: Add normalize_invalidation_range
Thread-Topic: [PATCH v2 01/12] drm/xe: Add normalize_invalidation_range
Thread-Index: AQHcTcUiXExEO5BZwk6l6vSKBbYssLTmFW4A
Date: Thu, 6 Nov 2025 20:03:59 +0000
Message-ID: <a3bcd935e0b4487585c9972cbc5c8714ae125a36.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-2-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB4819:EE_
x-ms-office365-filtering-correlation-id: f601c71e-81dd-497b-ec25-08de1d6fa03e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RFI5QlIxWDlZZzRHR3VtZm9odG5PK0VncHFLdFM4QU9jNHlDV3k5MkR3ZWFr?=
 =?utf-8?B?Q2NzZy90b1hNa0t2eVJLUmRpdGFkUkJtUzlBMk5FaFZLYS9uM1BqQ2p4ZkI5?=
 =?utf-8?B?VTZqUU9lRUwxWmF6bE4rRUNENkVUQk1RelNwa2d6QkRjcU9jOWNsbGdaUWJV?=
 =?utf-8?B?UXZkNWNBMThrbHVTZWg5YWlqZXU5RHhGU1QvOGp4cTIyQjNEYWFmZjR0TUh5?=
 =?utf-8?B?OFJQbXNpSE85dEtrOXFickdYQzJtdnZLTTI0cXovUlE5KzBBR2huVmZlZ0VQ?=
 =?utf-8?B?U05HVW12L3VwaVlHRS9VTlM3bUZlRGwrTU9ZSU5aY2JsQU5jY2RkTWVCR1I0?=
 =?utf-8?B?a0xIajIza1ZjS3IwcXJITjNYamxMRnVlMnZBVDZNVzREeDNXQ1EyODVKeHpK?=
 =?utf-8?B?aWxoMXFPMmNoYjJ0T3JpVUVOWXFobU94Q0h3bFVLbVIraVJhQTZXU1l1azVz?=
 =?utf-8?B?U0dmSllIekVNcVphbjJWNnpKTTFnaW5kUTVVKzUwaElDcE5lVjVaN0FOVWVC?=
 =?utf-8?B?NTRuU0hRcFI5aldYb05Db2NhMWlpUHNjRkxicEhRZzNEWWNwYWJTb1JYVXJS?=
 =?utf-8?B?UnpWcmFYY0J0MzNHR2lFV1MwTGp4Nithc1Y4Z1FRQkptbElmVjMwbUtPTkhv?=
 =?utf-8?B?UnZQYUd6VVo4a0dSMkJJQzN0MWYzTXJnZzZoZ29mMmlVRTRZK2RkaFVWUFEw?=
 =?utf-8?B?bzlKZGV5alNNTUpPV2pMWUdEc1pHKzBrNUhNV0lXTGEycko4ak1hOExkeXAz?=
 =?utf-8?B?c29lbnhITkhBajdqSGM5MTBmVjFVYWpsYmdySS9KVS94cVpDTGRsRHpUMW5W?=
 =?utf-8?B?K2JuWlY1UTRrWUVvOWdBSzZYaUNTZVBUUi9COXdKNDV6U0Fid0F4Wlp0V3R5?=
 =?utf-8?B?bHRJdlRFOHQ4T1IwaFBCaHllSEZROWdLWG9PU0ExZHhIRWZXdXJhcC9BeGxw?=
 =?utf-8?B?ZUhLVHk0cnRxcWFyRkc0akNzcFVKSFNhMGk3aVVBUkZMMVV5RExTVGFpQ040?=
 =?utf-8?B?ekxVTjg0TFR4ZEZKcDVGcDNnbHIybUlaV2FsY1ZXeGhaSlVCbEdpdGRTSHBs?=
 =?utf-8?B?YndobC9vU0lLMzREQlZSM2JMaG9obVlxQ21OMVMrUHoxc0FrSVhwSFBuUjls?=
 =?utf-8?B?R3pHR3lyT0p3VGlqWWs3VEh6TmJ3ZU1NMmpxdGR5ODJCb0RyMEJhVW1qWWZC?=
 =?utf-8?B?Ymp3Y1Y0VmhCc3FjajJKdS9kazJ2MC9RMC9qL0lITXliQ0hBQnhvQkxXMnBo?=
 =?utf-8?B?STh2UThLRFNWUzRNemVZUGYzZDBjZHRTdVVEaHZMeHFxa0hwMTVMME1nK1JI?=
 =?utf-8?B?Z1JlZTd3QVNocmJwbythU1R1REtlS0R2QjIvUU5rdTZweUpQQnQ2WUZ3L043?=
 =?utf-8?B?cUFMbDJldnFpeE9UTFdCZEU5M1RjN1dLY29GUURHck1ycG9hWVRKV1pLc2Na?=
 =?utf-8?B?cEhHa1I5UGdzelZuWWVjZkFqcU9nT2ZqSjRiRVlWemtWVUxIWlJMcUczclR4?=
 =?utf-8?B?N2Y5Q294MjdJb2pCQW1zV2VDVm1xYmxtZkcwcTMwNm1BRGIzWW9DYi9ZbDhs?=
 =?utf-8?B?dTFBUU9qSHVaQy83SXRldVlwYUVFSEQyaXY4bEtqNG5QNm4vdExPc3ZrbDVk?=
 =?utf-8?B?amg2Qys1elpMUWd1ZjF6YlRJaDIwNnhSeEtqeXJJU09IZGNrODNHU2pZQ3N5?=
 =?utf-8?B?Mm5PVnVKUkZNL0xJVmtXVDE2dDhHNEhZbFZuSmpqcmlqRFd6YXFaT3JTV2FY?=
 =?utf-8?B?OXZTbW85OUhLYzhIbytsSCszSkJmakU1L1QzWUtScnBBaEpybFJ5RUwwd1BZ?=
 =?utf-8?B?WmVhWUdQK3NpNG81QVplYmlLVDJBYW4xMlltUVA0UmIvc3Y4bDM0QXYvTEpq?=
 =?utf-8?B?LzVYVlJXL3ZNRHJkYllwMW1VRVZ3dVlnbFJQcmt1V3E3SEt0WGJHd0QvYWZV?=
 =?utf-8?B?MVEweFlMOFJnd0ExQ3QrVkhnVFFSckxlaXNPMWFuV1NZNTFsYmNoWlNRakdL?=
 =?utf-8?B?UEdCc3VVQU5JOHFIb3NRV215WjhaYmlzOTBxZTF3Y0FsRk92QTNoY0ZCNDZZ?=
 =?utf-8?Q?ZWayIC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHE2RVJjK0Rsc1A4WGJwQnptR3pBYlhobjBnVXBJSmRSNjdpM0xQUml6dG16?=
 =?utf-8?B?VVpLSkhScXhxbTJxZ1RFcjBLT3doZ0dwSjc1WDNRNVdHbU5CV3hjamYvWk1k?=
 =?utf-8?B?TFk1Z3phZ1dnWVI5T1IvLzJJc2hBODYxajlhR1piUGxKS2todGtSNW1keWVC?=
 =?utf-8?B?MUMxWGdsaEhENWtLTnQxRG5DSU1lUjlEZS84UWwrckdUTXNhRkw4ZlVNTEVi?=
 =?utf-8?B?TkZFeXRPSWdjNGZVOUd0bWlnOUw0U0VYemRYaTRjMVBObEVqaUxoUGxjT1lD?=
 =?utf-8?B?Unpyd0I4VWladE5oUGo2WDBGQ2h3V3FpNk9iV0FWTnlRUjlDU0U5QTVxOEo4?=
 =?utf-8?B?OGNPeXQ5YkFpUlJPK1BFY29hT1c4NktwbU9CMW5YSmxYV1BTTzJhZytPWEVq?=
 =?utf-8?B?cnBRLzQrOU1lNUdKRlYrM0FsUnVWaHJyQlpvbzRsWEtSMEpqK082akpqU1Nt?=
 =?utf-8?B?OXdOZDB1WHl1bFV3Sm9iRjRJZVR0NmxZc25MT2hhWVFZZDlEQUQrS3YzMmRI?=
 =?utf-8?B?V29MK0lhemlBWWhxSi96UFB2dzJpZllKR0lTOEI1MUN2TzFHanVqNEkzSVAy?=
 =?utf-8?B?a1h1ZnlMMGJpUGc4NGtpcERjK1gxOElCRjlzc2EvSlFOaE5EUUFvcTh4cEda?=
 =?utf-8?B?Vzg4RmE3R1FPNTBhOWdjR2NBcWdRdE1CbEdMbWpSTy8rUVYzNmdlWE8wQTJp?=
 =?utf-8?B?bXdDRWlrMUJCSjBmQkt4NkhsOGgzRWplYWR1QTFzbFRxTENqN1JQMFFNQ21F?=
 =?utf-8?B?djFTWFdKelE1K0dMRXp4R2h5Uzk5aU5rK3plK2RQZHJENVlZblNHVS9VOTlV?=
 =?utf-8?B?NWhjbnYxNTJIYm40Ymt0TnFOOVBFMk9LbUFiOUNiRDc3MzRlRHh1NDFrQ0VF?=
 =?utf-8?B?V2c1ZEJHMCtvTWdoK3FweGhCOFFFOUdJdmxybjQ1VTJqMTBYcEJmOFBCZ1I4?=
 =?utf-8?B?ZzV6R3FTcmJ6U1pNNVVmZGRnQmdKQ2F1dk1QUkZnM3dIMWhzNlFYN3lNU21V?=
 =?utf-8?B?VXBvakdHRCtQR0VMcjRvS0kyNzVHNVQwNlllb2JTT0tlOG0zTUV2OVVZYjlQ?=
 =?utf-8?B?YktYSCt4TXRtM2ZjVW04UU1veTlrdTlMRVZhNEdVdFNZSS9XSlNudmhkbUNy?=
 =?utf-8?B?OXBlVW5Id0RUeTVMUFlGVkxWd2cvMjlIRDIrM1pETjRQUjdEK285ZC92QUtr?=
 =?utf-8?B?WmFjaFkxTzZOaEtKTHFhWnVveVpFNHZTWFNDQ0NHaXpxcUhaNjd2YmhNWVRh?=
 =?utf-8?B?SldDYlR2RXFZNmg1Y0Nrdm1EVmx2V3F5M0NrY1Zxbld4VVl5blRpdURBVXZj?=
 =?utf-8?B?dHQxMlFmZ2ZrRzJWRVpkaWF1RDZjNjRjQjdJcG9wbGRCRGo4d3FGSTVGUDUx?=
 =?utf-8?B?NGwwVHV6a3ZFRWs4bUpuYTQ4b3p0VmNKMUtWbTkrTmRMRVVUYkw3SnNnbzRM?=
 =?utf-8?B?aFZuUFVRZ1A3MkFSYlh4Q0UvOVdJdzRBdVphMWdaZDBNLzJrU2xIbTN2eGNC?=
 =?utf-8?B?QTMxNTdMT291WUt1K1hmSk5Id1RmeStrWlZ0UFlqc3Z2eitrVHFaVDIwNWdi?=
 =?utf-8?B?eHQrRG9tT0hIY3pPbEdDZXZSdXlrNHcramtwUjRsRkhNNGtRNjNNTWxxNWlh?=
 =?utf-8?B?NW1UbFpPVEl4S3h6dGMxemwzSXg2NkczSkozbmFvdnpVaDNpUzlyM00rSVNT?=
 =?utf-8?B?OEk0SGJ3bnNtVHVGZHFyVlVjR1Q4T3BKN1pHZWRMZVNrdU5xUHJOM3FIZVN5?=
 =?utf-8?B?ZEtvMmxSN1lTczRRVXJuYVczWW9idXdOMC9qL2Evb1RUVzQzRkFMTGJUeVdI?=
 =?utf-8?B?N1h6ZXJkOG43Mk9mbmt2NG9MOE42MFZFeElwOVEwQitnR3M5SmgrZlRkbmpH?=
 =?utf-8?B?Mk1ZM0RpbW5hZVlIQlkzRDEzMW9wNS9CZUhvdFBiNVJCNm95MENLdzdVamFX?=
 =?utf-8?B?eGRmZUFYUTFmMGQ3QW5oME1UK1VsK2dBL0FoTVFTQ1o5ei9McjZLNWd3WUxy?=
 =?utf-8?B?UDEzdndIdldlYkRSaFpFTHNXYi9XbUw2QktjTU9vV3NXY3p3V0plcWF3TzF3?=
 =?utf-8?B?RndJYk9kbXRnRE41aXR5UVdXdTVlSXNHTXNhaFRXUXZ5NDlXVVh3UU1VcFdw?=
 =?utf-8?B?di9xeGFRY2wwc0VFSUNHZ2lMY2VkTnUxOWZDQVIxSTdGb0c1MWd1N0hLNG9G?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8553F07E98E9D40B944EDD15DB03783@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f601c71e-81dd-497b-ec25-08de1d6fa03e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:03:59.9550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ts6Tskm0t+JTpFecwVrFGlT/rUczmZ3om1pN2/J7vh+7AtFDOAz6lfFT/HTOZcr0b0ec3v773ke56kJzCkW9GAF8bjz6NkhpYIfpSL1G/Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEV4dHJhY3QgdGhlIGNvZGUgdGhhdCBkZXRlcm1pbmVzIHRoZSBhbGlnbm1lbnQgb2YgVExCIGlu
dmFsaWRhdGlvbgo+IGludG8KPiBhIGhlbHBlciBmdW5jdGlvbiDigJQgbm9ybWFsaXplX2ludmFs
aWRhdGlvbl9yYW5nZS4gVGhpcyB3aWxsIGJlIHVzZWZ1bAo+IHdoZW4gYWRkaW5nIGNvbnRleHQt
YmFzZWQgaW52YWxpZGF0aW9ucyB0byB0aGUgR3VDIFRMQiBpbnZhbGlkYXRpb24KPiBiYWNrZW5k
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgoK
UmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+
IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYyB8IDcxICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKyksIDM2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3RsYl9pbnZhbC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9p
bnZhbC5jCj4gaW5kZXggYTgwMTc1YzdjNDc4Li42MWJmYTBkNDg1ZjYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBAQCAtOTIsNiArOTIsMzggQEAgc3RhdGljIGlu
dCBzZW5kX3RsYl9pbnZhbF9nZ3R0KHN0cnVjdCB4ZV90bGJfaW52YWwKPiAqdGxiX2ludmFsLCB1
MzIgc2Vxbm8pCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUNBTkNFTEVEOwo+IMKgfQo+IMKg
Cj4gK3N0YXRpYyB1NjQgbm9ybWFsaXplX2ludmFsaWRhdGlvbl9yYW5nZShzdHJ1Y3QgeGVfZ3Qg
Kmd0LCB1NjQKPiAqc3RhcnQsIHU2NCAqZW5kKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgdTY0IG9y
aWdfc3RhcnQgPSAqc3RhcnQ7Cj4gK8KgwqDCoMKgwqDCoMKgdTY0IGxlbmd0aCA9ICplbmQgLSAq
c3RhcnQ7Cj4gK8KgwqDCoMKgwqDCoMKgdTY0IGFsaWduOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBp
ZiAobGVuZ3RoIDwgU1pfNEspCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbmd0
aCA9IFNaXzRLOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBhbGlnbiA9IHJvdW5kdXBfcG93X29mX3R3
byhsZW5ndGgpOwo+ICvCoMKgwqDCoMKgwqDCoCpzdGFydCA9IEFMSUdOX0RPV04oKnN0YXJ0LCBh
bGlnbik7Cj4gK8KgwqDCoMKgwqDCoMKgKmVuZCA9IEFMSUdOKCplbmQsIGFsaWduKTsKPiArwqDC
oMKgwqDCoMKgwqBsZW5ndGggPSBhbGlnbjsKPiArwqDCoMKgwqDCoMKgwqB3aGlsZSAoKnN0YXJ0
ICsgbGVuZ3RoIDwgKmVuZCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsZW5n
dGggPDw9IDE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpzdGFydCA9IEFMSUdO
X0RPV04ob3JpZ19zdGFydCwgbGVuZ3RoKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoGlmIChsZW5ndGggPj0gU1pfMk0pIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgbGVuZ3RoID0gbWF4X3QodTY0LCBTWl8xNk0sIGxlbmd0aCk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpzdGFydCA9IEFMSUdOX0RPV04ob3JpZ19zdGFydCwgbGVu
Z3RoKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2Vy
dChndCwgbGVuZ3RoID49IFNaXzRLKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9ndF9hc3NlcnQoZ3Qs
IGlzX3Bvd2VyX29mXzIobGVuZ3RoKSk7Cj4gK8KgwqDCoMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd0
LCAhKGxlbmd0aCAmIEdFTk1BU0soaWxvZzIoU1pfMTZNKSAtIDEsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpbG9nMihTWl8yTSkgKyAxKSkpOwo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0
X2Fzc2VydChndCwgSVNfQUxJR05FRCgqc3RhcnQsIGxlbmd0aCkpOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqByZXR1cm4gbGVuZ3RoOwo+ICt9Cj4gKwo+IMKgLyoKPiDCoCAqIEVuc3VyZSB0aGF0IHJv
dW5kdXBfcG93X29mX3R3byhsZW5ndGgpIGRvZXNuJ3Qgb3ZlcmZsb3cuCj4gwqAgKiBOb3RlIHRo
YXQgcm91bmR1cF9wb3dfb2ZfdHdvKCkgb3BlcmF0ZXMgb24gdW5zaWduZWQgbG9uZywKPiBAQCAt
MTE4LDQ3ICsxNTAsMTQgQEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9wcGd0dChzdHJ1Y3QK
PiB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCwgdTMyIHNlcW5vLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGVuZ3RoID4gTUFYX1JBTkdFX1RMQl9JTlZBTElEQVRJT05fTEVOR1RIKSB7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0gTUFLRV9JTlZBTF9P
UChYRV9HVUNfVExCX0lOVkFMX0ZVTEwpOwo+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgb3JpZ19zdGFydCA9IHN0YXJ0Owo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgYWxpZ247Cj4gLQo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobGVuZ3RoIDwgU1pfNEspCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsZW5ndGggPSBTWl80SzsKPiAtCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIFdlIG5lZWQgdG8gaW52YWxpZGF0ZSBhIGhpZ2hlciBncmFudWxhcml0eSBpZgo+
IHN0YXJ0IGFkZHJlc3MKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaXMgbm90
IGFsaWduZWQgdG8gbGVuZ3RoLiBXaGVuIHN0YXJ0IGlzIG5vdAo+IGFsaWduZWQgd2l0aAo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBsZW5ndGggd2UgbmVlZCB0byBmaW5kIHRo
ZSBsZW5ndGggbGFyZ2UgZW5vdWdoIHRvCj4gY3JlYXRlIGFuCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIGFkZHJlc3MgbWFzayBjb3ZlcmluZyB0aGUgcmVxdWlyZWQgcmFuZ2Uu
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBhbGlnbiA9IHJvdW5kdXBfcG93X29mX3R3byhsZW5ndGgpOwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGFydCA9IEFMSUdOX0RPV04oc3RhcnQsIGFsaWdu
KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW5kID0gQUxJR04oZW5kLCBhbGln
bik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbmd0aCA9IGFsaWduOwo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAoc3RhcnQgKyBsZW5ndGggPCBlbmQp
IHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbmd0
aCA8PD0gMTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHN0YXJ0ID0gQUxJR05fRE9XTihvcmlnX3N0YXJ0LCBsZW5ndGgpOwo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
Kgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBNaW5pbXVtIGludmFsaWRhdGlv
biBzaXplIGZvciBhIDJNQiBwYWdlIHRoYXQgdGhlCj4gaGFyZHdhcmUKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogZXhwZWN0cyBpcyAxNk1CCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobGVu
Z3RoID49IFNaXzJNKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBsZW5ndGggPSBtYXhfdCh1NjQsIFNaXzE2TSwgbGVuZ3RoKTsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0ID0gQUxJR05fRE9XTihv
cmlnX3N0YXJ0LCBsZW5ndGgpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4g
LQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9hc3NlcnQoZ3QsIGxlbmd0
aCA+PSBTWl80Syk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2Vy
dChndCwgaXNfcG93ZXJfb2ZfMihsZW5ndGgpKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfZ3RfYXNzZXJ0KGd0LCAhKGxlbmd0aCAmIEdFTk1BU0soaWxvZzIoU1pfMTZNKSAt
Cj4gMSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbG9n
MihTWl8yTSkgKwo+IDEpKSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0
X2Fzc2VydChndCwgSVNfQUxJR05FRChzdGFydCwgbGVuZ3RoKSk7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHU2NCBub3JtYWxpemVfbGVuID0gbm9ybWFsaXplX2ludmFsaWRhdGlv
bl9yYW5nZShndCwKPiAmc3RhcnQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ICZlbmQpOwo+IMKgCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0KPiBNQUtFX0lOVkFM
X09QKFhFX0dVQ19UTEJfSU5WQUxfUEFHRV9TRUxFQ1RJVkUpOwo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYWN0aW9uW2xlbisrXSA9IGFzaWQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0gbG93ZXJfMzJfYml0cyhzdGFydCk7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0gdXBwZXJfMzJfYml0
cyhzdGFydCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10g
PSBpbG9nMihsZW5ndGgpIC0gaWxvZzIoU1pfNEspOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBhY3Rpb25bbGVuKytdID0gaWxvZzIobm9ybWFsaXplX2xlbikgLSBpbG9nMihTWl80
Syk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9hc3Nl
cnQoZ3QsIGxlbiA8PSBNQVhfVExCX0lOVkFMSURBVElPTl9MRU4pOwoK
