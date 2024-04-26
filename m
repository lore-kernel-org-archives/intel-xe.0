Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93EBC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 21:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A1B10F311;
	Fri, 26 Apr 2024 21:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+kXivO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91CC10F311
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714165463; x=1745701463;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PxNxFoebySuITVbv9h8P9LOetRunbaS4ivfHS/IKm9I=;
 b=i+kXivO+IqqFQdugD5c4GTotPA9zVzYPI7IbLxNNSjRFy6+L7nUkcmXx
 IjNzQr47pdixzCpd1GxOMbF6JmkYyi90K8xSihqopK0zHUfiDzvrEoLBO
 Q4Gaf5vtUwDDlgxQTn0CMfCm6cmGfc1WKtz8MHMpzIaiL0fNrpQjH1fI7
 HFITSXHyRE5kWyW8ldBFqoaH7V/IfUHsjx0R2rHIC7p0pnGjVQGum0ewG
 QKX7fhkkXLTdzwii3jubDmJdxVgmXsHC7FU+Xi8KZYCzeImTbMm+96sQx
 I4VlqL48h6ZA2IVEA+2HOud0ZqSeJX73kjCsuhcqcG3dGEA+ia9KpZd22 g==;
X-CSE-ConnectionGUID: sv/UJMnmQT6BbQ09nk2qpg==
X-CSE-MsgGUID: IOvwB9erQ7eHsUYr+hM6wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20600047"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="20600047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 14:04:22 -0700
X-CSE-ConnectionGUID: ZFsyTuNMTJO4Cmb549zKiw==
X-CSE-MsgGUID: o979hT7WT1KEm6+PYYk++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="26166978"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 14:04:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 14:04:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 14:04:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 14:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn0hYZ8yxjgpv0bHkHRUkEnPUhsxaVpCuvI/laLwgebtydQITP/bWZxKMI9+x3C24ISKt8zY8pcOQv+p5eqdpEOHGc738FiNr46oliEqclwmn/RQIjS9A/ixKQVWTFBv4WVEoXwafi5gCdQj0EMhE0N7Dg3UdTY39xOoa71P0YGAHe8cimxSCb5wVwP/S1j0PRVdIpueM0UNspdY41av44ekOR+wnBeNLgGsUIxnRP2ACXhkI5LZfAFfuyT8GltnFM4TPuZh5WK7KgerwXe2kj2z+7CNbVfMPt374gul8wL2fWejAnI8quFIzkPtiU8WH3VfXatJRbTMYW6MOkPIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxNxFoebySuITVbv9h8P9LOetRunbaS4ivfHS/IKm9I=;
 b=AYFYYNiLYnwCQLXh5yWd3HqAd8pgo6c2eXCIh4MGwpWgzLAiZtRDdL1XjFTIDE4ihByy/8dLjad/1k1ClXXXee8CqUaCd2mErwl2uCX9BPXkgP3gtNkBehNr4ifhEX76ejKj+5XL2QaU5OXArEdP32VBw9iqNjLqXoZ6AyS30qofexmioF+j32BkH0VLM0MR2fGkjUqDg4v7T3VXCigjeH4DCCnFoJGf8nHU62xs7k4DRc+t9aP2F7TetYZ45vshO82lXiULD8pKne1KKYGQm3s1kHsF4tmee1MfZohvT73HigbAysn2sQqUoZmhPohPC5LVWFHV0oOCaDmeDUvgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 21:04:19 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::344c:1b0:e7b0:bfe2]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::344c:1b0:e7b0:bfe2%6]) with mapi id 15.20.7519.023; Fri, 26 Apr 2024
 21:04:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
Thread-Topic: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
Thread-Index: AQHal8qRXy2S4Uv/pU2OPvpPXzaCUrF7CwMA
Date: Fri, 26 Apr 2024 21:04:18 +0000
Message-ID: <ac8e78466a4a33e48f718781e47b15a7c5c73a1f.camel@intel.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
 <20240426105655.23738-6-nirmoy.das@intel.com>
In-Reply-To: <20240426105655.23738-6-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|CY5PR11MB6115:EE_
x-ms-office365-filtering-correlation-id: faf033fa-f763-4499-0f8d-08dc66347066
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dHdKSDFMbEtxUmc5RVIvMTJIc2VqYXhKSlNaMGZJVnNZNmN6WEltUHpvNXBU?=
 =?utf-8?B?SmRrM2MyYXhDUXZuTkR6azI2aWM2K0ZEdVpzREIydndhWkpVT2VMY1M5elI1?=
 =?utf-8?B?VGE4ZlMwdi9YaEh4WmczOTcvdUNuWUlPRU9iTVI1RVpMaE80dlltMldCdTJT?=
 =?utf-8?B?SnBvQzAxVUhsWmhDVHc5ZW04N2E0djhRajNydjN0QmdVMnlBM2FkWjBsNXdV?=
 =?utf-8?B?ZnFnb3pWTkZDbWlxTTNQcHpta3JRL3hDR1pYMWhGbGFrUDJsd1pGRTh6TDU3?=
 =?utf-8?B?eW9qYURqeGo3U1FCc1NPVTZHZUphdm9ReWxoZW9zempvWjVTNGlWaXJOZkNx?=
 =?utf-8?B?N2xvWkdCclk4R2Zvc01JMk5kbjNqMnFBeHFBRHRzRm4xR0orZW5KUWFhVXF1?=
 =?utf-8?B?bHFTcVNncEdjd0c5dzViL1NKdEVCTVJBdVFkMmU0RGk3cFZSQS91ZnJqU3Vh?=
 =?utf-8?B?YjRsMVVsanRoSjFMQkZlbUlxbHN2OG1FU243bVdjVWxFUVd1NnVEV0N2WWV0?=
 =?utf-8?B?YTh1WEpxTlhLWU9kaW5QdFlKQjhBQ2lnc1B4eWM0S3MzTXBjM3I4T2hJNmpH?=
 =?utf-8?B?Zk1reEQ2U25jckNwK1Q0WU9reS9nZHJrdDFjSklBUU1CRmMxTnk0dHArY3VO?=
 =?utf-8?B?MTFaWUJuWmZEbDdlMlFVaXNTRTloS3lPOE9XaVQ5YkJzZXdBMmpmbHZuNnQz?=
 =?utf-8?B?ZkpUUUc5UFJYQ1IwOHU5eGs1THpXUzZCSHl0NkdqY1JGTHczV0RlOW9pV3JZ?=
 =?utf-8?B?SkFJbkRZMFVpV1JkajN6SDZCeUNiTldjc1QvMDJVVHIxbms0Qm9oa2oxR3NS?=
 =?utf-8?B?V2QySkNJc2FqSEd5RzlYUFdmWDF5eHN6L05qQy9DOWVnTnludmRSMUNzdVRt?=
 =?utf-8?B?WDdFNnd3cGZOeTZDTVk3cENoN0VkUzdJblVGTk1PM3N0c0RFY3BNazY3QWZE?=
 =?utf-8?B?cnE1bVhxckMwOUNsWE4rbkhnTTQ0MXFKdHRHTC91V0YxaEFCUjhNa0w0NjFw?=
 =?utf-8?B?U0phSDJpRGtwMkhTY1pZbWhwNVdUT3l6dXNaa2M0UFdWL2tjOURMZWYxdjF5?=
 =?utf-8?B?OE4vV2s3eFUwZHBaQ2dvczUzY2xYYlVzSHo2TVI1bEdMN3E5RE0wUjdZL21r?=
 =?utf-8?B?K3dRNHZMMjJDNHRTSHF2SmlvUG9yZFZudDNuOFFYWlptNGIwMStBWDdtWjdk?=
 =?utf-8?B?bnRYd0EzOVZycDBLNXZjNEwyTlVpTENKMjB0cy84R3FHZEpzODZiaE5oSGlK?=
 =?utf-8?B?b2szL1lFVkFCMHdHdnZKU2xxaUpXWWMzZys4dktybzJoQTIvVXNQREh6Unl0?=
 =?utf-8?B?OWFTUk5EYzJvWVFhQUNrU3JsRkRtYUc0TFh0ZHB4RzVrY1ZIZjdKTlpjUlRF?=
 =?utf-8?B?UklFTDJCZFl3eXVyM2NWRHBINjJRWDlLSGwzbXYyT1dxckNMK3F2dERjTVVh?=
 =?utf-8?B?ZFpXaWVERGpLa0hSdEZaR1pjdzhVTytMc29FNWhyM015QzUzbTdNajF1Uk90?=
 =?utf-8?B?K3VTdlNXZ3J6Tll1bVpWQ3hqWlBwUFVGdmhhdlFBODJ0Z2VvWk1IMkdiV0xt?=
 =?utf-8?B?VGV1OWkrKzRGdHo4UnRMLzJFa2hWeGNIdGtCL2U0VWJwR2sramE3MjhDSW12?=
 =?utf-8?B?cmtnb3g4L05VeFc2RGthRHZIQStLdENEUVhMc1Y4T0JCYUxHb2UyMEJXaUVl?=
 =?utf-8?B?TXlBQ3JyTWw1VmdKVWdCL1diMUFSaDgvdFpHMG1UVjRQNUZGQ1NWVTlYMFBw?=
 =?utf-8?B?Ynk4VWlReU9GeEdFTkQxcndacGhURGt4dVhBTDFXeWJnNUJmYm9kV0N1NEUr?=
 =?utf-8?B?Ynhtd0Vkb0YrY2wvMVBKdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnhjMUZwWjVxNEpSM3RZdG5XamdHWFNTaHg2OVVheHQ1TlZqb0NzN0M2K1NV?=
 =?utf-8?B?N090U2dnUjFqZnFYczNxUGU0Tlk3Z0ErVnR2MVlwR3g5d1JtUHRRS21CUFo0?=
 =?utf-8?B?Yks5RkI2eVpXMlR5ajJlZXp6ZjVyaXNuSG1pZUQ4aVlaSjM4VkFpaXFSNmpV?=
 =?utf-8?B?VUN1cEFCOTVCdFg0VGY1Z0w0QkEyY05HbFg0V01SVjYxMnVKY1NOcTIxTnd0?=
 =?utf-8?B?Ni9BTmhUcjh6WVJjbHJJRENjbzZsK0RmY3BFTW9VRzUweU9jTTdNOEh3eHRQ?=
 =?utf-8?B?cTNpZXNHK3RkMk5kVVRqWW5pb1kyWXR2TGpGYkZoTStqRlVjZ2RPckF2WkJT?=
 =?utf-8?B?SXJJaUpGbFlZUHBDWVpMWUM4RGxPZ2xLek9uWHBXZzVOTTRSc2EvM3NsQjJp?=
 =?utf-8?B?bnhWMTFrVHl1NTVPVXV0S0lFS0JjK29GbjlINGZJUDNsbWdOMzl0Z21lWC9i?=
 =?utf-8?B?T0VhdERMd254TzU5VDl0ci9rQzFXdFZqQko2WWlURjZYQUQzZkpYZ1FtNmVr?=
 =?utf-8?B?a0wzMVNwS3lFOStYU1dabFQvZVpiaUY1Y2xaWHFZWStzK2lRd09rVmFaQnpN?=
 =?utf-8?B?ekxuNFQwTVR1c0xpeGlzMU1sWnlHSk5kMFB3b3Q1bTdLVU5VOGRaQm5Ed0Rm?=
 =?utf-8?B?Ny8yRVowSm5vRjR1SCs4SlVvOVZjV0FuMXFVaGpIVGhuUlNBZWtRdTRSNXRN?=
 =?utf-8?B?clRUZmdGdjNLdW9lNDlLWlI5MHdrMkpaci9Bc1dXdjI5bitXaFdZcDZWZzBO?=
 =?utf-8?B?ODlqSDhJUmc3RS9rdEZWRjIzbXJwVExuSWVQR3ZRcm1iazNGbkJ3c2lMaHda?=
 =?utf-8?B?U1RHRDFITGdsKzdTSzBEa1NLTWdTQmZ4RjVvelA3SGdFYjJqOWZLRE8zc2FT?=
 =?utf-8?B?bnlmbFExWC9mMVJUZlFVMDN0U0RTTDFuWDkreDZUTlFjMVltZnVkMWVlWHlS?=
 =?utf-8?B?SnlOb3ZoOWJwUHoxR0o4K0RtNzRIdGxBNTJiM0xpNGZhTE4zUXM4aWF1djBG?=
 =?utf-8?B?RmFuNkpmM0ZzTXZvRXUrVW1pUS9jUzB4cnhkQUZBVXJVbi9UUkErNHFXNmc5?=
 =?utf-8?B?S1J2bEtmM3Y2YVp3bzU0Yy8waW5YcHVRWXI0YUV4UEliNkpyeVJBSDR2Z2hE?=
 =?utf-8?B?UVpJWERmNUN5WWxVZW5WcVp1ZVUxNjRwekEzcm5YbGRIWU1iaXJyMVg4c0NZ?=
 =?utf-8?B?aVM2VE1YTUtpM21XQnNtTjN2S0VwTUsyZ0ZHSFQydVpsNHUvS1pNVHIwcnFy?=
 =?utf-8?B?VmRBR3dxVDgwUUpMMW9yWFRqL1RuYXFFYk9FY1gvWHFjZlpsMWFNcXdURGJG?=
 =?utf-8?B?VDBZcWlyVGtBM0NHVUJtUzhiQmYxbXRCR29GZVlPRDlKUytZekRGcGlsejQ4?=
 =?utf-8?B?dk9nL2VhREFQcXNBZFY1UzRUdjRyTDIwamR2R3VqdmFLdFZNRndHNGlkenpl?=
 =?utf-8?B?UmFYeGVaUURJWXd6aUR6WkV6VUZYQzhTQmh6Sys5cC80Rm0rZVlzUjJ2QVFB?=
 =?utf-8?B?QVhoeUxhdGpuTnlDL2Fjb0NOZ21ya1h2TmtNbHhYSGt4L1NWbmE2ODhyUkJB?=
 =?utf-8?B?SHlVTU1sWEZabENIN2JiNEpOR1JnQ2hTRm5IMERRaUFhbkpHU2hWdlVjWkE1?=
 =?utf-8?B?MmdOYXRqZGJzaVJqa3BrUlc5N1oxV1FRMjBBMGVxL1djVlNyZjVHQ3hxbG1t?=
 =?utf-8?B?UFRnd3lweUc5QUZUWnpwZUpBZ3pQc1VETm5Gb25DRU5ueUZLVUoxN2xUMFFp?=
 =?utf-8?B?WHo1K2dwUGlCejlDTFZhcHVPVkk2QzNXTEJRc0lvQS9wWWZ5Q250UEJNU3c0?=
 =?utf-8?B?QXM4SXo5NTg3WEQ4NUNYbVZiTVpQSStVR0hzNWxOL1FYUzFYbWNrdDV5N0Zo?=
 =?utf-8?B?elpHQmlzeU5zNWdSM2dKRVhKN1BYRGplM2phcnpWengyV1YvQmlTckYrbGU5?=
 =?utf-8?B?STYvK25EaDRiblA1elNEVDNOdngvU0tzd1RtbTNoc3RDMko5VU9IaUgycUhM?=
 =?utf-8?B?UjJmb1BQZXBOWVdXV0ZxWitSMzk4S2pqMG1QQW00dVI1YndXNVgwaSsyS1Fi?=
 =?utf-8?B?cFQ2elpDSFBKS1NUaDlrN3FVQW1URGx1aDRoK04wVUVKaGkzU1lRUHZKZFFW?=
 =?utf-8?B?NlF6bjFuM0FjS0tJbklTcjBidktyQUhtRHloRDJsZ2EwSWdEcFdPWGhIUHZz?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19A52264E075EC479765B8A78A618479@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf033fa-f763-4499-0f8d-08dc66347066
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 21:04:18.9617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhXNG2DAaFtXsnrPgZUvjrs21EqKCX6jULOgEx47vFH83k7ZL9Ys+1qsddzghhfkOiApVD6tW53ATkO8URs+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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

T24gRnJpLCAyMDI0LTA0LTI2IGF0IDEyOjU2ICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBU
aGUgZGVmYXVsdCBiZWhhdmlvciBvZiBkZXZpY2UgYXRvbWljcyBkZXBlbmRzIG9uIHRoZQ0KPiBW
TSB0eXBlIGFuZCBidWZmZXIgYWxsb2NhdGlvbiB0eXBlcy4gRGV2aWNlIGF0b21pY3MgYXJlDQo+
IGV4cGVjdGVkIHRvIGZ1bmN0aW9uIHdpdGggYWxsIHR5cGVzIG9mIGFsbG9jYXRpb25zIGZvcg0K
PiB0cmFkaXRpb25hbCBhcHBsaWNhdGlvbnMvQVBJcy4gQWRkaXRpb25hbGx5LCBpbiBjb21wdXRl
L1NWTQ0KPiBBUEkgc2NlbmFyaW9zIHdpdGggZmF1bHQgbW9kZSBvciBMUiBtb2RlIFZNcywgZGV2
aWNlIGF0b21pY3MNCj4gbXVzdCB3b3JrIHdpdGggc2luZ2xlLXJlZ2lvbiBhbGxvY2F0aW9ucy4g
SW4gYWxsIG90aGVyIGNhc2VzDQo+IGRldmljZSBhdG9taWNzIHNob3VsZCBiZSBkaXNhYmxlZCBi
eSBkZWZhdWx0IGFsc28gb24gcGxhdGZvcm1zDQo+IHdoZXJlIHdlIGtub3cgZGV2aWNlIGF0b21p
Y3MgZG9lc24ndCBvbiB3b3JrIG9uIHBhcnRpY3VsYXINCj4gYWxsb2NhdGlvbnMgdHlwZXMuDQo+
IA0KPiB2MjogRml4IHBsYXRmb3JtIGNoZWNrcyB0byBjb3JyZWN0IGF0b21pY3MgYmVoYXZpb3Vy
IG9uIFBWQy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIHwgMjcgKysrKysr
KysrKysrKysrKysrKysrKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8ICAy
ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcHQuYw0KPiBpbmRleCA1Yjc5MzBmNDZjZjMuLjIzN2U0YTQ5ODVhNCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gQEAgLTYxOSw5ICs2MTksMzAgQEAgeGVfcHRfc3RhZ2Vf
YmluZChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiAgCXN0cnVj
dCB4ZV9wdCAqcHQgPSB4ZV92bWFfdm0odm1hKS0+cHRfcm9vdFt0aWxlLT5pZF07DQo+ICAJaW50
IHJldDsNCj4gIA0KPiAtCWlmICgodm1hLT5ncHV2YS5mbGFncyAmIFhFX1ZNQV9BVE9NSUNfUFRF
X0JJVCkgJiYNCj4gLQkgICAgKGlzX2Rldm1lbSB8fCAhSVNfREdGWCh4ZSkpKQ0KPiAtCQl4ZV93
YWxrLmRlZmF1bHRfcHRlIHw9IFhFX1VTTV9QUEdUVF9QVEVfQUU7DQo+ICsJLyoqDQo+ICsJICog
RGVmYXVsdCBhdG9taWMgZXhwZWN0YXRpb25zIGZvciBkaWZmZXJlbnQgYWxsb2NhdGlvbiBzY2Vu
YXJpb3MgYXJlIGFzIGZvbGxvd3M6DQo+ICsJICoNCj4gKwkgKiAxLiBUcmFkaXRpb25hbCBBUEk6
IFdoZW4gdGhlIFZNIGlzIG5vdCBpbiBmYXVsdCBtb2RlIG9yIExSIG1vZGU6DQo+ICsJICogICAg
LSBEZXZpY2UgYXRvbWljcyBhcmUgZXhwZWN0ZWQgdG8gZnVuY3Rpb24gd2l0aCBhbGwgYWxsb2Nh
dGlvbnMuDQo+ICsJICoNCj4gKwkgKiAyLiBDb21wdXRlL1NWTSBBUEk6IFdoZW4gdGhlIFZNIGlz
IGVpdGhlciBpbiBmYXVsdCBtb2RlIG9yIExSIG1vZGU6DQo+ICsJICogICAgLSBEZXZpY2UgYXRv
bWljcyBhcmUgdGhlIGRlZmF1bHQgYmVoYXZpb3Igd2hlbiB0aGUgYm8gaXMgcGxhY2VkIGluIGEg
c2luZ2xlIHJlZ2lvbi4NCj4gKwkgKiAgICAtIEluIGFsbCBvdGhlciBjYXNlcyBkZXZpY2UgYXRv
bWljcyB3aWxsIGJlIGRpc2FibGVkIHdpdGggQUU9MCB1bnRpbCBhbiBhcHBsaWNhdGlvbg0KPiAr
CSAqICAgICAgcmVxdWVzdCBkaWZmZXJlbnRseSB1c2luZyBhIGlvY3RsIGxpa2UgbWFkdmlzZS4N
Cj4gKwkgKi8NCj4gKwlpZiAodm1hLT5ncHV2YS5mbGFncyAmIFhFX1ZNQV9BVE9NSUNfUFRFX0JJ
VCkgew0KPiArCQlpZiAoeGVfdm1faW5fZmF1bHRfbW9kZSh4ZV92bWFfdm0odm1hKSkgfHwNCj4g
KwkJICAgIHhlX3ZtX2luX2xyX21vZGUoeGVfdm1hX3ZtKHZtYSkpKSB7DQoNCm5pdDogeGVfdm1f
aW5fZmF1bHRfbW9kZSByZXF1aXJlcyB4ZV92bV9pbl9scl9tb2RlLCBzbyB5b3UgY2FuIGp1c3Qg
Y2hlY2sgZm9yIHRoZSBsYXRlci4NCg0KPiArCQkJaWYgKGJvICYmIHhlX2JvX2hhc19zaW5nbGVf
cGxhY2VtZW50KGJvKSkNCj4gKwkJCQl4ZV93YWxrLmRlZmF1bHRfcHRlIHw9IFhFX1VTTV9QUEdU
VF9QVEVfQUU7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQl4ZV93YWxrLmRlZmF1bHRfcHRlIHw9IFhF
X1VTTV9QUEdUVF9QVEVfQUU7DQo+ICsJCX0NCj4gKw0KPiArCQkvKiBVbnNldCBBRSBpZiB0aGUg
cGxhdGZvcm0oUFZDKSBkb2Vzbid0IHN1cHBvcnQgaXQgKi8NCj4gKwkJaWYgKCF4ZS0+aW5mby5o
YXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbSAmJiAhaXNfZGV2bWVtKQ0KPiArCQkJeGVfd2Fsay5k
ZWZhdWx0X3B0ZSAmPSB+WEVfVVNNX1BQR1RUX1BURV9BRTsNCj4gKwl9DQo+ICANCj4gIAlpZiAo
aXNfZGV2bWVtKSB7DQo+ICAJCXhlX3dhbGsuZGVmYXVsdF9wdGUgfD0gWEVfUFBHVFRfUFRFX0RN
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiBpbmRleCA4ZmMzN2M1YTAxOTYuLmY3OTUwMTZhODBkNSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTgwNSw3ICs4MDUsNyBAQCBzdGF0aWMgc3RydWN0IHhl
X3ZtYSAqeGVfdm1hX2NyZWF0ZShzdHJ1Y3QgeGVfdm0gKnZtLA0KPiAgCWZvcl9lYWNoX3RpbGUo
dGlsZSwgdm0tPnhlLCBpZCkNCj4gIAkJdm1hLT50aWxlX21hc2sgfD0gMHgxIDw8IGlkOw0KPiAg
DQo+IC0JaWYgKEdSQVBISUNTX1ZFUih2bS0+eGUpID49IDIwIHx8IHZtLT54ZS0+aW5mby5wbGF0
Zm9ybSA9PSBYRV9QVkMpDQo+ICsJaWYgKHZtLT54ZS0+aW5mby5oYXNfYXRvbWljX2VuYWJsZV9w
dGVfYml0KQ0KPiAgCQl2bWEtPmdwdXZhLmZsYWdzIHw9IFhFX1ZNQV9BVE9NSUNfUFRFX0JJVDsN
Cj4gIA0KPiAgCXZtYS0+cGF0X2luZGV4ID0gcGF0X2luZGV4Ow0KDQo=
