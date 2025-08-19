Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B95CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 14:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400310E613;
	Tue, 19 Aug 2025 14:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSGP6Ujt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C22B10E613
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755614423; x=1787150423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e0szGIQffXPszwfSBwOtBHR8OHTYrAUYrv5utWp1eW0=;
 b=lSGP6Ujt/MYKhlPC5Pmnj9wDdjuPCksk4CsV8juI9e3BUF+ZCXina20E
 VyEKBJx9AH7gcmzUhnYOic3F2M/DvDfe/vdNLuzmEYGm4nEb6CsfeIwV4
 acrI7esxdgYa+b/5jBhGDMjLEAr+SCHLhTv5aLK37uogIYZAK5Z4goxm3
 icRjMbhNrv+Y5yNNoEKlDijok85USx/xULl8JFvGT29FuuL90CiW8gClG
 /HcJrvA715qCV3agTHeDxujKg5gnqVlfWXKhsMwOie0qmTG6U3FthxtoW
 aDME3MeuQNrWNny3WOPgf3YRsT5FAoG2+BiB6c8gXHMBr07KZKNsrBB2i w==;
X-CSE-ConnectionGUID: VbGlIRNfS7qm9H8T9SUtFg==
X-CSE-MsgGUID: oNZb5N2pScqFsufGLd78fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57814382"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57814382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:40:22 -0700
X-CSE-ConnectionGUID: 3+3iy+ISRgyIEwGCkqcxMw==
X-CSE-MsgGUID: KEd6BpuOR5mlgAnw2RLOxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168663296"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:40:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 07:40:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 07:40:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 07:40:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJYnsxn4VvR8sMVuHDj7NgTqzSHk8cveHJebO1ZlK1aLHbRQAqXC/F1tv7hXcZjDgrRBIvSup0PZCiTWXh9so/NN//G6dgujClfnDruOX6cpwYhM7QKzGjg3TdCU7zI0vR+aW922CqUK1auAEbWvz5KNSARsDKhcQuYKSXPxth+8NB4td31s8x4RxY5uIAqz4cVogxpx0Lv6DnL8i1loSwoWlX2cnj9NIFb7CKPPqW3CBorjq6DRCScyRiGPvOiqVoZRFQZz48J0QP7QOMioAr8x8xA/vrNEL4vleUy37y7GyrdnTgQDMej7EFxVVxQsqUxPu7VjOMF+R0eRnOAcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0szGIQffXPszwfSBwOtBHR8OHTYrAUYrv5utWp1eW0=;
 b=vtEvc4E+NPXX811TDUSUT3Ol8R43wYN/0RaQtciwpkupIt6tWrqvYLnIiRuDVrMqkfI/W0w0BemSO8fRJ/99oksL7nawRp2MfcLRjutAo85c6IZZD8DcbQIvUHiSa3WIZAV+5oakV9GkYqmdocO05UGsOFWUKR1apVbUa7lyT1KzFwlx310eDus77KZGHlL6TPf2R3f5CFteyqyk9n9iKTWRZmA57sqhe9N69wBjlmL6nAGTlMetpZSi+mBSjdJphNKihHCucBvF2Ryf7ThMzWk9CKdIBU2wE9XZB9bTQuZbQAn30Z+7mElDYD4PrNpr8qDxSyn9m99awmuyhrRBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 14:40:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 14:40:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Topic: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Index: AQHcDIwbH+rpx2v8n0yJGd2SKdqOkbRnETWAgAMECwA=
Date: Tue, 19 Aug 2025 14:40:18 +0000
Message-ID: <e7ef84617854cdadeaa9a86d06c58c4ad43fd659.camel@intel.com>
References: <20250813195428.140800-1-stuart.summers@intel.com>
 <aKIFK2wGC8T6qarE@intel.com>
In-Reply-To: <aKIFK2wGC8T6qarE@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB5889:EE_
x-ms-office365-filtering-correlation-id: 119ebdf4-e871-45b4-5fc8-08dddf2e514f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akYrZTZkMnYyYk5TMEpXTDg4WVJKbG9nbEt5dkZ4QUlQclF6TTJSMHRDcGdP?=
 =?utf-8?B?VGg3dklRN29QYUhUZUg1UkhaL2I3VGpjbjkwci9mM20wclcyTExBMERQUDdH?=
 =?utf-8?B?Y3FFalhDajF0S3c3bFp1RGxiS1RGQVdvb2dXNE0zRW9hL09aUFZ5R0lMWmJy?=
 =?utf-8?B?NnJVeU9SRHhjZWs5Q0h2a3VNaW9RNFV5UWJrTlIrenZSS0Uxdzh2WTRyN3hp?=
 =?utf-8?B?U0tMSVZGTFpIWGI3NStVV2V1c0c4WTZVN2pDdXNEWmVCYkhVR2JnWTRXWTFT?=
 =?utf-8?B?aTl6eUNwYjF3RlgxMlA2RlFRbHM5dUpQdnpqdk4rQnZObjV5S3ZZdzQ0NUN5?=
 =?utf-8?B?V2RxcHExSy9CTzRZZVVUcEZNbnNNaUd4NjVuNHRnd3B4bFRhSDNraVNXelhp?=
 =?utf-8?B?dlR2Q0RaQTVDbWtXRTVCVnhXRGxrVC9MTXhvNUUxNHJ5RU05SENyZTVsbmxx?=
 =?utf-8?B?b1E5RDV5am5ITW5HWE9ORWN2SEU1Y0Q2THZUTjFYQkViVzFBTDd5SmlhbUJ2?=
 =?utf-8?B?VWUvQks1L1VJZnRGTzUyTkdLb29MN0lGM0xQMXR6cW95ZUthc0p2T2s1NmdO?=
 =?utf-8?B?aWh0Nkt4Um5wSk5UcEM0UlZWejcvWkJFaXpOVlRsTDFOZndWN2kzVXhRUDBW?=
 =?utf-8?B?NWQ4RFBxbTlUZUloUGlXL1VZMjlqQ1hrbTFUdERXSEZ2SVhjQ2pSRm9SWkFF?=
 =?utf-8?B?R1daaG5aU3EveTM1Y2JoekFNNkg0blN1SVZ4bndNM1d1SDZEUk56ODJrVGJH?=
 =?utf-8?B?WUhUdUg0bCtpT2hPM1FmUlh5elZ1ME1tMnY5eWpXLzNGYm1FbUp3T0lQODhY?=
 =?utf-8?B?L2dDdDA0bk5UVGhYRU5iZmFsRTVGNHJtM0N1MFVyaldIYjZxR25EOGRRWHpM?=
 =?utf-8?B?ODlQZGR2SStLSWE4b1o3RU1oNXRrQjlaWjF1MkpoR2F3WG9RVWdWNXZyK0ly?=
 =?utf-8?B?TE8xeXBQVnc3a2hRODZHRXJCb0ozVUNSTFlsWll4UWs5SmdsMDhlWXJYZlJ1?=
 =?utf-8?B?bDlWeWZhS2syMEU5cXN3RFBSNFYrYkxyUm5sMEhtWjZsMDNZSGliRC96b1Ez?=
 =?utf-8?B?NUxaemtPc3JnajhiT1ByRFFUWS9FLzl5UVFtMXJheVViUVFOckloQ01ONW1Y?=
 =?utf-8?B?YlkvaU10U1VCMzdNbTJJYmpGTXZQWmhiNEFsTEIvVVhpU0l5ejBBaVhSVll6?=
 =?utf-8?B?UEtBbmF2a05aMmp0Mkp6NUd0WHVuaDNtNS9mbVlSZjEwbFlWVk9yRHB6WjU3?=
 =?utf-8?B?eHJhWmtTK3BQMmJaSXhodGtVaDNUTEVZZjJ5dy9iUDlRM1BaQnF2Ny81L1NK?=
 =?utf-8?B?b3pWZVlnTGZyZ1A1blVoaDl1YkdaczR2ckVlYlU0SGRZb0pXWXl4MHVjeTVX?=
 =?utf-8?B?QmVlS3d6WFFPQUM1WXZoZkNoRU90bmZTcEYwblNlejlITERDRjMyNEtyZklO?=
 =?utf-8?B?Q3M0MkRoeThxSDlZNTYzOGpyOWthQVlTT3FJWTZXSGdqYlFxdzdlalJOYjRq?=
 =?utf-8?B?eUM0dW00T0pWZW1abkYrMWtHUUVpZTNZVjEyaE04L0ZlWFg1MG1xQ2J1SmRm?=
 =?utf-8?B?NGtlcU9jS0crQWM3Unl1Q3p3L3NvQVFwVUtsOHpLczRweU9jb2tTdDlaaVM2?=
 =?utf-8?B?MXlTWXFTaHFIMk5xVjlqL1NKL0l6OEtYU2Q3ZnY4MGhOM0xPeUNlRjNuOER2?=
 =?utf-8?B?WXNFbVc2emp2Rm1hRDhBWDZBZUEzUnUrYmN5alZQUHpreERIUE1WSjBZcU1m?=
 =?utf-8?B?WGRVajQ4dk9KeDFld0V3aG9oek9NZ1UvaEdFeDlrOGpSVjVBL0MvcTIvd1E3?=
 =?utf-8?B?Z0JLdGs4eFNMNUtJOTFmTXhpeVhFQzIyNGppS1hTaXZjT2tQL2J3dHJpcWIx?=
 =?utf-8?B?OFd6YXRwdW9URkVUVklKQmRONVFOR3VqRXVFWnFLWnZoa2dJQW1rZjFrWEpX?=
 =?utf-8?B?WkNhd0NMWXY0SDMyY05UbExMTFhEeSs5YlhGa1M4WnM1UXFwSEhiOFlMWC9F?=
 =?utf-8?Q?ekVCtuw17pO5SgfClCI8py4YpHrdtk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHBoaGlUSkhLcm05MVFyU2FkZlFtQm82cm02MCtZZkRZdFkvMHcvV0pOdEJk?=
 =?utf-8?B?ZEJJWEFvZXRXaVVLaVczRFhpK2lEMEhmWWtFdEpTSVlnSnVXTGZRRWwyZnlV?=
 =?utf-8?B?RG12cldRWWJDb21wdHpZYjF0cWdQS04ySGdNU1FOMWtMejhzY0JiU1JrSjBi?=
 =?utf-8?B?RUx2YWlKVDcxVlJ5REFBZWZkWGlxZlltNFJHUXdRME1YVnczY0paV2txZG5o?=
 =?utf-8?B?cEJlSWh1RU94dldKZGdjdDVXSnY1K0VCVm9zT1FvSUM1N0pQNFdRN25HUmxk?=
 =?utf-8?B?UmFNaklNTXFvVlRrMmh1VGo3QjBYdXRraDdwaFNUbU13R2NtUnUySDRQa0Ez?=
 =?utf-8?B?SUpnN2FhbjFQMVk1cFM0TE5TdHRHR1h4b2gvOU5Fd2Z6YS9OaGdYZ2x5L2lt?=
 =?utf-8?B?djlVK0lZYTk5dWdxQjg1SUZqYmJkS29LQktYQzRDeXRKY2ZPV2w2b2w4OFp5?=
 =?utf-8?B?RTJzbzlGdGk1YUZIU0F3MWVIbXBzcjREaEtjTnJoYVJqbW1aeHBuZGh6R1V2?=
 =?utf-8?B?RE81d0VnRE5BUjdqcXdMM1NDSTZOWG5ZTFV5OWNVeW85aVNPd2U3Q0p5YlFT?=
 =?utf-8?B?MVRYU2NpU1ZIb3h2ci91VVIyNE9HU0F4SzBCRWUvbGZ0WU92WWxsdGxQMURR?=
 =?utf-8?B?VHI3R09vM1A3N003RGRIWG14cVVJelRjcUplV3krTzBPbE9meHFZSVJHakpr?=
 =?utf-8?B?VkpaQ2g3T3NMUkFlbTdFSnNnaWFkbmw1ckxWcVpEdjh1d1UzenNRcUFTUGNH?=
 =?utf-8?B?VFE1bjhXVkx3ZVEwTVBYbXJUNjVnWUNaSnA0QVh6cTBmei8xRjloOXJEREdR?=
 =?utf-8?B?eC82MVJEdjYwNlhtSHRmRE9Oam14N1pHOExQTHQ3K3hJWE1ENWoxMkNteUxJ?=
 =?utf-8?B?UUU1aitKczhuUWc5cElBU0NaY1hyTmQxMXgrcGduMGh1RCtVZitnY2t0OGxE?=
 =?utf-8?B?ZjliVTgySzBHdkpnVUhUb21HZUVOdWRHWXNyNDB2Rjk0M2JQK1V2UUJCSDRT?=
 =?utf-8?B?STJBTGwvckNwY3ZYOVBCSVRCMk5mdWdEQVVuWjBNSktIMzdSNFhIUm9BVFF2?=
 =?utf-8?B?NFIrclh3d2VQbksyM21QTEFnUXJXc1NMR2RUdFA5Y2RSUnVoWmorYTM2U0lq?=
 =?utf-8?B?Q0oxTW5QN0JuWHBwK3MxeTYxRkhMNUI5ZmkzRFNPSTFZei8vdk5DeFRFWDdU?=
 =?utf-8?B?SU9GWnpJekd3S0xYVXhMaHNCRkgzZjJLQ3JFTXU0eVpLZTJKUVMvOHlWVVN2?=
 =?utf-8?B?VE5EOEpYMXdKdkkxZDBuZ1I5Z2pKMnYvNjArSXFqZjhWdGM4Y2Q1VDNlRitu?=
 =?utf-8?B?ZGNheTBaQmJiQnNuM0RUSjMyV2JpcFlJUWszWkluWG54aW5oOGNpTm95MERC?=
 =?utf-8?B?cTlUTFB6aHlFaEtFL09uenNBVnN2bCtBaGM2cStTQzVhTVVRT1hEMmx4dGhv?=
 =?utf-8?B?dTkvYXNCb0IreXpEbm5rdWR2QWphSklzaDJ0aWc1ZXBqOVl5S3ZMWlI5NkZi?=
 =?utf-8?B?YzdjK200a2MvRnBZVDRnOXNUNTlkeGdQTEMrNTdZMm96MTMyOFNiTmdtK3lH?=
 =?utf-8?B?SjJEVE5rT0MrQ2NwTE5Sd2FMS2ZoQ2R0NmttUm1LR21ETitXK0tzYmZ0T0Jp?=
 =?utf-8?B?eklIQWFiQnduZzJiMWd1bGN2by9IaFExOVRhdEg5MTEwZWN3VlFxMXdQUjFP?=
 =?utf-8?B?RUc1VGxscklXYXl1Z01pRjEyV0xaWUdPd203S25xYkYwdTJCcWp5clBoYzlQ?=
 =?utf-8?B?RlZHRTMzT3NublRsQ1Rrb3ZybkZ0blcyR3pvSlNQb2NBMllUcFdFbEswVkF1?=
 =?utf-8?B?V3p2bHBIbytuWjRQQlMwQkZwWmlBMnRmcVJmNExRMlhGckNDcjhGdWV6QmdG?=
 =?utf-8?B?NFpnczkvL0s3Yjc5VWFmTTg2UlRHbU5QU0JqaTQrZ2ExeUtQTkE4a2JQRDVQ?=
 =?utf-8?B?UXVHRHFYSEdEdlhaNTJXak9xemdiQk5XREV6TzJFQXpueUF0SDJpeVpIU3Yr?=
 =?utf-8?B?enNCd1I1TFpjK2xNbGZnb0dQb2lmUXhSMVd6UDNsTjFJM21weEZOTVRSeEtT?=
 =?utf-8?B?TnpIbC9udTJFTXlSWUNDcTVJSVk3blFmQjJYOFpmVVVjUW1EM3ZzbG9wVVRj?=
 =?utf-8?B?WTBmTnd6eXc1aVY4eWplN2d3N1kzWDNhV1VzNDR5R3loYitRczRSVDRCYzBv?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD306D62ACB18D459516E11A2DD6E808@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119ebdf4-e871-45b4-5fc8-08dddf2e514f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 14:40:18.1697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rl0Q75jVyTatgCPPXDvL/YMOiYA8VwSI3voVmEn9gxMUCFMAPTR/LS9x/+JUtBeHywpBjGBUftCwFbjH48kbDqc96W0tiBDJKKlV0hVzass=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

T24gU3VuLCAyMDI1LTA4LTE3IGF0IDEyOjM2IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA3OjU0OjI4UE0gKzAwMDAsIHN0dWFydHN1bW1lcnMg
d3JvdGU6DQo+ID4gVGhlcmUgYXJlIHR3byByZWdpc3RlcnMgZmlsbGVkIGluIHdoZW4gcmVhZGlu
ZyBkYXRhIGZyb20NCj4gPiBwY29kZSBiZXNpZGVzIHRoZSBtYWlsYm94IGl0c2VsZi4gQ3VycmVu
dGx5LCB3ZSBhbGxvdyBhIE5VTEwNCj4gPiB2YWx1ZSBmb3IgdGhlIHNlY29uZCBvZiB0aGVzZSB0
d28gKGRhdGExKSBhbmQgYXNzdW1lIHRoZSBmaXJzdA0KPiA+IGlzIGRlZmluZWQuIEhvd2V2ZXIs
IG1hbnkgb2YgdGhlIHJvdXRpbmVzIHRoYXQgYXJlIGNhbGxpbmcNCj4gPiB0aGlzIGZ1bmN0aW9u
IGFzc3VtZSB0aGF0IHBjb2RlIHdpbGwgaWdub3JlIHRoZSB2YWx1ZSBiZWluZw0KPiA+IHBhc3Nl
ZCBpbiBhbmQgc28gbGVhdmUgdGhhdCBmaXJzdCB2YWx1ZSAoZGF0YTApIGRlZmluZWQgYnV0DQo+
ID4gdW5pbml0aWFsaXplZC4gVG8gYmUgc2FmZSwgbWFrZSBzdXJlIHRoaXMgdmFsdWUgaXMgYWx3
YXlzDQo+ID4gaW5pdGlhbGl6ZWQgdG8gc29tZXRoaW5nICgwIGdlbmVyYWxseSkgaW4gdGhlIGV2
ZW50IHBjb2RlDQo+ID4gYmVoYXZpb3IgY2hhbmdlcyBhbmQgc3RhcnRzIHVzaW5nIHRoaXMgdmFs
dWUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogc3R1YXJ0c3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPg0KPiANCj4gSSB3YXMgYWJvdXQgdG8gbWVyZ2UgdGhpcywgYnV0IEkgbm90
aWNlZCB5b3VyIG5hbWUgc2VlbXMgb2RkLg0KPiANCj4gKGluIGJvdGggYXV0aG9yIGFuZCBzaWdu
ZWQtb2ZmKQ0KPiANCj4gSSBtZWFuLCBJIGNvdWxkIGdvIGFoZWFkIHdpdGggdGhpcywgYnV0IGl0
IGlzIG5vdCBsaWtlIHRoZQ0KPiBvbmVzIHlvdSB1c2VkIGluIHRoZSBwYXN0Og0KPiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tDQo+IA0KPiBzbyBJJ20gd29uZGVyaW5n
IGl0IGlzIGEgbWlzc2NvbmZpZ3VyYXRpb24gd2l0aCB5b3VyIGdpdA0KPiBhbmQgeW91IG1pZ2h0
IHdhbnQgdG8gY2hhbmdlLi4uIHNvLCBqdXN0IGxldCBtZSBrbm93IGlmIEkgc2hvdWxkDQo+IGp1
c3QgbW92ZSB3aXRoIHRoaXMgYXMgaXMuLg0KDQpIaSBSb2RyaWdvLCB0aGFua3MgZm9yIHBvaW50
aW5nIHRoaXMgb3V0LiBJdCBsb29rcyBsaWtlIG15IGxvY2FsIGdpdA0Kd2FzIGluIGZhY3QgbWlz
Y29uZmlndXJlZCBzb21laG93IDooLiBMZXQgbWUgY2xlYW4gdGhpcyB1cCBhbmQgcmVwb3N0DQpi
ZWZvcmUgd2UgbWVyZ2UgdGhpcy4gTG9va3MgbGlrZSB0aGlzIGlzIGFsc28gaW1wYWN0aW5nIHRo
ZSBvdGhlcg0Kc2VyaWVzIEkgaGF2ZSBvdXQuIEknbGwgcmVwb3N0IHRoZXJlIGFzIHdlbGwuDQoN
ClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQg
PGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlX3N5c2ZzLmMgfCA4ICsrKystLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfaHdtb24uY8KgwqDCoMKgwqDCoMKgIHwgOCArKysrLS0tLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZyYW1fZnJlcS5jwqDCoMKgIHwgNCArKy0tDQo+ID4gwqAzIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+IGluZGV4IGJkOTAxNTc2MWFh
MC4uNmVlNDIyNTk0YjU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2Vfc3lzZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lz
ZnMuYw0KPiA+IEBAIC03Niw3ICs3Niw3IEBAIGxiX2Zhbl9jb250cm9sX3ZlcnNpb25fc2hvdyhz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGMN
Cj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBwZGV2
X3RvX3hlX2RldmljZSh0b19wY2lfZGV2KGRldikpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfdGlsZSAqcm9vdCA9IHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKTsNCj4gPiAtwqDC
oMKgwqDCoMKgwqB1MzIgY2FwLCB2ZXJfbG93ID0gRkFOX1RBQkxFLCB2ZXJfaGlnaCA9IEZBTl9U
QUJMRTsNCj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgY2FwID0gMCwgdmVyX2xvdyA9IEZBTl9UQUJM
RSwgdmVyX2hpZ2ggPSBGQU5fVEFCTEU7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHUxNiBtYWpvciA9
IDAsIG1pbm9yID0gMCwgaG90Zml4ID0gMCwgYnVpbGQgPSAwOw0KPiA+IMKgwqDCoMKgwqDCoMKg
wqBpbnQgcmV0Ow0KPiA+IMKgDQo+ID4gQEAgLTExNSw3ICsxMTUsNyBAQCBsYl92b2x0YWdlX3Jl
Z3VsYXRvcl92ZXJzaW9uX3Nob3coc3RydWN0IGRldmljZQ0KPiA+ICpkZXYsIHN0cnVjdCBkZXZp
Y2VfYXR0cmlidXRlICphDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID0gcGRldl90b194ZV9kZXZpY2UodG9fcGNpX2RldihkZXYpKTsNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKnJvb3QgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGls
ZSh4ZSk7DQo+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIGNhcCwgdmVyX2xvdyA9IFZSX0NPTkZJRywg
dmVyX2hpZ2ggPSBWUl9DT05GSUc7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGNhcCA9IDAsIHZl
cl9sb3cgPSBWUl9DT05GSUcsIHZlcl9oaWdoID0gVlJfQ09ORklHOw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqB1MTYgbWFqb3IgPSAwLCBtaW5vciA9IDAsIGhvdGZpeCA9IDAsIGJ1aWxkID0gMDsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsNCj4gPiDCoA0KPiA+IEBAIC0xNTMsNyArMTUzLDcg
QEAgc3RhdGljIGludCBsYXRlX2JpbmRfY3JlYXRlX2ZpbGVzKHN0cnVjdCBkZXZpY2UNCj4gPiAq
ZGV2KQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9
IHBkZXZfdG9feGVfZGV2aWNlKHRvX3BjaV9kZXYoZGV2KSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCB4ZV90aWxlICpyb290ID0geGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUpOw0KPiA+
IC3CoMKgwqDCoMKgwqDCoHUzMiBjYXA7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGNhcCA9IDA7
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDC
oMKgeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPiA+IEBAIC0xODYsNyArMTg2LDcgQEAgc3RhdGlj
IHZvaWQgbGF0ZV9iaW5kX3JlbW92ZV9maWxlcyhzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4g
PiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBwZGV2X3Rv
X3hlX2RldmljZSh0b19wY2lfZGV2KGRldikpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfdGlsZSAqcm9vdCA9IHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKTsNCj4gPiAtwqDCoMKg
wqDCoMKgwqB1MzIgY2FwOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBjYXAgPSAwOw0KPiA+IMKg
wqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX3Bt
X3J1bnRpbWVfZ2V0KHhlKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3bW9uLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jDQo+ID4gaW5kZXgg
YzE3ZWQxYWU4NjQ5Li4zMmE3NmFlNmU5ZGMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3bW9uLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdtb24u
Yw0KPiA+IEBAIC0xNzksNyArMTc5LDcgQEAgc3RhdGljIGludCB4ZV9od21vbl9wY29kZV9ybXdf
cG93ZXJfbGltaXQoY29uc3QNCj4gPiBzdHJ1Y3QgeGVfaHdtb24gKmh3bW9uLCB1MzIgYXR0cg0K
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIGNsciwgdTMyIHNldCkNCj4gPiDCoHsN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKnJvb3RfdGlsZSA9IHhlX2Rldmlj
ZV9nZXRfcm9vdF90aWxlKGh3bW9uLQ0KPiA+ID54ZSk7DQo+ID4gLcKgwqDCoMKgwqDCoMKgdTMy
IHZhbDAsIHZhbDE7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHZhbDAgPSAwLCB2YWwxID0gMDsN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldCA9IDA7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKg
wqDCoMKgcmV0ID0geGVfcGNvZGVfcmVhZChyb290X3RpbGUsDQo+ID4gUENPREVfTUJPWChQQ09E
RV9QT1dFUl9TRVRVUCwNCj4gPiBAQCAtNzM0LDcgKzczNCw3IEBAIHN0YXRpYyBpbnQgeGVfaHdt
b25fcG93ZXJfY3Vycl9jcml0X3JlYWQoc3RydWN0DQo+ID4geGVfaHdtb24gKmh3bW9uLCBpbnQg
Y2hhbm5lbCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb25nICp2YWx1ZSwgdTMyDQo+
ID4gc2NhbGVfZmFjdG9yKQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0K
PiA+IC3CoMKgwqDCoMKgwqDCoHUzMiB1dmFsOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiB1dmFs
ID0gMDsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZod21vbi0+aHdt
b25fbG9jayk7DQo+ID4gwqANCj4gPiBAQCAtOTE4LDcgKzkxOCw3IEBAIHhlX2h3bW9uX3Bvd2Vy
X3dyaXRlKHN0cnVjdCB4ZV9od21vbiAqaHdtb24sDQo+ID4gdTMyIGF0dHIsIGludCBjaGFubmVs
LCBsb25nIHZhbCkNCj4gPiDCoHN0YXRpYyB1bW9kZV90DQo+ID4gwqB4ZV9od21vbl9jdXJyX2lz
X3Zpc2libGUoY29uc3Qgc3RydWN0IHhlX2h3bW9uICpod21vbiwgdTMyIGF0dHIsDQo+ID4gaW50
IGNoYW5uZWwpDQo+ID4gwqB7DQo+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIHV2YWw7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgdTMyIHV2YWwgPSAwOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC8q
IGh3bW9uIHN5c2ZzIGF0dHJpYnV0ZSBvZiBjdXJyZW50IGF2YWlsYWJsZSBvbmx5IGZvcg0KPiA+
IHBhY2thZ2UgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGNoYW5uZWwgIT0gQ0hBTk5FTF9Q
S0cpDQo+ID4gQEAgLTEwMjAsNyArMTAyMCw3IEBAIHhlX2h3bW9uX2VuZXJneV9yZWFkKHN0cnVj
dCB4ZV9od21vbiAqaHdtb24sDQo+ID4gdTMyIGF0dHIsIGludCBjaGFubmVsLCBsb25nICp2YWwp
DQo+ID4gwqBzdGF0aWMgdW1vZGVfdA0KPiA+IMKgeGVfaHdtb25fZmFuX2lzX3Zpc2libGUoc3Ry
dWN0IHhlX2h3bW9uICpod21vbiwgdTMyIGF0dHIsIGludA0KPiA+IGNoYW5uZWwpDQo+ID4gwqB7
DQo+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIHV2YWw7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHV2
YWwgPSAwOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghaHdtb24tPnhlLT5pbmZv
Lmhhc19mYW5fY29udHJvbCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAwOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbV9mcmVx
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFtX2ZyZXEuYw0KPiA+IGluZGV4IGIy
NmUyNmQ3M2RhZS4uMTdiYzg0ZGE0Y2RjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92cmFtX2ZyZXEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFt
X2ZyZXEuYw0KPiA+IEBAIC0zNCw3ICszNCw3IEBAIHN0YXRpYyBzc2l6ZV90IG1heF9mcmVxX3No
b3coc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRy
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNoYXIgKmJ1ZikNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X3RpbGUgKnRpbGUgPSBkZXZfdG9fdGlsZShkZXYpOw0KPiA+IC3CoMKgwqDCoMKgwqDCoHUzMiB2
YWwsIG1ib3g7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHZhbCA9IDAsIG1ib3g7DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoGludCBlcnI7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgbWJveCA9
IFJFR19GSUVMRF9QUkVQKFBDT0RFX01CX0NPTU1BTkQsDQo+ID4gUENPREVfRlJFUVVFTkNZX0NP
TkZJRykNCj4gPiBAQCAtNTYsNyArNTYsNyBAQCBzdGF0aWMgc3NpemVfdCBtaW5fZnJlcV9zaG93
KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjaGFyICpidWYpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90
aWxlICp0aWxlID0gZGV2X3RvX3RpbGUoZGV2KTsNCj4gPiAtwqDCoMKgwqDCoMKgwqB1MzIgdmFs
LCBtYm94Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiB2YWwgPSAwLCBtYm94Ow0KPiA+IMKgwqDC
oMKgwqDCoMKgwqBpbnQgZXJyOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoG1ib3ggPSBS
RUdfRklFTERfUFJFUChQQ09ERV9NQl9DT01NQU5ELA0KPiA+IFBDT0RFX0ZSRVFVRU5DWV9DT05G
SUcpDQo+ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
