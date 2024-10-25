Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AB9D149E8
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 19:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C76E10E09E;
	Fri, 25 Oct 2024 19:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqBhmKf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAFA10E09E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729884758; x=1761420758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oU99ksxb+z0u31UT0gEWQMSu+biQbViz1CTAm/kInR8=;
 b=BqBhmKf1ubkxxh8ASJ2gZ5tvCJgmbFIqe/02qXKitPKZF7KvBMPUFoaA
 u2nLjs+C3belGRv6Y2Uq/yWxDvvx9ZYlBaQlFWiZJ9c3UpKbz2SL/OiM6
 1kvZrdyxjUrlpkaGTxv3NVaabHHgUA8TLDZRZh8T7llIV2dXP+AJ11g/9
 ayZDnP0wWTrvByllGt9X0fULh/1Z9Po2TycnAH0KatqnRQ93ajhYb/SDa
 QWujDv6toHidszy2M5bCBtlPXXgKFt/5ZWX6/ugJVwJuEySzWqy5UExMw
 k2eZ1UuCMBQZxwKZR9gHoSRaFg+GCq7G6VtYt7fNLZGQvYh9NtzF1HsTv Q==;
X-CSE-ConnectionGUID: X98wdMziS2+FXKlz7JMAnw==
X-CSE-MsgGUID: YldLnGQDSMGw2y1cZqM9Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40668092"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40668092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:32:37 -0700
X-CSE-ConnectionGUID: hs9LLXa8RfiqAaO6cHdzFw==
X-CSE-MsgGUID: CDLbSUWoRTimcqVi/ksUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="84980905"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:32:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:32:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:32:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib+za2I1YC7IG2sSahxKU/QjRixsJ0ZPMHb4plb5u1v9hZDzIOI/Efh1K52EgkUDnxbiAYiH29aEPq3wncryVaIKb6oOifk6E4+g2apN4ZIA1Ikw8wKiDUznhFa0ylBScaUeMMtFetGmU3LEjNcokFAoAL9DnZqw8OerF8rW0BjB6ip/bojzr1PljmwWy+nZiBoYz2QlPAUwKhW/wisVgiI8gc3ofFsYQs80yIRj4wff62gejbdlvB5vNv6f+B5m/ejiramP1caWxL0B36iJkaTSBpbJ69ZNEA/dmn5Td2FLzz57Wr0wgP9vckYLefJAxB91CWQgLBza8NcPo5Qnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU99ksxb+z0u31UT0gEWQMSu+biQbViz1CTAm/kInR8=;
 b=b5CnyTAxn1qH7LBDqyUE15X7RrWE2C0bHwY7X4q89yY/+f0cl4hULCISnf0ivXwJ4IcIWRrIttmeF0why7jR2vezeka4IOGKqwwyfyTT8vBWC/44+m8+mfo414p3ifmlDJuxHEJiXbvDS5YyM3cecNqZFWq3kSV3L1iycF/euApbo4CHFlsJ87fTbHbNUv8njTj4PJAbiu5HU2Q327Vw7V2NcVv6zYxH/UA6B6oRvVhC3uJRxKWOC8KDc70431IkKG/mViJVCLWeV1hKDEigxSCLm1PrNCn5eavR/LIpuKVl8C2NjzLXLZsQK+tsc29xADMNC2MlVyY0Myzumw4utA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Fri, 25 Oct
 2024 19:32:33 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%4]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 19:32:33 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Justen, Jordan L" <jordan.l.justen@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Thread-Topic: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Thread-Index: AQHbJNoE4WGXDyvkEki0eg9X8NqxYLKUjJqAgAAPXwCAA0OCAA==
Date: Fri, 25 Oct 2024 19:32:33 +0000
Message-ID: <e25b8e02ceba708c71ff783c547744b7dc15cbae.camel@intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
 <20241022232756.1769013-2-matthew.brost@intel.com>
 <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
 <Zxk1XqHRi90GG89g@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zxk1XqHRi90GG89g@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0-1+b1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|MW4PR11MB5892:EE_
x-ms-office365-filtering-correlation-id: 078269f6-732f-47dd-28d1-08dcf52bc632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U0lmQ2hxc3BDakpqL3dJbWh6T1YzWm55emtPVWIzYjlGa21OaFhQalV4RTdH?=
 =?utf-8?B?RDRGVFNhNy9tOW5uQUE3d0tGYVFRZXphR2RRZldNWkhMUGs1Y3pVYXNxWnBQ?=
 =?utf-8?B?c0NTSEVES2FZY2hGSit4MTVhWUZsUEtmYjhiTDBRTzFpWGdpNythYUtxem1P?=
 =?utf-8?B?TnFkYW81OXkvTnZORDNUV3g4eGdob2lkRU5GK09yODlpR3dlOG9RcnlQY0Vw?=
 =?utf-8?B?OUFZS2dyZ1k0UVB2bS85L0pBZFpzYlFnRFVDKzhGUTRFaTlKTFhFTys4WXlj?=
 =?utf-8?B?QkVKNEFMd2pYeG56dVN3SFl3a2EyUEszSWNEWHlaUG05ejJxQWJzL0NLc1pJ?=
 =?utf-8?B?c0htUW5lRnRiQTg1eGtUcTBlUTBXaTBUMitBeHNvYUV6SFd4RUNhREJBUlY3?=
 =?utf-8?B?dlhCTTh6TGduOW1aNkhuaEVscFVVSjI2bWtVTDBRcDkwRnZWS01icXdkS2R4?=
 =?utf-8?B?UXVld1E1dnNSazZZL29XUDVRNXFKYjcweW1IN0E1Nit6MVIvMkFuVWxSbjBa?=
 =?utf-8?B?UEY0dm1Vc1RqcEQxV1pTNHc3R1dGV2RZZzFGNytKK1dQZU1lcldQQnZFdE1k?=
 =?utf-8?B?UHI4b0gwQTJ2cXJYc1JwcUNPVTFxTlgwcGFJL1lpVlVLT3pjOEdXNTE5ZXBM?=
 =?utf-8?B?MitsbWVKWEVGdDNqdVlxb20wQkZpSkpBNFdqNWxWUE5Qc0xqWFgzNWRCZi9p?=
 =?utf-8?B?Nkl2Y1FBTkgzKzRMazFsQnNFN0kzcFAybUF0TjNFOVN4VU9vbWpjNzl3dmM3?=
 =?utf-8?B?dTE4SkxsT21MNTcvYkJua0F2SWFsN05NQ2tlTnhzTi9wUWhxNjkxNTBxMFZE?=
 =?utf-8?B?ZXhLQ1E4MHBLMGphSmhaVGJZRDAxc1FpTjcycnRCWUdINWJoRHRkVG9ESjJ4?=
 =?utf-8?B?ZnZJUHlnWm02bjZOUTZoQ2J3VmxvNDdmdmxDVXB3bTNFSEFuZXhpS3Fqdit4?=
 =?utf-8?B?N2JBaW84OXVZcWFaQTBKcDVHWWJSNVB5KzVtK2RRU2NOa0hRS25Sdzhacyti?=
 =?utf-8?B?S29QcWs1bCs1SHdZK3U4SXdFMlJUSmlQYXAyZnRiQ3MwRERpa0NER0U3aDEr?=
 =?utf-8?B?UWlxVlpPUGNIM1F5NXNzUWFUZDhwOUcva3VJcUgvd25sVzhTd0l6OFhORWZS?=
 =?utf-8?B?VDhLcS9zWUxpZkt5dWpyMTIySEgzeUZYcTE1aVdyZnJiYUF2citYTEdTT2NY?=
 =?utf-8?B?RDl0anI0YWQzVTJFeURuaTB5M0owakJKV2FhWDEzNXRkckNZTlY2VWpTbzlp?=
 =?utf-8?B?QlAyUVFqUnl4M0wvdU1uM0JQa0FKcjRGY3JqdjhBYXJralIvNkdPSGR4S1F0?=
 =?utf-8?B?L1ZMR3lDdWhPb2llYmJRMFBCcVBoc3pndUYrc0s5Qk5vcW05NkdGaFR5bWcz?=
 =?utf-8?B?bkltSzdZY1BMMzdiWFczWXB0QzNxSzUxL0FxU1R4MUhudFJDM1I5STQrSzdW?=
 =?utf-8?B?dHFmcXlsUm5nZkhOQmQ5aGd1N1kycDlTRG5KWFpTdHRsNGtRRFZmTzhUWW5o?=
 =?utf-8?B?Qnk5b3NDOVVGVkNHN3VJdHRERzhRbkt3Yzh3NzUzZXdiVHFzQlV2UW0yWXJU?=
 =?utf-8?B?S2Z3amEyOERvcElQWnozUVdkaVJxMzRzR2w3TVBHaStxLzh3TitsR2h1bnBq?=
 =?utf-8?B?TElpVTRlUm5vckFTWThQTnFEQ1lpYU01V2Y0VHUrajZZSkhENlh0RzFXNkU5?=
 =?utf-8?B?VEhUakNUZWx1VjJ0bGorM2EweXVrN1BudzZRVENreWpvMFNMVUtpazdSQW1j?=
 =?utf-8?B?VVhGY3pPbzRQSkJvVXNJQVJOZWlQTk5OcFNHNHJuemdWbWxKcEhmVExKdjEw?=
 =?utf-8?Q?m9UYspPcnylUxWIO5tt3DIye/F8mh01A0IQrE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmx5NUpIcUxXS2REaGlGcHdFRDhtRGIxM0lHVWc0a1JVQWo0dUpUZUNoVXhR?=
 =?utf-8?B?VlhwQVllbVV6TjFhbDc4ZStJSGgwSTZsNDBadHNIZkpKMk4yeVVVdHRDTyt0?=
 =?utf-8?B?SndjcTF3SGJPYWM4WEVpYVUwQ0NRb2kzdkh5eGdkRmU4SldjWUJWY1NyOU91?=
 =?utf-8?B?dU1qVFp5b0NxbWkvNGs3aW5JTVMreTZZQVFQZE5DWE5VeGVDWTZuUS81T1I5?=
 =?utf-8?B?K0lwajYyTUtON0h0VHFwU05DU3JVc3Evdk5LaFNpQlc5L3ZPUVJWMzMwVDhE?=
 =?utf-8?B?UXpvUFk4QTc5QVVLU2dmV042bGc4dXNLcVQxdDZWTUZ3ZTNTYTAzOE5JWHFZ?=
 =?utf-8?B?ekdGRDhybWhWdmpsUmRzeFlOMnZsZEVJVXFJNHMvbTRuWXJWTDlVR1lJc0x6?=
 =?utf-8?B?S3Ava2RWdHdjVE4vT2pQL21nTlJsN0xTTW1tQVZRVGt3YnJVTzZTcmFCei9h?=
 =?utf-8?B?K1RYUmJaVDRwYklCRmYzcnh5and1aVkyK25iTWtsdDM2ZUZRTzdTNlhXNGFW?=
 =?utf-8?B?ViszeHU3Ti9hNU5WRElpdkErdGZkSXpBWUg0ckthR0ovVkhqU0RPWWYzRU1P?=
 =?utf-8?B?ampZc3gvLys2d25jNHZ4S2lXTEVxU1QxYk5IdjVjc2k0MCswbXMxbEtiMm1z?=
 =?utf-8?B?YldvaTlzOXdCWVl0YU4zZGV1ak45dCt5d0tPSGRwK0oyVktMUm1hZk5QMksz?=
 =?utf-8?B?YnVYZElSRExOY1VXQzNSa3VwVHAyVldPNVdIdENLZHdwRlAwWW9zOTY5OGpk?=
 =?utf-8?B?ckhxSXVzSnpvY2NWTVJIOTBXbW4yRXRGQlA4eFJTNkZwQmZ0b2ZwKzFnRnJ0?=
 =?utf-8?B?S1BmTUc1dkthN05JTW9oZjZBT1lMWlFHV2N6dzZBdDV4bk15MWVrNEN6ZVdJ?=
 =?utf-8?B?NjNpYTFNWTJPV092TENCYUducC9MTkhVYUZaTzduanB2eDJnaVF6Ull5T25Z?=
 =?utf-8?B?aVVqTWsrL0hrT0MxSXBYWWFIbjBwMXVKN3BkQnd4cFgyNUo3WDY1WVVNZHB3?=
 =?utf-8?B?U2dOYXh1N0tzcVd5OVRua0FzaDRoRU1Fek0xb1hOQkxBK1lPUkFuV3pua1JX?=
 =?utf-8?B?M2tEVDAvMERRRHdpWTJyekkwcXhETDVFQ1Q2WGczSnAvOW1DOGc3QW9lRFAx?=
 =?utf-8?B?WncvTXlOKytxSmlaTnpCdWQxK1BTNndrNC8zNmhYQllDWThoQmtYVGdtV2ky?=
 =?utf-8?B?bnIwOEV2ajI2SUsxTkw0RDRkU29INEVkTFdYZ0tLTWhqdGx2TVdRT2tyRm1h?=
 =?utf-8?B?NHFGUXZFQ0pmQ3Q4RU9TMW1SbjRMb3FyUmR5dW9ta0FqSWIrRCtlaFJuWTJp?=
 =?utf-8?B?TDVHZFdseFlGRmVSR1BlaTVyRS9PVlg2R1JzZXBjN3d3V3o3S2VQM2FtZE1E?=
 =?utf-8?B?azNzbG9pa1dzdUNWVUFMSnZFYk9tS0w5bTByVG90RFdxSjduSjZ0TlBja0dK?=
 =?utf-8?B?T0MzOFUxTDZielZtZ3JhZDV1aFMybzNLVVRwU2l6SHR6YkxvTjVuYTJWR1dI?=
 =?utf-8?B?bTlCLzF3YmRwZ2Z2bXcyM1hWRjBSSmFNY2Rna3l4TGZXYWZlT3kwZW5lTmly?=
 =?utf-8?B?TGg3ZUNmdGE3L3F1WFUyNmMyeS9HUE96YVYvbDgxNWw4WW50NDJqcllwVHFa?=
 =?utf-8?B?Q3UxWG4xbzRqSWZkM0FDaFNPUWFOaHR2d2lEeDJOTUtWMXpqbWkwcXBsZSsx?=
 =?utf-8?B?cVlackRtc2ZHYjRkUStMVDhTWUNUeUl4eExBS0NIb0tLTEdHMm5mbkFFaHZt?=
 =?utf-8?B?R01tVTJTdjM4ZmptdXNoSUdWTWMrMmUrVTVlWlA0RHJmT2ZQVFdLSWpLa2Rw?=
 =?utf-8?B?RGVXZEZnRzNQZmRXUzhMSkNjb25yQi9vUmNPanlwOG1GOVlNL3VTb1JDcTgy?=
 =?utf-8?B?ZXI1SXNSTCs0ODIvbW9XQXZ1NEhqZHNxWXp5Z2wvS3BZVVlIbVUrT3l3S0I1?=
 =?utf-8?B?eUhLUjEvaUJGZW53bzBld05ZeElNczNhd2d3eFlrenJkeWlnZlhqY2x5VTQw?=
 =?utf-8?B?bUpSM0YrbVU1dkNGcVNsOEVZbmpmY3M1NGN1WEFZQXdCUXBLcHVXdGJxbURu?=
 =?utf-8?B?aDVrV0d5QWtDN0dRb1ZZZWlBRFhvWU9zRDJjSmtieVlCR1UzZXhBM1JpeU9v?=
 =?utf-8?B?L1QzY3UwS3piN2VzZDBGOUxCRFd2OFNXWlF5WVVKWDZtY285dzlEYnVQcjFC?=
 =?utf-8?B?RDZoQ3pNSFRIV2JnSlRWbG9hc044aVV3cnFkbVZVamU2L3oxYS83R0UxY1hu?=
 =?utf-8?B?R3FteERSWHczNnY0akI1b3pZNWRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18945CCD22A78744B5F1C3B11EFEB164@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078269f6-732f-47dd-28d1-08dcf52bc632
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 19:32:33.6758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UeGxWlU9Mz+69O5sAoB0GszsVaOLs7RUz32fjPc855Rl9k9zqMkKtzphaSzPch0vTUsHsMgPhWGaownRCgs5M5TET24fSw3RtMpSzU7MZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
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

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDE3OjQxICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCAxMDo0NzowNUFNIC0wNjAwLCBaYW5vbmksIFBhdWxv
IFIgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI0LTEwLTIyIGF0IDE2OjI3IC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gU2hvcnQgY2lyY3VpdGluZyBURFIgb24gam9icyBub3Qgc3Rh
cnRlZCBpcyBhbiBvcHRpbWl6YXRpb24gd2hpY2ggaXMgbm90DQo+ID4gPiByZXF1aXJlZC4gT24g
TE5MIHdlIGFyZSBmYWNpbmcgYW4gaXNzdWUgd2hlcmUgam9icyBkbyBub3QgZ2V0IHNjaGVkdWxl
ZA0KPiA+ID4gYnkgdGhlIEd1QyBmb3IgYW4gdW5rbm93biByZWFzb24uIFJlbW92aW5nIHRoaXMg
b3B0aW1pemF0aW9uIGFsbG93cyBqb2JzDQo+ID4gPiB0byBnZXQgc2NoZWR1bGVkIGFmdGVyIFRE
UiBmaXJlIG9uY2Ugd2hpY2ggaXMgYSBiaWcgaW1wcm92ZW1lbnQuIFJlbW92ZQ0KPiA+ID4gdGhp
cyBvcHRpbWl6YXRpb24gZm9yIG5vdyB3aGlsZSByb290IGNhdXNpbmcgam9iIHNjaGVkdWxpbmcg
aXNzdWUgb24NCj4gPiA+IExOTC4NCj4gPiANCj4gPiBJIGp1c3QgdGVzdGVkIGl0IGFuZCBpdCBz
ZWVtcyB0byBkbyB3aGF0IGl0IHByb21pc2VzLiBUaGFua3MhIEhhdmluZyBhDQo+ID4gNSBzZWNv
bmQgaGljY3VwIGlzIHN0aWxsIGhvcnJpYmx5IGJhZCwgYnV0IGl0IGlzIC0gY2hlY2tzIG1hdGgg
bm90ZXMgLQ0KPiA+IGluZmluaXRlbHkgYmV0dGVyIHRoYW4gd2FpdGluZyBmb3JldmVyIGZvciBh
IHN5bmNvYmogdGhhdCB3aWxsIG5ldmVyIGJlDQo+ID4gc2lnbmFsZWQuDQo+ID4gDQo+ID4gVGhp
cyBwYXRjaCB3aWxsICp0cmVtZW5kb3VzbHkqIGhlbHAgTWVzYSBDSSwgc2luY2Ugd2UgY2FuIHJl
cHJvZHVjZQ0KPiA+IHRoaXMgYnVnIGFsbCB0aGUgdGltZSB3aXRoIFZ1bGthbiBDVFMgdGVzdHMu
DQo+ID4gDQo+ID4gU3VnZ2VzdGlvbnM6DQo+ID4gDQo+ID4gLSBDYW4gd2UgZ2V0IGEgbWVzc2Fn
ZSBvbiBkbWVzZyBldmVyeSB0aW1lIHRoaXMgaGljY3VwIGhhcHBlbnM/IFdlJ3JlDQo+ID4gbm90
IHN1cmUgaWYgaXQncyBoYXBwZW5pbmcgb24gcmVhbCB3b3JrbG9hZHMgb24gcGVvcGxlJ3MgbWFj
aGluZXMsIHNvDQo+ID4gbWF5YmUgaGF2aW5nIHNvbWUgc29ydCBvZiBpbmRpY2F0aW9uICJvb3Bz
LCB3ZSBqdXN0IHVuc3R1Y2sgdGhlIGJhdGNoDQo+ID4geW91IHN1Ym1pdHRlZCAzMDAgZnJhbWVz
IGFnbyEiIHdvdWxkIGhlbHAuDQo+ID4gDQo+IA0KPiBXZSB3aWxsIGFkZCAnbm90aWNlJyBsZXZl
bCBtZXNzYWdlIGlmIHRoaXMgb2NjdXJzLg0KDQpJIG1heSBiZSB3cm9uZywgYnV0IGZyb20gd2hh
dCBJIHVuZGVyc3RhbmQsICdub3RpY2UnIGxldmVsIGlzIHNvbWV0aGluZw0KdGhhdCB3aWxsICpu
b3QqIHNob3cgdXAgb24gcGVvcGxlJ3MgZG1lc2cgaWYgdGhleSBhcmUgdXNpbmcgZGlzdHJvcycN
CmRlZmF1bHQgY29uZmlnLiBUaGlzIG1lc3NhZ2Ugc2lnbmFscyBhIGJ1ZyBpcyBoYXBwZW5pbmcs
IHdlIG5lZWQgdG8NCm1ha2Ugc3VyZSBpdCBhcHBlYXJzIGluIGRtZXNnIGJ5IGRlZmF1bHQuIFRo
ZSB3aG9sZSBwb2ludCBpcyB0byBiZSBhYmxlDQp0byBmaWd1cmUgb3V0IGlmIHRoaXMgaXMgaGFw
cGVuaW5nIGluIHRoZSB3aWxkLiBDYW4gd2UgcHJvbW90ZSB0aGlzIHRvDQpLRVJOX1dBUk5JTkc/
DQoNCj4gDQo+ID4gLSBTaW5jZSB3ZSBkb24ndCBrbm93IGhvdyBsb25nIHVudGlsIHRoZSByZWFs
IGZpeCwgY2FuIHRoaXMgYmUgdGFnZ2VkDQo+ID4gZm9yIHN0YWJsZT8gSWYgaXQgdHVybnMgb3V0
IHRoaXMgcmVxdWlyZXMgc3BlY2lhbCBHdUMsIGl0IHdvdWxkIGJlIGV2ZW4NCj4gPiBtb3JlIHZh
bHVhYmxlIHRvIGhhdmUgdGhpcyBpbiBzdGFibGUgc2luY2UgdGhvc2UgdGVuZCB0byB0YWtlIG1v
cmUgdG8NCj4gPiBwcm9wYWdhdGUgdG8gcGVvcGxlJ3MgbWFjaGluZXMuDQo+IA0KPiBJIGRvbid0
IHNlZSBhbnkgcmVhc29uIHdoeSB0aGlzIGNhbid0IGJlIGJhY2twb3J0ZWQsIHdpbGwgaW5jbHVk
ZSByZXF1aXJlZCB0YWdzLg0KPiANCj4gTWF0dA0KPiANCj4gPiANCj4gPiBUaGFua3MgYSBsb3Qh
DQo+ID4gDQo+ID4gPiANCj4gPiA+IENjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYyB8IDQgLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygt
KQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+IGluZGV4
IDBiODE5NzJmZjY1MS4uMjVhYjY3NWU5YzdkIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gQEAgLTEwNTIsMTAgKzEwNTIsNiBAQCBndWNfZXhlY19x
dWV1ZV90aW1lZG91dF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKmRybV9qb2IpDQo+ID4gPiAg
CQlleGVjX3F1ZXVlX2tpbGxlZF9vcl9iYW5uZWRfb3Jfd2VkZ2VkKHEpIHx8DQo+ID4gPiAgCQll
eGVjX3F1ZXVlX2Rlc3Ryb3llZChxKTsNCj4gPiA+ICANCj4gPiA+IC0JLyogSm9iIGhhc24ndCBz
dGFydGVkLCBjYW4ndCBiZSB0aW1lZCBvdXQgKi8NCj4gPiA+IC0JaWYgKCFza2lwX3RpbWVvdXRf
Y2hlY2sgJiYgIXhlX3NjaGVkX2pvYl9zdGFydGVkKGpvYikpDQo+ID4gPiAtCQlnb3RvIHJlYXJt
Ow0KPiA+ID4gLQ0KPiA+ID4gIAkvKg0KPiA+ID4gIAkgKiBJZiBkZXZjb3JlZHVtcCBub3QgY2Fw
dHVyZWQgYW5kIEd1QyBjYXB0dXJlIGZvciB0aGUgam9iIGlzIG5vdCByZWFkeQ0KPiA+ID4gIAkg
KiBkbyBtYW51YWwgY2FwdHVyZSBmaXJzdCBhbmQgZGVjaWRlIGxhdGVyIGlmIHdlIG5lZWQgdG8g
dXNlIGl0DQo+ID4gDQoNCg==
