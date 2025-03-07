Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E36C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 12:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D998210E15B;
	Fri,  7 Mar 2025 12:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvZpT67/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3810E15B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 12:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741349966; x=1772885966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3ySMhlXiy83KCG6yxLaPeANhigChTifq9jvftJVJ5ss=;
 b=WvZpT67/FKtMqwEmKhmgHMnv2XqWo05aKD6yF/zCtCTtG4Typc+JWgvN
 4SHKQEAA5IH9wWJP9zsj6eQ6zBTmJ6+/H4/T0ovxg4hBuRyen9JFI60tC
 nKXGVS+64oAguF1HgHLzXANBPD/oSqG4sGx3RIC2hT8FrlD+pKdEwJ1wM
 /9mcjPT052cnpw/GL8v7/BA6Fe91gzDgHGVhM4/hTQcmOPGCCzfi6tagD
 CdMJAcHIyU2lZDgjf3w33/34/kY37/sAwEL2cCxrMtbNW1jBojEduWiPc
 Yg4JSYeBVGqSMqOocNdKpMgaNMtwua6bkt9ovpufrhl2wyLx9QD8bRIQ+ w==;
X-CSE-ConnectionGUID: EgygjBPpQDOs6PRC8pqTog==
X-CSE-MsgGUID: +PHzBLRWSJeNfjQ0uDXuAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29975904"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="29975904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:19:26 -0800
X-CSE-ConnectionGUID: PjzgmfA0Qr6X4uxQRZO3zg==
X-CSE-MsgGUID: DXXBYrZwTmWvVspBAQtf/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124404652"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 04:19:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 04:19:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 04:19:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 04:19:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqpF/mh1lIsqaDSyjbLlFbiwW9gtHMqvrAL8GCNtyWpAIn1OhujIhvf1yqxdqt+RnOyqeMLOFDrDxq/CZ+scT2SDjAsjevtCisx8JVbgabr8ZKUkfOwrgCUeTPY9pni8622GsAM6Qx6o17D67HhBC4nQtiLq2FQVxs4/B57CeSiQTnJ20Z7rhm01QHOmGg0z/w0oT3w6N+P/XEwyZ4OCxSiNXHqlDgR2G0oApxGCcgL8SyULSmN7pJpcrJGJ8v+xmW+Wt5N8+kI1Q0A38oseGv4YZM683fcMLsZ+5QsG0NqSPDEqK9VgTJj9f07jG4DKLb13HWW2Cxz6lRh6Xt/HyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ySMhlXiy83KCG6yxLaPeANhigChTifq9jvftJVJ5ss=;
 b=jfekUKLOtBI8ztJltwmb3KTj5WoeRbu9RCHQWTZ3DWc8dXZ0pJ+vGXDQEwjmv4cAGLQXh+y9UUaCP7xr9M44GpwpEHX25Lgxak+xuI7r7/1vNKGLH2TXpJfVavW2vwhCyy7psyFZ2HpDwmrFQR8c0wEik8Rl9qcpjRfIFiFPdjm3hh5vf0XOf0Yqp9YM+vWjrf524h5V584XsWKhsIyNlrYix+TtTX9kdPBeTcHBt8hUoVbLlKdDOEOZP7ieY5rPi1teE0dPLqTGjnjsTJaiw/AGSGaCyCGk2YEnxpTRLuF16PMHYYN/UOkh8RCAAbxIBBoXGHLYoc5VX+6XIxBJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 12:19:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:19:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Topic: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Index: AQHbjuRQ8HFSiJp+RkOSXEnRVu5xI7Nnl1Ow
Date: Fri, 7 Mar 2025 12:19:21 +0000
Message-ID: <SJ1PR11MB62041E43EAF79D2F89F0F40081D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-2-03683e56006a@intel.com>
In-Reply-To: <20250306-drop-gen-v1-2-03683e56006a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CYXPR11MB8711:EE_
x-ms-office365-filtering-correlation-id: 71525cc2-650a-487f-eb8d-08dd5d724a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Mm12YWdrK3FOSTZucjJQbldHMnprWDcvMEtqZ0NzVktQdDV1VGxuOUFhTFZ3?=
 =?utf-8?B?bUNCWkpEczhJVVo0UXR3WE5YdDQ2NDdpMEN6am1yTjcyRjRPcnh2U2xyR2pV?=
 =?utf-8?B?OW83NlBaa1NhZXFQUGRPTkRDWnBNNUVOZC9iby9XRHFjcm1NVFc4SlF6ZUx5?=
 =?utf-8?B?Z0NVaE05Sm1yQTZ3M3cwN3lWeGw2cys4Q2VwOTllbjEyS2xIcVRpbDFhUDNK?=
 =?utf-8?B?TkJZdVRlUzJGQVRqNGhRVTBiYUVaMDRzbFZaWThrU1lUTHc5S0dmMzZkdkdy?=
 =?utf-8?B?NHZ3UXl0ZFc5VTltNTNVNnZjbEp3dDJPOTNsZTk0clVpaTNiL3Axb2lZV244?=
 =?utf-8?B?cjhkckVaUU8xajR6bm94S1NXNDNMbVBzaE9iU1h2b3NqOGh5MGJLRWpsSG1a?=
 =?utf-8?B?ekNBenBmVXV3SkZiMFRWcHVyYW15SEg3ZUJiNXp1ZlhRYTUwZlY1SGRnNiti?=
 =?utf-8?B?M3VDWmJZOWNMeEozSmZERVZlalA0ZDBadisxcm9TY2Q2ejcvZFJuRGI3K1Vl?=
 =?utf-8?B?ZDdWQmlSeWlTaXhiUWV0U1l2WVpLb3pCbktkeWcrWTdlMVVjNDB5S3Yzckhw?=
 =?utf-8?B?clRmTzk5bWErM2txeU9ZUVF6cEJ0V3pKeWRFbHZFRXV1b2JuVW5DRG9FNFlF?=
 =?utf-8?B?K2dHTSsvenkyK1RENTlBUFI3MTdpTE8rTGZSNHduL3ZNOG1qME83UDEyM2ZQ?=
 =?utf-8?B?VndPUHZGbS9YWitVZlBxMEhxcEFDQ3hpcE5aYWo5YnVQajgwd292OXVRUGM4?=
 =?utf-8?B?dE11SkpXd0Jyc0I1YkY0RHZsMFphYU12YTRrSWtnTkNTWmZIT0xyYUU0OFFK?=
 =?utf-8?B?dXp6YzZJS1NwK1JJRmo3bko1WDlCVituSHFCa0xteGJOc25sMFp0eStmanVs?=
 =?utf-8?B?bmpIVmc2S2xqczREclRzdGd4NU8xcnFyTjNiUXFVcWdMUFFZNUkxaFB0cHVQ?=
 =?utf-8?B?UG9SNmFKUitmY3lzbC9VWjNmQXo0VDhrMnVST3hIdlNvY3V3T0kxSVF0cWgy?=
 =?utf-8?B?dDJnOHhXSjI5ODRZMFhhOFM3ODBSd3JTUmpDYzBjRlNvbXhRM0d1aEVEejlH?=
 =?utf-8?B?WDFDTGU5bEszckQ3Tkk4SGl1d2tEK3o5QkFtUDhjZU1rdGVuOVYxZitRWGNG?=
 =?utf-8?B?V1pkTEd2TUxKcFdwTy9sOHlaZnJ0amJoTXFLYnVKUTFzM21SWUFTVUFrNnJw?=
 =?utf-8?B?cUIrZUR3djJVeVo0R3FaT0V3eWY1TG1ZNGdBbGJ4czRITThwWU15SW9oT1dD?=
 =?utf-8?B?M2hpNXlneTUzOGtXZ1JnYzMwNWxTK1ZCMGdCQytDa1JOV0xSS1BLSWpyeEhG?=
 =?utf-8?B?UkZxTzdSVWtkWURqTDVTZ21jMzdEUTFWaFRpRU1Yd0VzeEw5dUt1NitKT1pM?=
 =?utf-8?B?MnUxY3dKY3BnUjc5QStlQVJ6dERZTG9kZTNoejdNeGNnbmhnZmVheWdXRTR6?=
 =?utf-8?B?MXQ5WU9TNFcyOVBiZnZjdksrY2xENm9qOWZINWwrTUZjSGo3Y1BrT2pKbWc4?=
 =?utf-8?B?NGhpK0c3RWhCSUlnMjdvajg2aS8wVW92SHFBbFpMeVhmdmp2bEVvMGEvdVZK?=
 =?utf-8?B?M0pOS3UveTdpUkhVTS94NTVhcndUOW1yWjVCRTFXVUlVTDkvS0I2NUFvZ08x?=
 =?utf-8?B?TEE3eWUzbXlBbi90VjhEbW5QZGpya1F5V3NxN1o5a3Y3QTljOFBsR3BYZHlZ?=
 =?utf-8?B?QkdrWlpvd01hQ1RWTkk4MG5ScjVxRVI1RTlIMUlocTdLcWNmUXNoYWpSNlNM?=
 =?utf-8?B?TXl1U3JBelRkSThyQ3JtZTZkSzZTclhjb01EU3RQeEhOT2xCS0hpOUxUZCt2?=
 =?utf-8?B?RU5FL2NLdjR3a0lTUHJNWUJvS3pwRDFJVUgycDQ5TGNaSlFVTFQ4Z1Uxdy9W?=
 =?utf-8?B?dEhsYW4zZThjNkpnZUNVVGNJSHUzY1I3cGEyV1J2K2o2cHNNVm9JdHdtWWZ2?=
 =?utf-8?Q?TSDSteMEXPOS3pOnQWx7vaMPLhEUkK7r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWZHRHBnaEhmc28yOHVmWnhQOXNkWTZrMHpBZ0xuNkdpaW43WlJJRC8yaDBQ?=
 =?utf-8?B?M0oxTXRLby9FRmt1TVhEMkZQcUt4ZWlsVnY2L1RZMWNVWjlBNDU5WklsdUR2?=
 =?utf-8?B?cUE5M1NPWkZNZjdxVGJydGVjSThQZTFwL24vSktlZEd5bXFxZnZQMEl2WEcz?=
 =?utf-8?B?dFREQzJSK2Y2dDBhMkoxeTl6UzJuZkZKWGJYRVZOV2NQVnZTWTA1cjZuTVdx?=
 =?utf-8?B?YVdnb1FCSW9zaHF6WUFwaURjem16cDlpTDhBbU1lSnZEQUFGekVxYUdLdjhF?=
 =?utf-8?B?VHNoenpBK0lIK0FrRUkrVU9pK1JmZXFob3FPSnpFNFNSL1BnWTFaSnJ0THhR?=
 =?utf-8?B?RTRDaitYT0Q1cXlMZTJFVHhmUnZzUXJwRzcvRE5veHdMS3VZR3EzblNReVdl?=
 =?utf-8?B?SDRIZWdQZmd6dkZGeWdQa2tUeWVnNXNYVjNFMGdCTS9DUm9FSUk3ZzQ4TENZ?=
 =?utf-8?B?UUFhYkZGVU9iaE1JU0d4bEMwWVJNaFRxMThtMkZwRExkT09wbDhJTG4xbWM4?=
 =?utf-8?B?OEw3SDc4YUFKN2xPTk9UWW41dGMrSEtMdDg5RVAwZFlzQmJCdFhPeWU1bU9Q?=
 =?utf-8?B?b0RtZWJhSS9QQnVhdW5aRzIxVWRjRTYzZGVNc2sxWXBQc09hbWhtZkJGcW9O?=
 =?utf-8?B?SkxPSlhBOGFUMVZpbzdGZWp0d3RWYWoxWXVhcFJwa0tyQUFtb1lWTUVIU0hl?=
 =?utf-8?B?L0t3R0lvOG00SXV4UVpKMVBpYXFLL1dLNVhjQ0k2NE9ncHFXSzdjdGhVZWht?=
 =?utf-8?B?R2dRZi9LOWtuZlRhbGpJbWVNU3RmL0h1cEFqbWY4YTVtMHBEcEFUdnhXVWFo?=
 =?utf-8?B?djdaZFllaEc3MzFyM1I1d1hSRi94d2ZydHU3bHNmQVArVmFkZ0E1bmwwSFg2?=
 =?utf-8?B?WjhpQWdyRkI2TVBsdHpsWEF1OVhaVWE2MGJJK05uU24vWk12dE9XbERkbjBl?=
 =?utf-8?B?VGU1UDVsMm9lZi96cSsrNHVTZkZvTk1mWkEwem9Xc2t4cUp5eEtwYWFmcG1Z?=
 =?utf-8?B?VHJ6c1NIWkxmWnZCQ3NkMnRkVXRLM1RYR2dDWmFlMHpvNGUweHZyNWozYzBV?=
 =?utf-8?B?UG1GSXhKem4xV0l5bnhxSmliL1l2enFvWHhSM2lQWU1SOXloNUJVNGxqb0Vl?=
 =?utf-8?B?bFplWHh6VUVFeFhzZlBXdE9KcHpRUGJWbmtiV1JjZGxYdWlNRjFmUS85YjUr?=
 =?utf-8?B?bjlWUFVabmlFOHUxN2owTG04cjlBbE5tYlBQRFEydjA4aE1BRG1zdVBHclJH?=
 =?utf-8?B?akJVU2VtYTRTa2R4blJPbjEvK0dPLzEwY1llK0NmZmcySCt0Ty9LYnFMK1I4?=
 =?utf-8?B?MFFTbEFkYzZQUDBtYTNRNHpueGx3SXNGRzMvVWhIZisvOExaeXA5REdTMDho?=
 =?utf-8?B?THpmTE1OTFpiNk9sRlNzeHljMnJPam1abm5lYWdPakZ2aVRIOFg1bGRDc3JE?=
 =?utf-8?B?Y2UrcXZsNWVQL091OXZsN3dDdmhHR2U1UTd5M0habmNxd3VyK2dURENDRUc2?=
 =?utf-8?B?bzF2QWpRZVQrZUwybytaSGsvMlJOazJwaUJOamVjSDdkOG54SElxdWtndTY1?=
 =?utf-8?B?N0NEM2lrYUNzeCtTMGUydEpXdGdUMmpCSGtmb01UK0NoUGllUmd2cVY1amFK?=
 =?utf-8?B?Y2lHR1o1amlWVkxHZFpnbDRnMENsTlViY0xQRFh0TDNBaklMMy9pNnhHUXR1?=
 =?utf-8?B?QWIwQ1BTQjljdVBwc1BkazN4SUgweUJwbjVVOXF5U0xzZmM4OFF1MFJ3RG45?=
 =?utf-8?B?RkwwZFBuSCttYlhDMW50N3c5elFpYTM0L3VxSUEvTlBNNFdlOTFYa1lTK1FB?=
 =?utf-8?B?YVNWTXROTjFDYXJiQjZEMHZhek8vT0hxZmFKMXVyNTkvQXJBeDRRRnBZOXM2?=
 =?utf-8?B?dUV1Mlh3UmdTUlZVaEVFR2x3eWpadWJtTlRvdENXbnhQMm8vRUpKRkhqOVRV?=
 =?utf-8?B?ZEJnZGY2enhvTkNROGV1TVo4ZmtVUXBlUGlWSnNYbHUvRmhWZU9lclp5TFFw?=
 =?utf-8?B?bnBhSW1nZUlhWWZJWUo0dWNHdVZ5UE13bWcrM25tSHlGdzVPaDNDNWl6ejhC?=
 =?utf-8?B?TDVMamlPZTdpRThDM0Q2Rk1IdjZmU2hvT3BicnIxQ0JCYjVvWUROWkUzMWMx?=
 =?utf-8?Q?m3RsFUxmtm3eBaXgSbtA1ns6u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71525cc2-650a-487f-eb8d-08dd5d724a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:19:21.0620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJBpO/eEmxjHYOoF593ZGoylhjCpaY0qWbX0P0XI1pQljqnmsIloS1PEYT5VrnoIDn1A3IXPyzgUMBOYi+pdYEAoTVJkbpQ6le7cagBEmLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTHVjYXMNCj4g
RGUgTWFyY2hpDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggNywgMjAyNSAzOjM4IEFNDQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERlIE1hcmNoaSwgTHVjYXMgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL3hlOiBS
ZW1vdmUgR0VOMTEgcHJlZml4ZXMgZnJvbSBkb2N1bWVudGF0aW9uDQo+IA0KPiBUaGUgcmVnaXN0
ZXJzIGFyZSBhbHJlYWR5IG5hbWVkIHdpdGhvdXQgdGhlIEdFTjExIHByZWZpeC4gRG8gdGhlIHNh
bWUgaW4gdGhlDQo+IG1lbWlycSBkb2N1bWVudGF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21lbWlycS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5j
IGluZGV4DQo+IDQwNGZhMmE0NTZkNTg3MDgzN2ZjZTIyNWI1MTUwMzk4NzMzZDFlOTguLjQ5YzQ1
ZWMzZTgzY2FmOWFlZmYyNzkNCj4gOTEyYjgwYTBiMTA5YmM0YTk0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21lbWlycS5jDQo+IEBAIC04Niw3ICs4Niw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpndWNf
bmFtZShzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ICAgKiAgIFRoaXMgb2JqZWN0IG5lZWRzIHRvIGJl
IDRLaUIgYWxpZ25lZC4NCj4gICAqDQo+ICAgKiAtIF9gSW50ZXJydXB0IFNvdXJjZSBSZXBvcnQg
UGFnZWA6IHRoaXMgaXMgdGhlIGVxdWl2YWxlbnQgb2YgdGhlDQo+IC0gKiAgIEdFTjExX0dUX0lO
VFJfRFd4IHJlZ2lzdGVycywgd2l0aCBlYWNoIGJpdCBpbiB0aG9zZSByZWdpc3RlcnMgYmVpbmcN
Cj4gKyAqICAgR1RfSU5UUl9EV3ggcmVnaXN0ZXJzLCB3aXRoIGVhY2ggYml0IGluIHRob3NlIHJl
Z2lzdGVycyBiZWluZw0KPiAgICogICBtYXBwZWQgdG8gYSBieXRlIGhlcmUuIFRoZSBvZmZzZXRz
IGFyZSB0aGUgc2FtZSwganVzdCBieXRlcyBpbnN0ZWFkDQo+ICAgKiAgIG9mIGJpdHMuIFRoaXMg
b2JqZWN0IG5lZWRzIHRvIGJlIGNhY2hlbGluZSBhbGlnbmVkLg0KDQpjb21taXQgNmI3ZWNlOTdk
ZDIxZDJiODBhNDFmNjE5MmY4OWY4ODQ4YzNiMWQ3Ng0KQXV0aG9yOiBNYXR0IFJvcGVyIDxtYXR0
aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KRGF0ZTogICBGcmkgTWFyIDMxIDE3OjIxOjAyIDIwMjMg
LTA3MDANCg0KICAgIGRybS94ZS9pcnE6IERyb3AgdW5uZWNlc3NhcnkgR0VOMTFfIGFuZCBHRU4x
Ml8gcmVnaXN0ZXIgcHJlZml4ZXMNCg0KVGhpcyBjb21taXQgZG9lcyBzYW1lIGJ1dCBwcm9iYWJs
eSBtaXNzZWQgaW4gc29tZSBkb2N1bWVudGF0aW9ucy4gU2hvdWxkIHdlIGFkZCBGaXhlcyB0YWc/
DQoNCkhvd2V2ZXIsIExHVE0sDQpSZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVw
YWRoeWF5QGludGVsLmNvbT4NCg0KVGVqYXMNCj4gICAqDQo+IA0KPiAtLQ0KPiAyLjQ4LjENCg==
