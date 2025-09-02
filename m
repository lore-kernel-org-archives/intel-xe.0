Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DDFCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AC910E07F;
	Tue,  2 Sep 2025 18:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJv0DP5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02E10E07F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756838965; x=1788374965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4pFx13Fv4fqqPzKSsvRBNtvGnRuXxl2gPO4YvCKTSHI=;
 b=SJv0DP5SDRFHDvQgo054Is9Lj9ic2IFPGGGmnJxWDbdgRdMF/mtf5xdp
 FgzlCFXqV7kJVn833pSFXzkualbLSS5fvbAXLNhn3qjJ0iTqB2GqwPstA
 XrtHkKnvyM3oKJbDN3wK3OWGqhN9VWmHw6D8nNsFbgasmejygFvxpBh52
 qTruOfzsaQIAiy6kTmFGHAsQiJFlpKp6/w6Qc6gB5eE7QTMLfNzcyUb1m
 LPanchNPSLc2GEXMYleFUiD9yiVpVMQsCRpfceQmiZnndNpghse3uzeye
 TPOXea+/iibNksA2r0g/A9Il2XdSqGKu817aQdI5pR7n8nShqptLgVsA0 g==;
X-CSE-ConnectionGUID: 0Fi0AFTZRdGK+FZYi3KhEw==
X-CSE-MsgGUID: NGjk7qXBSLGNSfQniGzJOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58986614"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58986614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:49:24 -0700
X-CSE-ConnectionGUID: TU0BpLLJTXyxwomWN+RqFw==
X-CSE-MsgGUID: IinChcGxQ9GAvKKfM2dkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="176659967"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:49:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:49:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:49:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYqGcvD3LwOrI9nQ0aivRlN8NOW6c/+rQzxCBkDHCEcfFebVKRF36tIXgNtDHGkGhH0thQQO24k3td1jJ5vNDVnTAz4osqr2tFtX/20FTGapwkRqLzH1tBlEohDvWbrxX1/8yJXDx3nu1Ff/nhau2KjYPcJWoaAv9WAJuM9ltxxV6q1kLRPCUu+3r1oHP2j2DPIRM1xzRlkoRDUunW77igTVRN6IVgjs3HXgXTax55C4U/980GVu8l/d2oTTJKzvvnll6dOBGFdNXfbZzcLToO9NtQCAu4OKZ88FlQ2GPpnep9ElEEvEud6N4gHEXryA8aRJ8ZPNRQybQ5U4ePSVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pFx13Fv4fqqPzKSsvRBNtvGnRuXxl2gPO4YvCKTSHI=;
 b=yJF4El22mVYoAIGyfkUNmzCJh2L3+U6bmFXOOkYKlOtcgeaBkz+E9sG/Ex8uAow2k1WvxbipzG/Pk4NwRHau/bOob2M15ItEUgRbQbKT+HQie/Amd9gDrG46oVMK0PnodBOB17yeVheVhOmHT18suhtg3y2NU6g3/E+3728uy+11NcV+eLDuz8Kp5ngSyZcfz+PGxAs+xgH7KYgRg/1vbCyn5Dq6/4vpLU4pwwJB1u0L9VYksd4x7kCV+gqQjeDKDc9LweOCxDFV1PyI8HP/74Xfx/IHgapbPPH4cm8fDoaP3Q5xnoMFePYTQU5tAijt6PqnOq52r5JpZN1zYPmZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 18:49:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 18:49:15 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "tursulin@ursulin.net" <tursulin@ursulin.net>
Subject: Re: [PATCH v2 3/6] drm/xe: Update workaround documentation
Thread-Topic: [PATCH v2 3/6] drm/xe: Update workaround documentation
Thread-Index: AQHcF6L/+DsFZld9kkiFFiiTm5sky7SARUaA
Date: Tue, 2 Sep 2025 18:49:15 +0000
Message-ID: <4c2ad3c69f8b813bcb6e502986afa965a64f35bc.camel@intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-3-3cdf4d63c72a@intel.com>
In-Reply-To: <20250827-wa-bb-cmds-v2-3-3cdf4d63c72a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB4914:EE_
x-ms-office365-filtering-correlation-id: 591c9c5c-d931-4468-fa75-08ddea516a43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RlRTUXJNTkF6Uzhuam0yQXhJMkpCSTBsR051Q1ZXRlhucVpGdjlDVXpWUG5O?=
 =?utf-8?B?VWJBbm40VXhJWUFMN25NaGgrWHM3YVZMMHBKc210ZlB6UWpjRUxrY3BDV2NR?=
 =?utf-8?B?V2ZMdDVNY0s1bHBXS1d0Sk81OTVjRUh2bWp6Q2Vzb0VpSHF0bHQ4MjVWcSt4?=
 =?utf-8?B?MVFsU1pISDEwQmtteHVva3pwVE9RdHZVTUZGYzE0T0JVVG5TOFdHMEdSMHZn?=
 =?utf-8?B?ZFp0VzZZd0U3RlZDZUhhNEI1N3NZbmVXOE9CZ0FjVmVDVFFCTEVnTVRvT2pr?=
 =?utf-8?B?VDZVa2tITkNsOXU0M0l4K1c5QkVEZVZVeDUwMWIzQ1JiayszV3BpdG9QbWZP?=
 =?utf-8?B?NjJzMyt5cEN4MjczZUVIVmhrejd5V0dPVktZSjU2elhhdk1KaGozajJoaWdV?=
 =?utf-8?B?TDlRVlhrMXQzcXN4cDVIakllbDZuZ0dSUFE0K3FnQjVlRVNWUXFMUWljQU53?=
 =?utf-8?B?WVVzMkFxZUk2VlI5QnlVellHMDh0UGRsUWhMSmFQeWF1bUZHVm5kSlVxZU1G?=
 =?utf-8?B?TkF3ZG5YYkFyQ29oQ0RlejdUcURVdVFxZHR3cE0wMjJNaEVTK095R0cvRmtF?=
 =?utf-8?B?S3lTcWowRVptUEUrVGc0dXlJSzk2L0J6YmNuMmJYY1o0cEpXMUNSTW1seENh?=
 =?utf-8?B?QWc2M2RiVDEzd2R6SzBGaUF3TnJZQTIzcm9ETXhMYzBXbG5GMmxHYlAxZFRu?=
 =?utf-8?B?aTk1WXRta0dOeG5nMFJqVzl5aWxjUFN2Q1RacTh3cXJlZWtvdTZPWWoxa2tv?=
 =?utf-8?B?LzkrcW5uVlpHeUp6VXhUbWJycStoWlkxcDRWTkpqTFp3QlA5VHd6UEJjM2JK?=
 =?utf-8?B?MU5ZUnFhVHI3UnZHeTU5Y09wRUFwSE1wK1p4cTdTZkFDcHR2blRlYUVnYWJE?=
 =?utf-8?B?T1c0b0VCS1prNWNDSVRRMUZHM2UvMEg0SVdibENGRXBIOHI0Q3N3UnJBZTZG?=
 =?utf-8?B?aVJqTVNMa29qeDVkQjJyTnVrdlFHUjlHNHRiTTJpd2hxc1NnTE4yWnlaL3pa?=
 =?utf-8?B?djJjcm4yZVpOVlBFMHlrRXdrT3BJUWxvQno5WW5wTU5ubE5UL3ZBWk1mc3pO?=
 =?utf-8?B?RTVGUjhZODRuOExwOWNBWVo0SExDZEJjM2dyb2s0bkZCZVV0QnRDTXZJdmpW?=
 =?utf-8?B?N05JdlQ3aHBNL0EvMnJaLy9sMlhtMk5kbzlnK0hMbUV1d0lueTFiVDVtb3pR?=
 =?utf-8?B?VEtIWHlGaHJpYmpGaFBWeXh2b0dMWkxjeTkzK1dTVW1JdGlHSXR0WHlXakYz?=
 =?utf-8?B?clpwbmRMSnFXVGU1OVRYQmpEanFERWlUZTdiV25GKyt0bnpRMEF1UFQ2WFRm?=
 =?utf-8?B?YW9jRHZLL1QxaCtPR3o5aUF2eU1tTnRNSHo3U2dSTTdYQUxVQ1Zlb2RtOUZ5?=
 =?utf-8?B?TDhBTXJ3aHc3N3Uwc29UQTF5R0M4OVBheFlBQVQ0dy9JOFhBN0hHZFRVb3Vo?=
 =?utf-8?B?VFNCL2M2NHBXaVZtSm02RmdoeVBRRmE4eks4VXdQWnBsMVR2NjE3ZW0zQVJS?=
 =?utf-8?B?bUtnM1owdjNMaFFoclpGa1lUbzA0dFhZR0VBNDNsaXg1c1VZRE45Z2tSSmxj?=
 =?utf-8?B?c0haOTEwRHNhRlMrQ3pIbXAxUDBacGRWMm1XZXliUkxSWHFYSjVxNVBGQ2k5?=
 =?utf-8?B?WVhIUlcxMzQ2SFlrb09BOStUeGxGcFlJR0Q2RDNnVFZ3SnlrZWdTZVVNNWEx?=
 =?utf-8?B?ajVoVnRKMUxmR0x3elJlNVAvWWJxUFBqa3RaY1YxQlZCc3F1aThVby9LS0dm?=
 =?utf-8?B?anRaK0gzV3o4REpGWjJXYmt2T0ozM2lKSE1DaU83OWFnVGpnMlE5bUNYRGN0?=
 =?utf-8?B?NEE4UitHcnN1a2pBajhmMzVuZUdES1RKYW01RkpyQ2RLaHJKVkNHN1JwQmUr?=
 =?utf-8?B?Tmx3VGR1dnZYejNrdVZSZStKOVpESzFNeStCMG96cjV2aU0wNHdjeUNKT2da?=
 =?utf-8?B?TUtLb3pGL2xSaWtCUVExWU90akFKK2Zsak0zM2dVYXdoRUlXUFhHTnBXZ2p1?=
 =?utf-8?Q?wr5RhEm+ykFq6atlFhBn2qVv16R1p4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V29WaDVyVU8wWi9jazI0YnVjMXplRnZkdzdhaFJEMWkzT3VYU3lvRFNrNzFN?=
 =?utf-8?B?bTRZUGI1c2V1aXRQUGtYSng3UnFQWG5oQkp0TGQvNHNobVNWZ09hWGZXeDFJ?=
 =?utf-8?B?QkZjZlNCQlFVMzlRNC83dUtUdHMzYm90aU53ODZUUFliTjB3Mk84dlBGc0FJ?=
 =?utf-8?B?OEpTbWZiN0h2TUUxTTBPd2ZlZW9CT0NOL2pwb3FJMmk5NnE4WjBJbkJTbjFh?=
 =?utf-8?B?blZQYXdsTTdKejZyZitPUHNUejl0cFQ1NUloYjNBMkFaWlJiUWJNWGN4SW4v?=
 =?utf-8?B?Q1MvWjMyVVE1a0NueG5pZzc1RXJVWjNBbTZMSWpwV0haN1lCU24vR2dxTmNk?=
 =?utf-8?B?V1Y1dWtFemFSZWRaWnlsMUVGNEU4NVp0a1RPYzNrdXVnMXp3amp3RDRvcTlC?=
 =?utf-8?B?TWtRZ2syNEZaeDAvNGNZUUllSTZXNnRsYldmV0V4KzV3dno2YjQxRm1WZlo5?=
 =?utf-8?B?WjBhNWo2cGE5aUtZdDQrRFMyeDdhY09YYVFONHpYdTRGM0JzWnpOV2J2YmJa?=
 =?utf-8?B?Sk16NHAyMW15a3NxL3pPSXVwVXA1R1ZrdENoQ1JnQ2pmbWV3V3pxYU1xUC8v?=
 =?utf-8?B?RUVOVFFIQlR2ZHlrV3l2M3g3K1VQeUxKRzRHSlZBVnIwQTB2UHBaaTdMOGJa?=
 =?utf-8?B?UTZjbnNiMjRYWTFPazU1aVh4aWpwYTQvS2N4amIzMzBqbjZ6SjdCekZmSG1p?=
 =?utf-8?B?WWkxNzIzU1N4cFZubzA1Z0VPU1ptTytpV2F1MmRzZjQrbDIwdWpEVDFvVUN6?=
 =?utf-8?B?SVUwTUlsK1pTWkpYeVE0YU5TdEUvYkRTZXB1eXFOdm44QWRKVXBzRnE4WHdI?=
 =?utf-8?B?ekNBN1JGOEpqdEdOZUhzZ0ZqRmo2SzE3VGdjNUp4enNMWWtON2lCODJER0M5?=
 =?utf-8?B?ZzhUa2F3NFI3TER2Y3Z6bjZJbFRPNjBzSjlmb1RRbUdFRE9IRlhpOFNZVTQ4?=
 =?utf-8?B?SmozNUgxdWpaNmVNdERobHVsMk41T0pkRllJcVN6djc0TlNWQlBuVmdRWEti?=
 =?utf-8?B?TlBIcWdBdWlVRGlXWTlLcm1OMnZ2Tkc2RHdxSjc2cE8wUFFmK0FWNVZGVDBm?=
 =?utf-8?B?SUZFdmUwVGRIWlpGTlRkNXFkazhrK3M1dHU4aGR3UC8xWmhGVXNGcFpZanh0?=
 =?utf-8?B?RndkQ3kvRm1xV0I4NGZRYnBYZ1BHM0N1UzZjRkYzNnN4U01DTGVhUE0yWDdJ?=
 =?utf-8?B?djRTWkdlVUtmVkJ5eDd2MmlrMllsM2RmaUhnaE5nTnEzRko4M2F6RmFHSzlS?=
 =?utf-8?B?R3NzU1NCNWhVYjB0eWxaTzNZaXl1TEtkVDhsZ2VKdHJENWJWUUNBSFZGU2xE?=
 =?utf-8?B?dTZhQ0dWNEErR2daaFlHNVNGdkZyQlM3alhEdTVGQVc0R1RWeDRUNnNKeVk2?=
 =?utf-8?B?KzRWOVNTMWtXMmV6c0tlRVBRWUVFTGhhNjVCZzJMYytIWDBwdDRyaG9QUVV4?=
 =?utf-8?B?OGF5UEhGV0ZBMlhITlVMQmJ6WnRaek9KYzE3ME5sWUh1N2dyajZnTXBKb2hI?=
 =?utf-8?B?dEVxT0RvUExWWXpxWnRyeDlGM1pMcUJ0Y3R6Ky9JS2ZSL200cnNieStBTFJj?=
 =?utf-8?B?Y0FSNU91b2RaRkNxVThPRldoQ3VjT0UrZ0hOTE1CZXVLZ1hzeVgyZEF5U0JS?=
 =?utf-8?B?SnFEZU9kWm5PaEUwQ1hwOVdiV0RMNG1UdXlpdk9mcVZKR0dRaWtKbmlFbjg0?=
 =?utf-8?B?dkhKYndPR0dkaDZsZ3FiV0JYWWE3YkZzNVF6KzMyeStxaGI3MDQrcVRNdG91?=
 =?utf-8?B?V0haeHQwM0F5Vk1SNnJ4ZXFuNDNWcVg4N252cGdzbU8yWUs2NTBKQ081dEZL?=
 =?utf-8?B?dmFybUpDUFJ1bUU0NjZFaWN4eThjaThHUWJ3UExscndJVEhFSC9xNyt0TC9K?=
 =?utf-8?B?WHlWSm4xUnVsQm1pUDVNWFNIWmplZ0QwdTBRUkk5QzM5Y2JIeEF2c3U1T1dh?=
 =?utf-8?B?eHBaRDAxSWpCUmVrbncvcUFoeXBXdkhvZEE1cnlGcDRWVy9lcDJ0Sk1RRGNn?=
 =?utf-8?B?TCsxS253MWU4c0JSK2JHMEVYVTBDMndmbnVhSzBYRnBUR0hjcVlRSE9NaXFK?=
 =?utf-8?B?cEJNK0hZN2F6SEpnb0lSU2R6VHlrTzlPTWlHaHVTTUplSnNwZGVBVWF1UFBl?=
 =?utf-8?B?U1VrWHhXVjVjMCtsSTdYNi92VFhQMkxkRWo3UE51dkFieGJLUkJaaCtpcXZI?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBA7EDD5903183438F4EC095353FF594@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591c9c5c-d931-4468-fa75-08ddea516a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 18:49:15.2222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekIs6Ila0dwEcXbaE8595d6Mk8ySUfwnZqXByKgrAHnfPjbZ1aKxXgp3q1mA8fnyrbKemp0xqWWdM6VEFB0Rj4csIYG6ucHeQNEq0fL/xco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE1OjM1IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEJyaW5nIGl0IHVwIHRvIHJlYWxpdHksIGJldHRlciBkb2N1bWVudGluZyB0aGUgZXhpc3Rp
bmcgYmF0Y2gNCj4gYnVmZmVycywNCj4gT09CIHJ1bGVzIGFuZCBmaXhpbmcgc29tZSB0eXBvcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDQ1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAtLS0tLS0tLS0NCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
d2EuYw0KPiBpbmRleCA1MmM3ZGY0YzNhZmQ4Li5hMTljZjgxMWI1ODBhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2EuYw0KPiBAQCAtMzksNyArMzksOCBAQA0KPiDCoCAqwqDCoCBSZWdpc3RlciBJbW1lZGlh
dGUgY29tbWFuZHMpIG9uY2Ugd2hlbiBpbml0aWFsaXppbmcgdGhlIGRldmljZQ0KPiBhbmQgc2F2
ZWQgaW4NCj4gwqAgKsKgwqAgdGhlIGRlZmF1bHQgY29udGV4dC4gVGhhdCBkZWZhdWx0IGNvbnRl
eHQgaXMgdGhlbiB1c2VkIG9uIGV2ZXJ5DQo+IGNvbnRleHQNCj4gwqAgKsKgwqAgY3JlYXRpb24g
dG8gaGF2ZSBhICJwcmltZWQgZ29sZGVuIGNvbnRleHQiLCBpLmUuIGEgY29udGV4dA0KPiBpbWFn
ZSB0aGF0DQo+IC0gKsKgwqAgYWxyZWFkeSBjb250YWlucyB0aGUgY2hhbmdlcyBuZWVkZWQgdG8g
YWxsIHRoZSByZWdpc3RlcnMuDQo+ICsgKsKgwqAgYWxyZWFkeSBjb250YWlucyB0aGUgY2hhbmdl
cyBuZWVkZWQgdG8gYWxsIHRoZSByZWdpc3RlcnMuIFNlZQ0KPiArICrCoMKgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9scmMuYyBmb3IgZGVmYXVsdCBjb250ZXh0IGhhbmRsaW5nLg0KPiDCoCAqDQo+
IMKgICogLSBFbmdpbmUgd29ya2Fyb3VuZHM6IHRoZSBsaXN0IG9mIHRoZXNlIFdBcyBpcyBhcHBs
aWVkIHdoZW5ldmVyDQo+IHRoZSBzcGVjaWZpYw0KPiDCoCAqwqDCoCBlbmdpbmUgaXMgcmVzZXQu
IEl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IGEgc2V0IG9mIGVuZ2luZQ0KPiBjbGFzc2VzIHNoYXJl
IGENCj4gQEAgLTQ4LDEwICs0OSwxMCBAQA0KPiDCoCAqwqDCoCB0aGVtIG5lZWQgdG8ga2VlZXAg
dGhlIHdvcmthcm91bmQgcHJvZ3JhbW1pbmc6IHRoZSBhcHByb2FjaA0KPiB0YWtlbiBpbiB0aGUN
Cj4gwqAgKsKgwqAgZHJpdmVyIGlzIHRvIHRpZSB0aG9zZSB3b3JrYXJvdW5kcyB0byB0aGUgZmly
c3QgY29tcHV0ZS9yZW5kZXINCj4gZW5naW5lIHRoYXQNCj4gwqAgKsKgwqAgaXMgcmVnaXN0ZXJl
ZC7CoCBXaGVuIGV4ZWN1dGluZyB3aXRoIEd1QyBzdWJtaXNzaW9uLCBlbmdpbmUNCj4gcmVzZXRz
IGFyZQ0KPiAtICrCoMKgIG91dHNpZGUgb2Yga2VybmVsIGRyaXZlciBjb250cm9sLCBoZW5jZSB0
aGUgbGlzdCBvZiByZWdpc3RlcnMNCj4gaW52b2x2ZWQgaW4NCj4gKyAqwqDCoCBvdXRzaWRlIG9m
IGtlcm5lbCBkcml2ZXIgY29udHJvbCwgaGVuY2UgdGhlIGxpc3Qgb2YgcmVnaXN0ZXJzDQo+IGlu
dm9sdmVkIGlzDQo+IMKgICrCoMKgIHdyaXR0ZW4gb25jZSwgb24gZW5naW5lIGluaXRpYWxpemF0
aW9uLCBhbmQgdGhlbiBwYXNzZWQgdG8gR3VDLA0KPiB0aGF0DQo+IMKgICrCoMKgIHNhdmVzL3Jl
c3RvcmVzIHRoZWlyIHZhbHVlcyBiZWZvcmUvYWZ0ZXIgdGhlIHJlc2V0IHRha2VzIHBsYWNlLg0K
PiBTZWUNCj4gLSAqwqDCoCBgYGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmNgYCBmb3Ig
cmVmZXJlbmNlLg0KPiArICrCoMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgZm9y
IHJlZmVyZW5jZS4NCj4gwqAgKg0KPiDCoCAqIC0gR1Qgd29ya2Fyb3VuZHM6IHRoZSBsaXN0IG9m
IHRoZXNlIFdBcyBpcyBhcHBsaWVkIHdoZW5ldmVyIHRoZXNlDQo+IHJlZ2lzdGVycw0KPiDCoCAq
wqDCoCByZXZlcnQgdG8gdGhlaXIgZGVmYXVsdCB2YWx1ZXM6IG9uIEdQVSByZXNldCwgc3VzcGVu
ZC9yZXN1bWUNCj4gWzFdXywgZXRjLg0KPiBAQCAtNjYsMjEgKzY3LDM5IEBADQo+IMKgICrCoMKg
IGhhcmR3YXJlIG9uIGV2ZXJ5IEhXIGNvbnRleHQgcmVzdG9yZS4gVGhlc2UgYnVmZmVycyBhcmUg
Y3JlYXRlZA0KPiBhbmQNCj4gwqAgKsKgwqAgcHJvZ3JhbW1lZCBpbiB0aGUgZGVmYXVsdCBjb250
ZXh0IHNvIHRoZSBoYXJkd2FyZSBhbHdheXMgZ28NCj4gdGhyb3VnaCB0aG9zZQ0KPiDCoCAqwqDC
oCBwcm9ncmFtbWluZyBzZXF1ZW5jZXMgd2hlbiBzd2l0Y2hpbmcgY29udGV4dHMuIFRoZSBzdXBw
b3J0IGZvcg0KPiB3b3JrYXJvdW5kDQo+IC0gKsKgwqAgYmF0Y2hidWZmZXJzIGlzIGVuYWJsZWQg
dGhlc2UgaGFyZHdhcmUgbWVjaGFuaXNtczoNCj4gKyAqwqDCoCBiYXRjaGJ1ZmZlcnMgaXMgZW5h
YmxlZCB2aWEgdGhlc2UgaGFyZHdhcmUgbWVjaGFuaXNtczoNCj4gwqAgKg0KPiAtICrCoMKgICMu
IElORElSRUNUX0NUWDogQSBiYXRjaGJ1ZmZlciBhbmQgYW4gb2Zmc2V0IGFyZSBwcm92aWRlZCBp
bg0KPiB0aGUgZGVmYXVsdA0KPiAtICrCoMKgwqDCoMKgIGNvbnRleHQsIHBvaW50aW5nIHRoZSBo
YXJkd2FyZSB0byBqdW1wIHRvIHRoYXQgbG9jYXRpb24gd2hlbg0KPiB0aGF0IG9mZnNldA0KPiAt
ICrCoMKgwqDCoMKgIGlzIHJlYWNoZWQgaW4gdGhlIGNvbnRleHQgcmVzdG9yZS4gV29ya2Fyb3Vu
ZCBiYXRjaGJ1ZmZlciBpbg0KPiB0aGUgZHJpdmVyDQo+IC0gKsKgwqDCoMKgwqAgY3VycmVudGx5
IHVzZXMgdGhpcyBtZWNoYW5pc20gZm9yIGFsbCBwbGF0Zm9ybXMuDQo+ICsgKsKgwqAgIy4gSU5E
SVJFQ1RfQ1RYIChhbHNvIGtub3duIGFzICoqbWlkIGNvbnRleHQgcmVzdG9yZSBiYioqKTogQQ0K
PiBiYXRjaGJ1ZmZlcg0KPiArICrCoMKgwqDCoMKgIGFuZCBhbiBvZmZzZXQgYXJlIHByb3ZpZGVk
IGluIHRoZSBkZWZhdWx0IGNvbnRleHQsIHBvaW50aW5nDQo+IHRoZSBoYXJkd2FyZQ0KPiArICrC
oMKgwqDCoMKgIHRvIGp1bXAgdG8gdGhhdCBsb2NhdGlvbiB3aGVuIHRoYXQgb2Zmc2V0IGlzIHJl
YWNoZWQgaW4gdGhlDQo+IGNvbnRleHQNCj4gKyAqwqDCoMKgwqDCoCByZXN0b3JlLsKgIFdoZW4g
YSBjb250ZXh0IGlzIGJlaW5nIHJlc3RvcmVkLCB0aGlzIGlzIGV4ZWN1dGVkDQo+IGFmdGVyIHRo
ZQ0KPiArICrCoMKgwqDCoMKgIHJpbmcgY29udGV4dCwgaW4gdGhlIG1pZGRsZSAob3IgYmVnaW5u
aW5nKSBvZiB0aGUgZW5naW5lDQo+IGNvbnRleHQgaW1hZ2UuDQo+IMKgICoNCj4gLSAqwqDCoCAj
LiBCQl9QRVJfQ1RYX1BUUjogQSBiYXRjaGJ1ZmZlciBpcyBwcm92aWRlZCBpbiB0aGUgZGVmYXVs
dA0KPiBjb250ZXh0LA0KPiAtICrCoMKgwqDCoMKgIHBvaW50aW5nIHRoZSBoYXJkd2FyZSB0byBh
IGJ1ZmZlciB0byBjb250aW51ZSBleGVjdXRpbmcNCj4gYWZ0ZXIgdGhlDQo+IC0gKsKgwqDCoMKg
wqAgZW5naW5lIHJlZ2lzdGVycyBhcmUgcmVzdG9yZWQgaW4gYSBjb250ZXh0IHJlc3RvcmUgc2Vx
dWVuY2UuDQo+IFRoaXMgaXMNCj4gLSAqwqDCoMKgwqDCoCBjdXJyZW50bHkgbm90IHVzZWQgaW4g
dGhlIGRyaXZlci4NCj4gKyAqwqDCoCAjLiBCQl9QRVJfQ1RYX1BUUiAoYWxzbyBrbm93biBhcyAq
KnBvc3QgY29udGV4dCByZXN0b3JlIGJiKiopOg0KPiBBDQo+ICsgKsKgwqDCoMKgwqAgYmF0Y2hi
dWZmZXIgaXMgcHJvdmlkZWQgaW4gdGhlIGRlZmF1bHQgY29udGV4dCwgcG9pbnRpbmcgdGhlDQo+
IGhhcmR3YXJlIHRvDQo+ICsgKsKgwqDCoMKgwqAgYSBidWZmZXIgdG8gY29udGludWUgZXhlY3V0
aW5nIGFmdGVyIHRoZSBlbmdpbmUgcmVnaXN0ZXJzDQo+IGFyZSByZXN0b3JlZA0KPiArICrCoMKg
wqDCoMKgIGluIGEgY29udGV4dCByZXN0b3JlIHNlcXVlbmNlLg0KPiArICoNCj4gKyAqwqDCoCBC
ZWxvdyBpcyB0aGUgdGltZWxpbmUgZm9yIGEgY29udGV4dCByZXN0b3JlIHNlcXVlbmNlOg0KPiAr
ICoNCj4gKyAqwqDCoCAuLiBjb2RlOjoNCj4gKyAqDQo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU5ESVJFQ1RfQ1RYX09GRlNFVA0KPiArICrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfC0tLS0tLS0tLS0tPnwNCj4gKyAqwqDC
oMKgwqDCoCAuLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS4tLS0tLS0NCj4gLS0tLS0tLS0uLS0tLS0tLS0tLS0uDQo+ICsgKsKgwqDCoMKgwqAgfFJp
bmfCoMKgwqDCoMKgwqDCoCB8IEVuZ2luZcKgwqDCoMKgIHwgTWlkLWNvbnRleHQgfCBFbmdpbmXC
oMKgwqDCoCB8IFBvc3QtDQo+IGNvbnRleHQgfCBSaW5nwqDCoMKgwqDCoCB8DQo+ICsgKsKgwqDC
oMKgwqAgfFJlc3RvcmXCoMKgwqDCoCB8IFJlc3RvcmUgKDEpfCBCQiBSZXN0b3JlwqAgfCBSZXN0
b3JlICgyKXwgQkINCj4gUmVzdG9yZcKgwqAgfCBFeGVjdXRpb24gfA0KPiArICrCoMKgwqDCoMKg
IGAtLS0tLS0tLS0tLS0nLS0tLS0tLS0tLS0tJy0tLS0tLS0tLS0tLS0nLS0tLS0tLS0tLS0tJy0t
LS0tLQ0KPiAtLS0tLS0tLSctLS0tLS0tLS0tLScNCg0KVGhpcyBpcyBncmVhdC4gVGhhbmtzIGZv
ciBhZGRpbmcgdGhlIGRvY3VtZW50YXRpb24gaGVyZSENCg0KSSdtIG5vdCBzdXBlciBoYXBweSBw
ZXIgY29udGV4dCBwb2ludGVyIChQRVJfQ1RYX1BUUikgZXhwYW5kcyB0byAicG9zdA0KY29udGV4
dCByZXN0b3JlKSwgYnV0IEkgZ2V0IHdlJ3JlIGFsc28gYWxpZ25pbmcgd2l0aCB0aGUgaGFyZHdh
cmUNCmRlc2NyaXB0aW9ucy4NCg0KT3RoZXJ3aXNlIGV2ZXJ5dGhpbmcgbG9va3MgZ29vZCBoZXJl
LiBIYXZpbmcgdGhlIGlsbHVzdHJhdGlvbiBpcyBhbHNvDQpyZWFsbHkgaGVscGZ1bDoNClJldmll
d2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IMKg
ICoNCj4gwqAgKiAtIE90aGVyL09PQjrCoCBUaGVyZSBhcmUgV0FzIHRoYXQsIGR1ZSB0byB0aGVp
ciBuYXR1cmUsIGNhbm5vdCBiZQ0KPiBhcHBsaWVkIGZyb20NCj4gwqAgKsKgwqAgYSBjZW50cmFs
IHBsYWNlLiBUaG9zZSBhcmUgcGVwcGVyZWQgYXJvdW5kIHRoZSByZXN0IG9mIHRoZQ0KPiBjb2Rl
LCBhcyBuZWVkZWQuDQo+IC0gKsKgwqAgV29ya2Fyb3VuZHMgcmVsYXRlZCB0byB0aGUgZGlzcGxh
eSBJUCBhcmUgdGhlIG1haW4gZXhhbXBsZS4NCj4gKyAqwqDCoCBUaGVyZSdzIGEgY2VudHJhbCBw
bGFjZSB0byBjb250cm9sIHdoaWNoIHdvcmthcm91bmRzIGFyZQ0KPiBlbmFibGVkOg0KPiArICrC
oMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMgZm9yIEdUIHdvcmthcm91bmRz
IGFuZA0KPiArICrCoMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfd2Ffb29iLnJ1bGVz
IGZvciBkZXZpY2UvU29DDQo+IHdvcmthcm91bmRzLg0KPiArICrCoMKgIFRoZXNlIGZpbGVzIG9u
bHkgcmVjb3JkIHdoaWNoIHdvcmthcm91bmRzIGFyZSBlbmFibGVkOiBkdXJpbmcNCj4gZWFybHkg
ZGV2aWNlDQo+ICsgKsKgwqAgaW5pdGlhbGl6YXRpb24gdGhvc2UgcnVsZXMgYXJlIGV2YWx1YXRl
ZCBhbmQgcmVjb3JkZWQgYnkgdGhlDQo+IGRyaXZlci4gVGhlbg0KPiArICrCoMKgIGxhdGVyIHRo
ZSBkcml2ZXIgY2hlY2tzIHdpdGggYGBYRV9XQSgpYGAgYW5kIGBgWEVfREVWSUNFX1dBKClgYA0K
PiB0bw0KPiArICrCoMKgIGltcGxlbWVudCB0aGVtLg0KPiDCoCAqDQo+IMKgICogLi4gWzFdIFRl
Y2huaWNhbGx5LCBzb21lIHJlZ2lzdGVycyBhcmUgcG93ZXJjb250ZXh0IHNhdmVkICYNCj4gcmVz
dG9yZWQsIHNvIHRoZXkNCj4gwqAgKsKgwqDCoCBzdXJ2aXZlIGEgc3VzcGVuZC9yZXN1bWUuIElu
IHByYWN0aWNlLCB3cml0aW5nIHRoZW0gYWdhaW4gaXMNCj4gbm90IHRvbw0KPiANCg0K
