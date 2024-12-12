Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF946E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 19:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905D10E146;
	Thu, 12 Dec 2024 19:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+G2F5we";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D310E146
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734031905; x=1765567905;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fe3z16jC5agdvBzFf0be7g/UqPDrxwwlxEXR5nX/IIo=;
 b=G+G2F5weqPdhXRHSaf50oKTGVYKkjNvgO7zV4pKkAD5j2YP+c48qQJkO
 Iv0wdrcECzGmZU0B0s6mU7FW8reW/g5jXsRJ8HyEHJURHRwlln5cBGfBY
 CHRY3g7O1nzQ78p9alEusp0VVtDhknwzVoLBH+8DLIbtKrke8oNrg8wdj
 vIV64vTBKqF0EIWFq4pceI4DmLIYhP2Zi/6OOdYvSpXzJTe7GCtQQJQem
 MuMOTDhE5HMS1EP1lPk71Iu5ORMVPqqh7Wbr/NxL+viMWNe7XZa7cCQEw
 acdCuUEPN+ABGJ5t9rqKE3nL8lRWUUX1vDPwDt2EeGCycAag89fHHZoPU g==;
X-CSE-ConnectionGUID: TGlHBHUrSKmpn5teJNM0pg==
X-CSE-MsgGUID: NyjrEma0R3KafGG8wYb0nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38405162"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38405162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:31:44 -0800
X-CSE-ConnectionGUID: FR6+8x7XTSSegWiSrs2bgA==
X-CSE-MsgGUID: 8pH5PTb4RO2VFKqjJcIRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96733794"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 11:31:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 11:31:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 11:31:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 11:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2WRESmOslLs+G/KD6TvJXutlUrAbILNE8qKpJY79jQuqyYGpfcDPtJR7oIhCWTmj9174awF9ntOKr3P76aFdpXU50rqa24LrBkiuj5KGH1r4lXY/Iu8Xvu1iqnNhRmfIVLn/12VMcvBwLbaVZ2feE+0aFrxF1TKrsx1dzevGAxyOy6/0ZKA8JnU72IHlg9RRGdU0JQZKVyJiK7faHHXJ3YKVvyqHrOoOTXIeoYCeB4GZAPXtU5voL5pH3Jkxg1i8o3sLDqpY99jUGlkTS9TGOQW6dU7cU3a3dMg2VC/JEFEP4n+HwZAxu3s8N3CzF+sl/fZkTN0WKGsa0gc+GAsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe3z16jC5agdvBzFf0be7g/UqPDrxwwlxEXR5nX/IIo=;
 b=E0/seLDL6m2AAAtu+pSpPPfDvAFfMfdxeMdb2QBGpDTt3ZTIwleh+uK+QIai2v9VB/JEH2DwLRpWt2ALiYo4rCN7kmrwSechvWgIGWL71b0EbSzhcWLpQpnbokgQ70i3REbGTBtUBaSac6z785F+Vic0YOsszDUhoG6uWQmeLa7CvARByCglwpe+h3kqKDBPcB0DOhkX0YAPfuaJps4jZa2cy7wvzkDXfF6qh49Mf6kVJMxZcK5JrK7wiIovQP9D92qE/qbTujPZDlmjRzRrKVvF/97WmNS/1I9mSnVI3YoAhFVi7ECjuYj07kunFtFZ3Xs1mKLESfA8rt/imaX2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 19:31:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 19:31:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
Thread-Topic: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings
 and add tile info
Thread-Index: AQHbFS22wULV4kwY+0uYXcAdod4eerLjWfGAgAALqYCAAAj2gA==
Date: Thu, 12 Dec 2024 19:31:40 +0000
Message-ID: <0825f33b47eaddf533bb378325b89202a43e34f3.camel@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
 <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
 <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
In-Reply-To: <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB8454:EE_
x-ms-office365-filtering-correlation-id: 40ec15e7-33d0-4034-6c67-08dd1ae39a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFN0MmNzdmZYZ3JZYmc3aHJudFNYSW1YOG5vRHFOMk5EeUl5UC9IZ21zaCtr?=
 =?utf-8?B?SU9JWklMUEtyZnBYeXhwZmQwaUdwZ3NsdWE1YllYWG9iQ2lyU1hGc0JNbDg4?=
 =?utf-8?B?QWp3ZVJSTS9UOEZtZlQ1Y3l0ODNuUWtJTzV1bWZIbDhMMytFL2pMOFVOZDJ2?=
 =?utf-8?B?Zno1UEhoeVR6VzVieE1uUzFwVDNTMTNwcUNIeXhtRHdZRnZVUU53NzJ5SFVo?=
 =?utf-8?B?U010dHI2dVNIT2Qyb05CclNjb21pdmVPTnJ5MWNibkZjUktjS2E0T09HbVMz?=
 =?utf-8?B?ejJRWlNYMi9QZ2VBWUF3NjNzWi9aR2tqTngwVVNBNWFDOWx1NzQ5azB0UmFp?=
 =?utf-8?B?K3hyanpvYzltT1dTZjVpTjkrT1lMbG5HU096bXBaS0IxSEN4eGxQa0ZXZytO?=
 =?utf-8?B?cTU3aTJlTjM5dUxzUDVpMC9KZnoxeEExYitLNkM3UkxZU3pWay80MXMzcGNN?=
 =?utf-8?B?VDYxM040NGFDOCtoQmVjM1Y3cENMNyt0UHlkdkJ3aFRWTDQrQ2h2YVQ5RVdI?=
 =?utf-8?B?TllpTzh5VWlGNGplM0RqR252Y29wUSs3SVRiZTJrTXpXT2ljZEEydzV5N0Rs?=
 =?utf-8?B?ODNhT0owV2FCVDEvYUZnVjNKMUIyNTJtUXIvekRsR2YyRWpXZGdqR1p2Rnp5?=
 =?utf-8?B?cjE1aEhOV1Y2YTFhVi9GQkxnbmhUTS9CSVh3NmJVRXVGL1lRdGovUk9rUFc2?=
 =?utf-8?B?WXlyZHo1MDBOUUcwQUtYQjJoREZ1YWpCSHh5ay9ORGEzWjIyTERGSUJCVnJk?=
 =?utf-8?B?ZzJZWXBVM3JjQnJIZ29mWUtKQjdEdzdXK0xqVW5SaC8wbHpjVDRPOFpQNFE0?=
 =?utf-8?B?MjFoRHhnOUtFY1RnTy9FYWQyNkUrMmpBVUdmblBTQ2hUMGQvS1I1MHR2bGZy?=
 =?utf-8?B?ZWJiRXRFcFprZjZ3bjgwOVliYU0zdXYyQ0wwajFIWStGWmJzYk5kMEdZekRl?=
 =?utf-8?B?akJ5V3kwWkdpdWJ4MnQ2aFdwUXR6bFNUd3hQckhnQ1dYbTdOVTEwcWtsNnFx?=
 =?utf-8?B?dmFzQ3hsaXZ2Q0hhck85U2plSzA5Nlh1dDI3cVhYQnppRm1pck80eHJmaUY5?=
 =?utf-8?B?cHF2VmVtaU41WkJHR0RuNUZBY1d3ZlZpRmZQMmZaOHZGbzZjTjFsaTVpSCta?=
 =?utf-8?B?dWFFQ2JQU3czeHM0SC9iRWVtbDgxenpWTFJzbjB0YVVtQ0NTT1phM1k1cE03?=
 =?utf-8?B?ZUZ1ZTMvRjkyQXNPeHd0T3U4NS9tRkh0bmdyblVLcWtKdmlmNGN0RkozWHlB?=
 =?utf-8?B?NGdreENBQXVSYUJqZHpVSnVnQkQ5eitsNWpzckZmdTQ4ekhJNEgrWGVZUEMr?=
 =?utf-8?B?a1BoRStyUDhYQmo5TENIRlNWMFdXK0l4dnBsemRNQVlnNlpLY1Q1Z083eDE5?=
 =?utf-8?B?Q3hBUFlMR05zdkFjQmpqMllqbkkxYU81ZXZvckZSL09PRHlzN0ozYTlOdjB6?=
 =?utf-8?B?QlpWcXBSdHdKZExPazVpd3NVRy8vcm85SVZrMSsxaFE3Ujl0RGxZYS9Yd1BN?=
 =?utf-8?B?dDhVT2tKbmZZQm90U3hZSXhBeUE0TjlJNUdLcmxnYjZCeGhyV2FyWWtDVSs3?=
 =?utf-8?B?YjMxWWtXTmQyeTQzRkFuS0M1OU9JUlJKUkh1YW9YQnlVY2M0QitNNVp2QU5M?=
 =?utf-8?B?M3BRRXlqYmVQbGVKYmRmSG5xR1NUbkZaaWN3VkRMWVk3cjRTWEpoekxWT0N6?=
 =?utf-8?B?UytnSHdMSWFieFJoRDZnSWQrN2p4azdMR2tIMERZemxiZGpXb1J1Zk1La1dR?=
 =?utf-8?B?WC9XKys5cE5FZ3VNd1FQN3dteWpTZmxpekNlN3VmbnJ4K2ZWUmRKZU4zZkZp?=
 =?utf-8?B?SWlHMk1RbEM1N2pHM3Z3THV4NW8xaGE5MW5nNDVBSDRPZzVlNDU3OHZiNTRL?=
 =?utf-8?B?RS9FcWJISTRJUFBxQk41cmtBREJ5bm9jR2NXWFNDZG81d1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFdPTTdscVh1aTNyTkIvVGQ1RERrejV6dmg1eEVJL016SithMFdDdGhVc3Rv?=
 =?utf-8?B?OVMyU3BOY3l5VWlkWlVJNXUvRVhYR3hkdjdWend3TVBXYm5vOFp4Sk5MSGRm?=
 =?utf-8?B?bWp6UTNKVTRxVkZOR0xwU3YvbTJ2R2xIbnIybVlSN0F6c0FyMk94cDVUZVRo?=
 =?utf-8?B?LytyamFlTHozcGtvUEw4ZWczL0FXVVVJS0Q1K3JaTXNON1piYjQvN09DTVAv?=
 =?utf-8?B?QytVb3pnOUJrdXVZbWhMODBYRnBKR2NNWXhvQXhCUmhwZG9Va04ySEM2L29J?=
 =?utf-8?B?bjVnVmY2VjIzd1FiS1czeUFTN2ZqcXJMeDl2elEybDhRNjFMdjRjT2NJYTNl?=
 =?utf-8?B?cmVPUEp6amlGbXY4T0dOL29NdEtwVUs5SCtkSkd5ZG9ZODBwOHRwUStMcDRw?=
 =?utf-8?B?UXM3NWt1N2ZxM2tlZkFSTm8xUm5ucWxITk9WbGVyaWI4emJkRC9BRkRwNllD?=
 =?utf-8?B?UFoxWVFJSmJPbUdlbEtLbDltNjd4MnB2VjY2M2lqbExGZ2ZwaGMxNHU4b3Rk?=
 =?utf-8?B?SjNrYjdFSmN6aGREK1NkTUNvS3pVR05SN21xRWZKN2duaTZCTFZWUkVqV0V3?=
 =?utf-8?B?Snh5VHdTNjA4bFM3eExuQ21CeHJ0WmhYMnFIYlFWSGZacEhqVitaQ0I5RVVk?=
 =?utf-8?B?dWJ6OHFDdWwxMmF1UU8yS1hrTlJvdEJuMzBzR2JYdE04dWplbUtmbGdCYlV5?=
 =?utf-8?B?NEFSeGNHQ1NGd0hUWnd5R1pkYzJnSHZsZ3cwOXhsRmlMUFZ6czlQYnJiV1h1?=
 =?utf-8?B?cjN2dEZxRlltYTljQjNWUTFLUGx1TWgyelA3K0M0RWpZNitZUUlLYkp6aXoy?=
 =?utf-8?B?aEpZYk5rL3NOd3NCdlFnTVNuN1FFcEEwMUtLSXpJM0UwQ1diS3JvOFMwWkJs?=
 =?utf-8?B?YVpIL3hTb1VHWkJBeDM0bVp3YVdsYWY0NWdocDBadWFUK1FCblFUa2owQ0lW?=
 =?utf-8?B?Tkl0YUJQay93UzJleWtJK2gvNTlxMGZuSnl2SFNuTm9LSGd6aVBDaDk0Nlk2?=
 =?utf-8?B?NHdRaVZHc0tQUFIvbFBtZEtJZnVZbmQvdVI1MW1EY1RieGNxMVkzWDdTSWJw?=
 =?utf-8?B?bUZlaFlybnZ3c09lSFB2OStlUDdrRVB1cStaQzJqY1BSSi9iOTkvallhWEdj?=
 =?utf-8?B?VWFQK1E1STNvVnh1T09mbWJxcTNXejlwKzcrbEV1SFdrSzMwV0RoSTd4ODQ2?=
 =?utf-8?B?UGNzK2FYN211SmIyNmxSSW9LcWwxOWV4aW5HQSt4SHE0TTBIZHo5NFNGME1a?=
 =?utf-8?B?ZzRqQzA4VE8vRmtHTWEwVUFMZGhHZDNSdXBWV0xwOWdLSVhkNDBRMDJsN0Vz?=
 =?utf-8?B?VXNEUUJJdExFK3E3b28ycndNeXlaRzhnTTBIWlRjOFJUY2lWTEl6UWF6akky?=
 =?utf-8?B?WitZMnRrWjlGQ2ZqZy85bm00M2xWNzZQUml6eFdaZ3YzbTlnWGp6OXJpWHFn?=
 =?utf-8?B?TThkeTBxOVFpVGhLRFlvSERyUmM1NDJ6MFo4UGl0VGxrYWZGTEFlMit0VEVZ?=
 =?utf-8?B?WXJPY0tZc2FmOVhRWkRYWWNOdG95WkNUU2RDNTlhK25DYzlFMnpPdUxJekps?=
 =?utf-8?B?TXdyK1lWMDUrTWowMVpzWmhRb3h3eVNzdkU3MEMvOWV0SjRFOGM1Mzhtd25C?=
 =?utf-8?B?SElBMDdhcmVsLzZJSUNKbWVYWXNDL2F5cTF2ZnFLSW5HVEVUNHNoT2tSdkJt?=
 =?utf-8?B?Z0QvanBuZitXbzRjamQxaXpta096ZCtqUkpPbmE1R0lKRGsyTjdBc0U1MjIx?=
 =?utf-8?B?cHVaN2E4ZEhtYVZwRDdVQ3VyQm1yaWRZdzEyTFBvSjhCcllLTkNyVDR6bG1V?=
 =?utf-8?B?YVNlNmQvQXlrd2x3cXJUdzZhb2RyVFYzV0lkMDlqY1B2OGx5YlBPK2NlYlpR?=
 =?utf-8?B?MVlyVU1rS2syd2dXcnNySE9hMStLUFRBelhSek9VL3BObU5YWnRuWHc0VmIw?=
 =?utf-8?B?NGdDbmpIcVUvZHZCelE2OHA2MXQ1UTJEdHdmRTFDc0VMY3NmSVFXOGNCeG4w?=
 =?utf-8?B?TGw4c2IxbHBmYUt1WXVPWEtOZHRhOGNGdXpyMzFsZmFaeUlBVFd3MUgxNklL?=
 =?utf-8?B?U0g3VVl5TUZ5cWFjVFh3OTdDSUtzWUhUN3VHVlV2UnR3azlpbGVhVWZqSE02?=
 =?utf-8?B?bys5MXg4eGZCdjdyaFlWMGZqUTYrRkl1dU9jb3h4eEU3aEU2VktiT1dOR3BH?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F63F22588596994B88A32D5224A4FD3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ec15e7-33d0-4034-6c67-08dd1ae39a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 19:31:40.2396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaJMnUXCtIWwDLyFJYRdZMSHwNrI/34DUiI/T2sh2ktkj+3nprjpv8BamOcVMXHEyR5LGAoT077+RclGa7i1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDEwOjU5IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMi8xMi8yMDI0IDEwOjE3LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBXZWQsIDIw
MjQtMTAtMDIgYXQgMTc6NDYgLTA3MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6
DQo+ID4gPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0K
PiA+ID4gDQo+ID4gPiBUaGUgeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3QgaXMgbm90IHJlYWxs
eSBhIEd1QyBpbnRlcm5hbCB0aGluZyBhbmQNCj4gPiA+IGlzIGRlZmluaXRlbHkgbm90IGEgR3VD
IENUIHRoaW5nLiBTbyBnaXZlIGl0IGl0cyBvd24gc2VjdGlvbiBoZWFkaW5nLg0KPiA+ID4gVGhl
IHNuYXBzaG90IGl0c2VsZiBpcyByZWFsbHkgYSBjYXB0dXJlIG9mIHRoZSBzdWJtaXNzaW9uIGJh
Y2tlbmQncw0KPiA+ID4gaW50ZXJuYWwgc3RhdGUuIEFsdGhvdWdoIGFsbCBpdCBjdXJyZW50bHkg
cHJpbnRzIG91dCBpcyB0aGUgc3VibWlzc2lvbg0KPiA+ID4gY29udGV4dHMuIFNvIGxhYmVsIGl0
IGFzICdDb250ZXh0cycuIElmIG1vcmUgZ2VuZXJhbCBzdGF0ZSBpcyBhZGRlZA0KPiA+ID4gbGF0
ZXIgdGhlbiBpdCBjb3VsZCBiZSBjaGFuZ2UgdG8gJ1N1Ym1pc3Npb24gYmFja2VuZCcgb3Igc29t
ZSBzdWNoLg0KPiA+ID4gDQo+ID4gPiBGdXJ0aGVyLCBldmVyeXRoaW5nIGZyb20gdGhlIEd1QyBD
VCBzZWN0aW9uIG9ud2FyZHMgaXMgR1Qgc3BlY2lmaWMgYnV0DQo+ID4gPiB0aGVyZSB3YXMgbm8g
aW5kaWNhdGlvbiBvZiB3aGljaCBHVCBpdCB3YXMgcmVsYXRlZCB0byAoYW5kIHRoYXQgaXMNCj4g
PiA+IGltcG9zc2libGUgdG8gd29yayBvdXQgZnJvbSB0aGUgb3RoZXIgZmllbGRzIHRoYXQgYXJl
IGdpdmVuKS4gU28gYWRkIGENCj4gPiA+IEdUIHNlY3Rpb24gaGVhZGluZy4gQWxzbyBpbmNsdWRl
IHRoZSB0aWxlIGlkIG9mIHRoZSBHVCwgYmVjYXVzZSBhZ2Fpbg0KPiA+ID4gc2lnbmlmaWNhbnQg
aW5mb3JtYXRpb24uDQo+ID4gPiANCj4gPiA+IExhc3RseSwgZHJvcCBhIGNvdXBsZSBvZiB1bm5l
Y2Vzc2FyeSBsaW5lIGZlZWRzIHdpdGhpbiBzZWN0aW9ucy4NCj4gPiA+IA0KPiA+ID4gdjI6IEFk
ZCBHVCBzZWN0aW9uIGhlYWRpbmcsIGFkZCB0aWxlIGlkIHRvIGRldmljZSBzZWN0aW9uLg0KPiA+
ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25A
SW50ZWwuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IEp1bGlhIEZpbGlwY2h1ayA8anVsaWEuZmls
aXBjaHVrQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2Y29yZWR1bXAuYyAgICAgICB8IDUgKysrKysNCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmggfCAzICsrLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICB8IDEgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdC5jICAgICAgICB8IDIgKy0NCj4gPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICAgfCAxIC0NCj4gPiA+ICAgNSBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gPiBpbmRleCBkMjM3MTlkNWMyYTMuLjI2OTBm
MWQxY2RlNCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3Jl
ZHVtcC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0K
PiA+ID4gQEAgLTk2LDggKzk2LDEzIEBAIHN0YXRpYyBzc2l6ZV90IF9feGVfZGV2Y29yZWR1bXBf
cmVhZChjaGFyICpidWZmZXIsIHNpemVfdCBjb3VudCwNCj4gPiA+ICAgCWRybV9wcmludGYoJnAs
ICJQcm9jZXNzOiAlc1xuIiwgc3MtPnByb2Nlc3NfbmFtZSk7DQo+ID4gPiAgIAl4ZV9kZXZpY2Vf
c25hcHNob3RfcHJpbnQoeGUsICZwKTsNCj4gPiA+ICAgDQo+ID4gPiArCWRybV9wcmludGYoJnAs
ICJcbioqKiogR1QgIyVkICoqKipcbiIsIHNzLT5ndC0+aW5mby5pZCk7DQo+ID4gPiArCWRybV9w
cmludGYoJnAsICJcdFRpbGU6ICVkXG4iLCBzcy0+Z3QtPnRpbGUtPmlkKTsNCj4gPiA+ICsNCj4g
PiA+ICAgCWRybV9wdXRzKCZwLCAiXG4qKioqIEd1QyBDVCAqKioqXG4iKTsNCj4gPiA+ICAgCXhl
X2d1Y19jdF9zbmFwc2hvdF9wcmludChzcy0+Y3QsICZwKTsNCj4gPiA+ICsNCj4gPiA+ICsJZHJt
X3B1dHMoJnAsICJcbioqKiogQ29udGV4dHMgKioqKlxuIik7DQo+ID4gPiAgIAl4ZV9ndWNfZXhl
Y19xdWV1ZV9zbmFwc2hvdF9wcmludChzcy0+Z2UsICZwKTsNCj4gPiBUaGlzIGJyb2tlIE1lc2Eg
cGFyc2VyIQ0KPiA+IEl0IGNhbid0IG5vdyBwYXJzZSB0aGUgZXhlY19xdWV1ZSBjb250ZXh0IGJl
Y2F1c2UgaXQgd2FzIGV4cGVjdGVkIHRvIGJlIG9uIHRoZSAnKioqKiBHdUMgQ1QgKioqKicgc2Vj
dGlvbi4NCj4gVGhlbiB0aGUgbWVzYSBwYXJzZSBuZWVkcyB0byBiZSB1cGRhdGVkLiBUaGF0IHdh
cyBjbGVhcmx5IGEgYnVnIC0gZXhlYyANCj4gcXVldWUgY29udGV4dHMgYXJlIGFic29sdXRlbHkg
bm90IEd1QyBDVCBkYXRhIGFuZCBzaG91bGQgbm90IGJlIGluIHRoZSANCj4gR3VDIENUIHNlY3Rp
b24uDQoNCkRvbid0IG1hdHRlciBpZiBpdCBpcyBhIGJ1ZyBvciBub3QsIGl0IGJyb2tlIHRoZSBw
YXJzZXIuDQpJZiB0aGlzIGlzIG5vdCByZXZlcnRlZCB3ZSB3aWxsIGhhdmUgb2xkZXIgS2VybmVs
IHZlcnNpb25zIHRoYXQgZG9uJ3Qgd29yayB3aXRoIG5ld2VyIE1lc2EgYW5kIG5ld2VyIEtlcm5l
bCB2ZXJzaW9ucyB0aGF0IGRvbid0IHdpdGggb2xkIE1lc2EuDQoNCj4gDQo+IEpvaG4uDQo+IA0K
PiA+IA0KPiA+ID4gICANCj4gPiA+ICAgCWRybV9wdXRzKCZwLCAiXG4qKioqIEpvYiAqKioqXG4i
KTsNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBf
dHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oDQo+ID4g
PiBpbmRleCA0NDBkMDVkNzdhNWEuLjNjYzJmMDk1ZmRmYiAxMDA2NDQNCj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaA0KPiA+ID4gQEAgLTM3LDcgKzM3
LDggQEAgc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90IHsNCj4gPiA+ICAgCS8qIEd1QyBz
bmFwc2hvdHMgKi8NCj4gPiA+ICAgCS8qKiBAY3Q6IEd1QyBDVCBzbmFwc2hvdCAqLw0KPiA+ID4g
ICAJc3RydWN0IHhlX2d1Y19jdF9zbmFwc2hvdCAqY3Q7DQo+ID4gPiAtCS8qKiBAZ2U6IEd1YyBF
bmdpbmUgc25hcHNob3QgKi8NCj4gPiA+ICsNCj4gPiA+ICsJLyoqIEBnZTogR3VDIFN1Ym1pc3Np
b24gRW5naW5lIHNuYXBzaG90ICovDQo+ID4gPiAgIAlzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVj
X3F1ZXVlX3NuYXBzaG90ICpnZTsNCj4gPiA+ICAgDQo+ID4gPiAgIAkvKiogQGh3ZTogSFcgRW5n
aW5lIHNuYXBzaG90IGFycmF5ICovDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiBp
bmRleCAwOWE3YWQ4MzBlNjkuLjAzMGNmNzAzZTk3MCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jDQo+ID4gPiBAQCAtOTYxLDYgKzk2MSw3IEBAIHZvaWQgeGVfZGV2aWNlX3Nu
YXBzaG90X3ByaW50KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAp
DQo+ID4gPiAgIA0KPiA+ID4gICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiA+ID4gICAJ
CWRybV9wcmludGYocCwgIkdUIGlkOiAldVxuIiwgaWQpOw0KPiA+ID4gKwkJZHJtX3ByaW50Zihw
LCAiXHRUaWxlOiAldVxuIiwgZ3QtPnRpbGUtPmlkKTsNCj4gPiA+ICAgCQlkcm1fcHJpbnRmKHAs
ICJcdFR5cGU6ICVzXG4iLA0KPiA+ID4gICAJCQkgICBndC0+aW5mby50eXBlID09IFhFX0dUX1RZ
UEVfTUFJTiA/ICJtYWluIiA6ICJtZWRpYSIpOw0KPiA+ID4gICAJCWRybV9wcmludGYocCwgIlx0
SVAgdmVyOiAldS4ldS4ldVxuIiwNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0K
PiA+ID4gaW5kZXggMGFjNGExOWVjOWNjLi44NjkwZGY2OTkxNzAgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBAQCAtMjI0MCw3ICsyMjQwLDcgQEAg
eGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhl
Y19xdWV1ZV9zbmFwc2hvdCAqc25hcHMNCj4gPiA+ICAgCWlmICghc25hcHNob3QpDQo+ID4gPiAg
IAkJcmV0dXJuOw0KPiA+ID4gICANCj4gPiA+IC0JZHJtX3ByaW50ZihwLCAiXG5HdUMgSUQ6ICVk
XG4iLCBzbmFwc2hvdC0+Z3VjLmlkKTsNCj4gPiA+ICsJZHJtX3ByaW50ZihwLCAiR3VDIElEOiAl
ZFxuIiwgc25hcHNob3QtPmd1Yy5pZCk7DQo+ID4gPiAgIAlkcm1fcHJpbnRmKHAsICJcdE5hbWU6
ICVzXG4iLCBzbmFwc2hvdC0+bmFtZSk7DQo+ID4gPiAgIAlkcm1fcHJpbnRmKHAsICJcdENsYXNz
OiAlZFxuIiwgc25hcHNob3QtPmNsYXNzKTsNCj4gPiA+ICAgCWRybV9wcmludGYocCwgIlx0TG9n
aWNhbCBtYXNrOiAweCV4XG4iLCBzbmFwc2hvdC0+bG9naWNhbF9tYXNrKTsNCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiA+IGluZGV4IGVhNmQ5ZWY3ZmFiNi4uNmM5YzI3MzA0
Y2RjIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5j
DQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiA+IEBA
IC0xMDg0LDcgKzEwODQsNiBAQCB2b2lkIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9wcmludChzdHJ1
Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90ICpzbmFwc2hvdCwNCj4gPiA+ICAgCWlmIChzbmFwc2hv
dC0+aHdlLT5jbGFzcyA9PSBYRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSkNCj4gPiA+ICAgCQlkcm1f
cHJpbnRmKHAsICJcdFJDVV9NT0RFOiAweCUwOHhcbiIsDQo+ID4gPiAgIAkJCSAgIHNuYXBzaG90
LT5yZWcucmN1X21vZGUpOw0KPiA+ID4gLQlkcm1fcHV0cyhwLCAiXG4iKTsNCj4gPiA+ICAgfQ0K
PiA+ID4gICANCj4gPiA+ICAgLyoqDQo+IA0KDQo=
