Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB2BC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3810E0E7;
	Fri, 10 May 2024 18:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3hdxIXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081710E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715367520; x=1746903520;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=m0t5qc80emmM38mfER8BuknY5BMxGFvYuSNbMtBXRzw=;
 b=i3hdxIXAEzUCFniudrdyNZMyDtbqVrFWBjQCOp/pNTMAaB+bnHOIAIe9
 Cms2JLgBvPYNzqISOCxMfF/NiyNpEMXDhDqnLaomtKJklcTmiKzVxZjyJ
 Pem51e25CFCWkj5h54XiloNnFwur1sLIl5DBzHGch/ObP+CvoBSKzSazW
 5sNJSWgWahzOdbpLl/+9U0MAUDB/IdsMjtSS0WQaFvTrbhyMKIUq4hY3x
 jwXPr7NxCnIGf0X+giZBXjpGGPmqbFL+O+Jr1n7SAA+9mss4wXFUTYREA
 EuFw94cGJJidPN7uAN1r/t7WSjP8Y74gd02ezfvjdmvoHAdmtjQi5Z+/L Q==;
X-CSE-ConnectionGUID: xKczYCPKSM+F4Ma/XwDMRA==
X-CSE-MsgGUID: 8L/izVX9Qzu/ebVFFLuNLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11491993"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11491993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:58:39 -0700
X-CSE-ConnectionGUID: EaEm1RApROG2vD/Tr38XvA==
X-CSE-MsgGUID: liItONdWQHOWluTzxl4suA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29650782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 11:58:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 11:58:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 11:58:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 11:58:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 11:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgP2ayvL0prq0UEDOktIp52CwTpKr0RXjSdvPlyLPlQA0nyEOIIeD8NbCTUxymTylJyp0cvjc+uCzbO1TfeErYI2SE8hMrITRNmS85MGDGtzQir1rR8pkq34emg3z0SC2kO4uNC6LWrIECcMsPyg7Kq2RDpygkBpgG9EZpmG/JBuwUwNKnCeypa3ioS81sYDuGEgh7/qGbhZsbfsOao94epS0erWFwT0XvFQzwPopcpRP/nFklEFCG9UoDM22ZEX0Yfi+KDoE3simOCU4q5YvhoKCrWrtlgB86GJ5ShcK0qXFr4HOUC5ZAvD4HQqMxEJw/dUSTgwEcz1TmRuTo2Wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0t5qc80emmM38mfER8BuknY5BMxGFvYuSNbMtBXRzw=;
 b=U9QvTZg+YirKbIsLLlc8WonYla/NGZc3Rn+or8ysDFTrM/s5jLiYBmjIBAXB3/qpAYidA85kS/eMHKZMwtPW7dDXTr5Bix9ZSSo8sEWYEnwJLhFrYchjAmpIlbHpTQ3NzhwSPS448rWxo37H/AHJommMC7xYwAQQvzJDoKCBhn2shtP+jSW4e/OejVzB+gI7HfokvY1aMI7WACL4rnAechgYrxwgslhND4gAeGB5NBod+16dda0f8SsL4IcH2LbZKo1dKCJ7yJInR/uERf5YeKDa5m2uhyPQ6kEDv2C8zFlu4pyAr3ENMK4J+uOokDMjetdzr/Z2dtRYQOlX8rHiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 18:58:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 18:58:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/6] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v8 1/6] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHaoCC0kY+SyEwMI0WUfQsIDa7Ru7GQ19qA
Date: Fri, 10 May 2024 18:58:35 +0000
Message-ID: <90f6ce7f997a7e9ff95f22a44b74ab6cef00c187.camel@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-2-zhanjun.dong@intel.com>
In-Reply-To: <20240507014736.1057093-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB6520:EE_
x-ms-office365-filtering-correlation-id: 3256c2f7-e4a0-4756-022f-08dc712331f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YWZjaE4vanJuMjJlTjFiWUF1czUwU01oVDFRYTNvMk9paE9Ed3BJNjJ6MjA4?=
 =?utf-8?B?REFNcTZnY0ZKWGVlT1VKczhSYUNpcGgxTHNlTm85TThsTFBoSVBXU0RKSVln?=
 =?utf-8?B?MDk3VkJJb1NNUHFOYzFvRXQzWm5hRUJOZm1mcEpKL0lhMjZONjI1Y00xQm8v?=
 =?utf-8?B?ZGZtRy9PbGJzNzJ1VE0vQzRZY1oyU2tFUGVCRlRJREd2ZTZSOFhCYVNHSHJC?=
 =?utf-8?B?WkNOdzBzdk9LWW01a3plcUx1bUpmT0RuYytiSGgzV2RKVWtuc0N1eS9qdyt5?=
 =?utf-8?B?YkRwZXVxV1RkTm9yeGNLcklHMDBpQnZnN1ZFYm1VOSszNG5ZWVF3S3dYTDQ4?=
 =?utf-8?B?elJyenlZeWVXaldNNkdhQXQrNHRjdFo4ODE1b0R5TGp0Qmk2ZmFTYlR0elpQ?=
 =?utf-8?B?SGhTSkQyRkhMK0s5Qm5hZWQ1THFkTEw0aThjL05Xd3VhQWhLczVZcUNHckFq?=
 =?utf-8?B?Ym0zY0I0Q0lHSjcrSUhwVEQ2dno0LzlLZWVXZVBpR2lQc2IycVVMMmhIYjE1?=
 =?utf-8?B?d3BjVGNnR0VhVWxzYk44SFVmVnVvbmgwN3F4U3l6T3hOZGhMSnAxak5LVlYr?=
 =?utf-8?B?eUtLVW9BSGkwdDFQUFBMOTB2TmJ2OGVDRFhvNzVXUWJ3SmdIUWhrZng4amtV?=
 =?utf-8?B?TnA1cS9JaCtKdHAvcDM3T015ZndlVWVYNkxPckYxRHRudVBubDNsUk9TMHhF?=
 =?utf-8?B?ekloeUVLNjZHQytVaFR2SXFJeXNlb1VxTmNLNjB4SFFjZlBML3Nqby9CaWdO?=
 =?utf-8?B?azB5eUhRU1ZweVpoek5IcVdyQUF5QzBPQW0rREI3VjVYZDlPbWJ3S09tRXln?=
 =?utf-8?B?enhGZmszNnhkMktaS1lBempRRUJ4Z3YyaFQweHd0NktCZ1Y5aUZYQlBiV0JX?=
 =?utf-8?B?RnpFT3VwZ2RWeEtxZllqdFF1UWJOeDcvVHFDeUpLMEJvajlyd05HZS84ODlk?=
 =?utf-8?B?MzdNTFExWHhEeHlESFMwVG5UakNmL3AxRDRBYVZtWGtBUGpnWXVvRkNxRXMv?=
 =?utf-8?B?RU1yR3BEWVNrSldQYVdzcFM2K2l1azFKeFVST1JmNHIrSC9kTlpRank1YWRz?=
 =?utf-8?B?YzlnQmNzdzFmK1JYTE5QK0tCcXdUdHFsa1NnZkthZ1h5QjZMT3diNGk1dnho?=
 =?utf-8?B?M0NJMUt5SjJIa1ZvWVhyY1BJQ3RKb09nNEZJWTRFYjFpT1VHZjJpWmFYdHBB?=
 =?utf-8?B?KzFUZ0pFUlRmV253V09ka2dRcHQzYmVCeXh6VmJ1U29iOEJJTy9GbG1xTWly?=
 =?utf-8?B?Mm5saDhqb2U2OEFYeVNCRkI1NDRxSkZvTjE3bzBiMTRUTHl5TktvRkdBMlpl?=
 =?utf-8?B?eDlQRTZCaDJaQnBhbERsL09xRUZpd0Y3UzczR2lKbVJFWHZMMVQ4L29ieVNE?=
 =?utf-8?B?ZldLT2kwUE9hK1BBajVwcGs2RFRpcXlldjc5VXByT2FpNTVJZW9xSUFDbk0v?=
 =?utf-8?B?eTNsYjFPS0ZWTHA2bnRpYURwZ2VIN1JKNk1vU20yMlNySVhrOTdOem1sQ3Zr?=
 =?utf-8?B?VWNSZjJKQmlGNUFsTWQ3Slp5eU9wK0luK0ExVXNrblJLQ3ZJTDdxNXpjM1JP?=
 =?utf-8?B?OXZRd3NwN2tLa0JWMEJhTG1VakxKa3piRDRiZFlsakFNdHRJeWttZ2lPc1l6?=
 =?utf-8?B?THdOQlZENFVmTmVZaTlqVGNmRDY3WXdlRXZCSURKc3p3NzgrSFpiNzJvR3Bo?=
 =?utf-8?B?bWpta210RnQvc1VURnhIenpjV1dXK3lGSUNLczFYT1FOdlByQWt5RDc0M256?=
 =?utf-8?B?T0ZhQkpIZXFZNVo1bllQUVdxRjliT3htTjM0cmsydFZzYVlKZmtxTHR5QW9F?=
 =?utf-8?B?L0YxV2dNWHNnYWFZYlkyUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2hrcU9vMUFiWTdXaUFRTmcxWXJPQzdGcWJuRHJxM2l0eXpQbEdoNTBSa2Nw?=
 =?utf-8?B?UGZqNlVtTHlXY1NzRFZqVmwxSkVpbm1EL1RoMTg4T095MjYwZ0YxOWpReHZq?=
 =?utf-8?B?cC9JVktnQWdDT2dBTDNQU0xVMVMxZWo3a2M0VEFYR1lrRmVZTGxTOWlOS2Fs?=
 =?utf-8?B?aW41STFrV0dydTU0akdLekpUSnJyWS85K1VSL1NHRjc4b1ZUODBqeDZsWS9z?=
 =?utf-8?B?eFl4UmtsMkpoSEhRZ1VJNVIxMFgzV2hYbW1lNG5kOGhuOGdaZFhBYWNxdGU3?=
 =?utf-8?B?cnQyNDUvS1grYUZBbXdhNXhiYnh1Y0tNMG9WL0tEMDVVcFVhQlMxaUc3c2Zs?=
 =?utf-8?B?V2lKbWUyQzRUWjNJVVo5T25OOGptOGluRmp4TDFpOEpzL01IOFZ4OVFob0V1?=
 =?utf-8?B?OXI3d2ljV1ZCbHdDM0RiV1YvWnVTa2dmOTk5M3g2eGN1KzNBTmpuYTZVUSto?=
 =?utf-8?B?VEhYVkZFbFhSZTJGc21NbHFCSWQ2TjlxOUZwV0VpeC8yVXBaTG5HN1c3R3Uy?=
 =?utf-8?B?K0xHZ0swbGFTY1crR1pBSUNKaERLWUpPa0IzOFIvSFIzeDh3aUY0dGIzWUdL?=
 =?utf-8?B?RkI1Nkh3aVowZHhWS2toSWYrbVdTUDJZeEt0Y1IrWXpTaGJFbHNlM20rejlN?=
 =?utf-8?B?bnViZWNRUVlMT3QvSWVHUGUyaitya2ZpaDB0d0ZIRk5kMjBJcXlOMk5wbGJs?=
 =?utf-8?B?TmtCRFJXUmVQQlJYNklEWEVNbEZjWWJ4WFU4ZS90VHZ2Nk1mK2pqQUdxR2JO?=
 =?utf-8?B?eXkycjVlWTVLbzBqb2wxcjM2OTllYjNmQVRLNzhmQ2ZCTUlZeTVLdkxRSWdJ?=
 =?utf-8?B?Slk1NmtmTGFZQTRDVlc3MTFwMnU4bThlaEk3VWttaGhTVWRPT0c4WmNsVGNZ?=
 =?utf-8?B?SFVKRWVKbG4yT2pibVQvOFRSNVRVOGFOeURnaW53ekR2WXhjM1NSRks2a3ha?=
 =?utf-8?B?cElzbVYxQUNuZkIrUmNid21YUEl4ajMrRkVjY0dtakc1Tlo3ZFEycjFKekZG?=
 =?utf-8?B?R1E2Z25QbWVIeVRrbWp3YzBvdXRScHZzWFFDaEJlbzJHcWt3Zy9BSzBRcEYw?=
 =?utf-8?B?NmtHY3JocXMxdStaaGZxMXl0eEFJY29oUTZuM0xHZDdjcDhRZ2QxNmh3NkQ5?=
 =?utf-8?B?bmdBMmFZTjJNdGtPZitVUlZFM254aGR3WHR0TFFYb3ozM2hrSEQvTkVrYk9S?=
 =?utf-8?B?Umo2NHd2M21pY2w5RnNZak56UTI5b1VVTElYZ1g0bUk4ZG5Rc2dkTTY0K2hH?=
 =?utf-8?B?aHJKNEFQL29Vc3ArejdnbWQwRC9CWUI1SW94RWhvOThoUExVL3lNVUtZL09J?=
 =?utf-8?B?cXpYeElUbWRtSUtYYkJRaG9IZFRUZHd0aVpWY1Q1WVZmZWo4SFhJQjFrMkxB?=
 =?utf-8?B?cTZQZ2wrU0ZlSW9VaXh0TzdxWXl0MGt0Uy96cjd1VkhtUkk0S3doRGNLT3pu?=
 =?utf-8?B?WkZaemk2UEd1WWgvdDZPNk9TRllaejRQb3NPTEtsNG4rWWJ4UVgwUmpUZzB5?=
 =?utf-8?B?QmFTbi95UVNQOUFwVWNOaC9RSVFQSHhNaUVESGRpb0ZyeDVXRC8rVTd1NjZO?=
 =?utf-8?B?S2xrWTM3R3lZdmFPRzhST0E1QmRnempDVmtTNU4vV2c1VWhscXBqK2ttTWdj?=
 =?utf-8?B?WWxsb2ZRTEEwUU51OGJOTmdqZmE2Qi9ManNOUFpDR1VxUUdhN3J5SEZ2M3JY?=
 =?utf-8?B?bTYrYW9FaDBvdFRYY2FtQzN6d2JSZUxJc1I1VHhHWE44d25xNGk5UW1HTVor?=
 =?utf-8?B?RDBhdTlZWWZybmtIUm5vT0lWdk9BVGlxTlpyVnRPSSs0QUJzWU5idUlpNEQr?=
 =?utf-8?B?ZzA5akVRVGVFN0NzVmdrRXRlNXdlVjZyTWwyQjM3eTduNU5nVDZSQnhBQ0xM?=
 =?utf-8?B?RXB4SUZYWUVGUTFmeWwvdHhzaldLOHNtNW5KQWN2SFFhbW9jZkFhWkk5OSs1?=
 =?utf-8?B?SlV3RWs2ZUpzQjRUS0Ryejh1c3ZSN2V5UlBSVTYydE1JSkcwWXNiYVFUYXd5?=
 =?utf-8?B?TlBYYnk1cms4eHVTMHd0OFNWR01sZFNrYXREdWdoZFpuVDZkQVVGYjVXRkdQ?=
 =?utf-8?B?cTRFRlh6TzYxN29EekJaVXNGRkVEc3hLcEtSVnJtczlvNU5mTGJIbkxodnhl?=
 =?utf-8?B?NVlHTGllc09ieVAyeEJud0hsK2dOWk42SDgzbDdhZ3dsT1J2cVM1SWhpRmor?=
 =?utf-8?Q?2nAnnq7yWFPyNGwsmUSOjgk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8E05CECCD2CE04EB158B532804916CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3256c2f7-e4a0-4756-022f-08dc712331f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 18:58:35.5943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: friM5ngBhXo8f5ygYmMlKz5JMGCNGYS6x5Y+gC1vKPVXKIC+IPZy8FkEnCE929D4l2mjiS39q0pCfdIZbavADyVUV9DI8SzCx42AqkOXuppMi6gi4ePdTPfE81sgPvhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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

T24gTW9uLCAyMDI0LTA1LTA2IGF0IDE4OjQ3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQoN
CmFsYW46c25pcCAobWlzc2VkIGEgZmV3IG1vcmUgc21hbGxlciBvbmVzKQ0KDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19hZHMuYw0KPiBpbmRleCA2YTVlYjIxNzQ4YjEuLjNkNDU2M2QzY2E0ZiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+IEBAIC0xNyw2ICsxNyw4IEBADQo+IMKgI2luY2x1
ZGUgInhlX2d0LmgiDQo+IMKgI2luY2x1ZGUgInhlX2d0X2Njc19tb2RlLmgiDQo+IMKgI2luY2x1
ZGUgInhlX2d1Yy5oIg0KPiArI2luY2x1ZGUgInhlX2d1Y19jYXB0dXJlLmgiDQo+ICsjaW5jbHVk
ZSAieGVfZ3VjX2NhcHR1cmVfZndpZi5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9ndWNfY3QuaCINCj4g
wqAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+IMKgI2luY2x1ZGUgInhlX2xyYy5oIg0KPiBA
QCAtMTI2LDYgKzEyOCw4IEBAIHN0cnVjdCBfX2d1Y19hZHNfYmxvYiB7DQo+IMKgI2RlZmluZSBp
bmZvX21hcF9yZWFkKHhlXywgbWFwXywgZmllbGRfKSBcDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9t
YXBfcmRfZmllbGQoeGVfLCBtYXBfLCAwLCBzdHJ1Y3QgZ3VjX2d0X3N5c3RlbV9pbmZvLCBmaWVs
ZF8pDQo+IMKgDQo+ICtzdGF0aWMgaW50IGd1Y19jYXB0dXJlX3ByZXBfbGlzdHMoc3RydWN0IHhl
X2d1Y19hZHMgKmFkcyk7DQo+ICsNCmFsYW46bml0OyBvbmUgbW9yZSB0aGluZywgaXQgbG9va3Mg
bGlrZSB5b3UgZG9uJ3QgbmVlZCB0aGlzIHByb3RvdHlwZSBkZWZpbml0aW9uIGhlcmUgbm93IGFm
dGVyIHJldjg/DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2Fw
dHVyZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iMjFhOGVmODVjNGUNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYw0KPiBA
QCAtMCwwICsxLDM1MiBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiAr
LyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIxLTIwMjIgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAq
Lw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gKw0KPiArI2luY2x1ZGUgPGRy
bS9kcm1fbWFuYWdlZC5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gKw0KPiAr
I2luY2x1ZGUgImFiaS9ndWNfYWN0aW9uc19hYmkuaCINCj4gKyNpbmNsdWRlICJyZWdzL3hlX3Jl
Z3MuaCINCj4gKyNpbmNsdWRlICJyZWdzL3hlX2VuZ2luZV9yZWdzLmgiDQphbGFuOiBhbHBoYWJl
dGljYWwgb3JkZXIgKGkgYmVsaWV2ZSB0aGlzIGlzIG5vdCBhIG5pdCBmcm9tIG90aGVyIHJldmll
d3MgaXZlIHNlZW4pDQo+ICsjaW5jbHVkZSAicmVncy94ZV9ndF9yZWdzLmgiDQo+ICsjaW5jbHVk
ZSAicmVncy94ZV9ndWNfcmVncy5oIg0KPiArDQo+ICsjaW5jbHVkZSAieGVfYm8uaCINCj4gKyNp
bmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gKyNpbmNsdWRlICJ4ZV9leGVjX3F1ZXVlX3R5cGVzLmgi
DQo+ICsjaW5jbHVkZSAieGVfZ3QuaCINCj4gKyNpbmNsdWRlICJ4ZV9ndF9wcmludGsuaCINCj4g
KyNpbmNsdWRlICJ4ZV9ndWMuaCINCj4gKyNpbmNsdWRlICJ4ZV9ndWNfY2FwdHVyZS5oIg0KPiAr
I2luY2x1ZGUgInhlX2d1Y19jYXB0dXJlX2Z3aWYuaCINCj4gKyNpbmNsdWRlICJ4ZV9ndWNfY3Qu
aCINCj4gKyNpbmNsdWRlICJ4ZV9ndWNfbG9nLmgiDQo+ICsjaW5jbHVkZSAieGVfZ3RfbWNyLmgi
DQphbGFuOiBhbHBoYWJldGljYWwgb3JkZXINCj4gKyNpbmNsdWRlICJ4ZV9ndWNfc3VibWl0Lmgi
DQo+ICsjaW5jbHVkZSAieGVfaHdfZW5naW5lX3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfbWFj
cm9zLmgiDQo+ICsjaW5jbHVkZSAieGVfbWFwLmgiDQo+IA0KYWxhbjpzbmlwDQoNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZV9md2lmLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfZndpZi5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzliYzI3N2FmYWE4DQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlX2Z3aWYuaA0KPiBAQCAtMCww
ICsxLDE2OCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyoN
Cj4gKyAqIENvcHlyaWdodCDCqSAyMDIxLTIwMjIgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0K
PiArDQo+ICsjaWZuZGVmIF9YRV9HVUNfQ0FQVFVSRV9GV0lGX0gNCj4gKyNkZWZpbmUgX1hFX0dV
Q19DQVBUVVJFX0ZXSUZfSA0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gKyNp
bmNsdWRlICJyZWdzL3hlX3JlZ19kZWZzLmgiDQo+ICsjaW5jbHVkZSAieGVfZ3VjX2Z3aWYuaCIN
Cg0KKw0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKyNpbmNsdWRlICJyZWdzL3hlX3JlZ19k
ZWZzLmgiDQorI2luY2x1ZGUgInhlX2d1Y19md2lmLmgiDQphbGFuOiBhcyBwZXIgb3RoZXIgaGVh
ZGVyIGluY2x1c2lvbnMsIGkgYmVsaXZlIHRoZSBjb2Rpbmcgc3RhbmRhcmQgaXMgdG8gc2VwYXJh
dGUNCnRoZSBpbmNsdXNpb25zIGludG8gY2h1bmtzIChsaW5lIHNlcGFyYXRlZCkgYmFzZWQgb24g
Z3JvdXBzIHdoZXJlIGVhY2ggZ3JvdXAgaXMNCnRoZSB0b3AgbGV2ZWwgaGVhZGVyIGZvbGRlciBs
aWtlIHRoaXMgYXMgYSBmYWtlIGV4YW1wbGUuIGhvd2V2ZXIsIGkgY2FudCBmaW5kDQp0aGUgcnVs
ZSB3cml0dGVuIGRvd24gYW55d2hlcmUgc28gaSBhbSBsYWJlbGxpbmcgdGhpcyBhcyBhIG5pdCBm
b3Igbm93Og0KDQorI2luY2x1ZGUgPGxpbnV4L2ZvbzEuaD4NCisjaW5jbHVkZSA8bGludXgvZm9v
Mi5oPg0KKyNpbmNsdWRlIDxsaW51eC9mb28zLmg+DQoNCiNpbmNsdWRlIDxkcm0vZHJtX2ZvbzEu
aD4NCiNpbmNsdWRlIDxkcm0vZHJtX2ZvbzIuaD4NCg0KKyNpbmNsdWRlICJyZWdzL3hlX3JlZ19m
b28xLmgiDQorI2luY2x1ZGUgInhlX2ZvbzEuaCINCisjaW5jbHVkZSAieGVfZ3RfZm9vMS5oIg0K
KyNpbmNsdWRlICJ4ZV9ndWNfZm9vMS5oIg0KDQphbGFuOnNuaXANCg0KDQo=
