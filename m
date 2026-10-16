Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBB3CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 06:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7048710E1A5;
	Fri, 16 Oct 2026 06:36:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B7110E1A5;
 Fri, 16 Oct 2026 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792132582; x=1823668582;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FQW+i6QfossXIyX/leCbrrACLXpLNlchTPlpjk03B/s=;
 b=d3p1yIuoUecJibFtgnAcdl/acuTAAT88SgKwxBPrl1sF/PIdVUxkbHwW
 HRC7z8tnvas6cyQykl+Fy/+i3sUSV0hfUTz+ccJdPqPpou8wfVk4Qahkl
 i4un4/46EoP4INQOAtJds1W2YmuGO0suYBk6rQx8bAsgpgRCoLmEhdqZW
 cKNaa/06/Z39052MUp8Ha/A/wCtSrpQkiwbcrABYtb7wwNvi2E9IjUWMl
 EQTNTMZvO2z0PxMX4G2NhA3A/Iyq9FBzaa7lLTb1PA0fKkTj2Z1d10BCG
 JEuh9y6Smx4dzBWPxbpaaye/6b9B5WAbvv0f45bQd3u/NsL/da4XHawPJ g==;
X-CSE-ConnectionGUID: jIotCPd+SAqX9c1PWnHS9g==
X-CSE-MsgGUID: H6OK6XjeRZq2YFcXWo9Slg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="797247"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="797247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:36:22 -0700
X-CSE-ConnectionGUID: vHFquDIKSgevJ+JCpH70Uw==
X-CSE-MsgGUID: foT9uDXuQuOyU+juBG12wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1861779"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:36:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:36:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 23:36:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:36:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxR8Y8aeDoV5AUTHbO7YsBVfcHoPwW1zTU1S5F80KUQdfq2L1qsAsfVrwEEYy44IxlQRwQqvaPztsxtvyaz+g87pmmPCPRRl2cSKbB1/O383WxiWQna6Mkgv1oU0PTF9oSBR100+V0Rxw7La79BUmwy6ZHlZZVduDtAwXj2CLeYPxsga7k5zVaEH7ReggYne7htzLRlXobR48o6qblNiKqM29wO73DgvS/GEz1PIetmwIwFSXkErIdl3tZYDiUu9x2VAjST6T+q2nhbD9BQxv57FqFtlQnv1THikiGgVnOBtnRnV3+3BkovP05bqCJszjRkcXN6hwTwAxJD1coWUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQW+i6QfossXIyX/leCbrrACLXpLNlchTPlpjk03B/s=;
 b=VLXMDqU/JFGHX0ZiI8/c0KuR2Mg8Em3UqXtRUGPjQF0C7kECWNXCoZL/kMAK5BST6MIxwUwPsvPYltmEuXrj3+/CLJUB7pMooXi+xTZECwQGQNK7J1usZp8jr3VpyLKVBAuSdVxK3KHXUdRVn5Yjt+o9598Qr6oM3/gwyCY8av5WwPDUNLX51YlLg108ON41jFrfyqmv7lpxZF4kXKxdKOm/jci+hz7ceBUDn4dfV6TMOU4yJQRFxll7VGj8TKkSsrfdODE7mSQsaW2KOZ3QkxI/ttziL/6EY4UE1mWoYGvdIYKUelCw8oUda+zw+2CuKStkcQp1FhjzUQupegw5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MN0PR11MB6133.namprd11.prod.outlook.com
 (2603:10b6:208:3cb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 06:36:18 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 06:36:17 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Topic: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
Thread-Index: AQHdW8o8DVMWgMUYpEeCtbvuRKKZG7b9DR6AgAD2DQCAAbQtEIAAAfiw
Date: Fri, 16 Oct 2026 06:36:17 +0000
Message-ID: <DS4PPF69154114F32AF0B5954960997CCDBEF9B2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261014105306.2761683-5-mika.kahola@intel.com>
 <20261014134601.2846027-1-mika.kahola@intel.com>
 <DS4PPFE901A304F7183CAB8F9D03B7CD119E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <DS4PPF69154114F4EFEA120A0D910DF50FAEF9B2@DS4PPF69154114F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPF69154114F4EFEA120A0D910DF50FAEF9B2@DS4PPF69154114F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MN0PR11MB6133:EE_
x-ms-office365-filtering-correlation-id: 4923ad85-28c5-46a5-a3a6-08df2b4fc87e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|23010399003|38070700021|5023799004|11063799006|56012099006|4143699003|261009223027099003|260925022911599003|260925021311599003|260925021911599003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: Y9MN/cy/mLKnK836lKRX9z6dytrmGRJXTW3BxgrIYIJMZOadFuFK2xk1YwsmO+Ukd9cgNigofCdM+cjyymB3P68UpHF1SP5EiULGwkYZmGxR0huDEz6h5oNaMw7ZJEVrLVZJqWTdk4vSwxHgnqgXtD8UgeRnqxT8C10rewF36mJ1iRkohVlMh6orxjb6Nhj8wXvE0yfDrT7Rpz02D4LeMlq1Smfh6oS9g7tj/P2EJ72OY5eyf4CtzibfByC+ACsYj8TlXP1NHCzoWlP5QPb7HCFD4X7pwv6rl6d69YFbbYBxF2zpuzPnk9YdL0+E+oeszrh4eJtGFmbqSrwVXfq8gd2KDVh5mjJrC6A6RyUM2+8t5vb4rwNYcuZTaKNQ4zGFOCPjMvQGiuR8Fs5HrtK6viuH1mkUI+WmqxEBIvmQpwTs8Xfc9RHbhJHTh4pPH7Jl8KnUUNQa6iw13YVcPahafLUW8hkRAOnw1iEW9i30vORdFKX4+G8v+sGIpCYLF2eFxdKp2IWGh3Onz/mrMRo9s6KSwsMT1+KNILRqoh2YST1u+6yNMvpss3/Us5m8+jf1hidDFG+Bp216Gde4/5z5JABsE4Jauk0eYo7zq478Pzb4yxzFbEPZmyLjaymanMeen2mo+bgO4BSidChJeFeSieSUNhH1+QIpKfF+6bHOUoNc+21V5uTy3YdoMMisr89cuc+N6F5fvzHRcYRNai2G3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(23010399003)(38070700021)(5023799004)(11063799006)(56012099006)(4143699003)(261009223027099003)(260925022911599003)(260925021311599003)(260925021911599003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3Ntbkt0NThrUlRCNXRwMEhwK0NKaWU3V0NNQ1BmWGNuUVFzQUFyQWJub3RM?=
 =?utf-8?B?aWhXL2xMQXdnKzlKKzN5RlFMWkNwRUhWN2FHZ1pZMXl3WDNPbE9PdkUxTitl?=
 =?utf-8?B?OVExcEdONmREMWw5L09mMXBDb241OFU0UGVJKzBDTkU5N2oza3o1M2ZFWVBW?=
 =?utf-8?B?aUhESTJQRWI4bzVJQ0RFeWVGMjRQQnAxYVhEd2lsZlhBcmt4RGp5L0pDMTRs?=
 =?utf-8?B?cE5aUG0zUzJPSS9TaGFNcXY2Ull0RzF1NzJUcVJvQWtsTkMzRmV0TXg0VWxw?=
 =?utf-8?B?MGhQSHFpTGVnZkR4Mm5uYWkxeVlacjV3TlBJclo3dU1SeHU4RW5pckR3Skx4?=
 =?utf-8?B?RCtudmhGNXdsYmlEeWZKaEgyc2dtUmtiZkN1TndQSEtjY28zbVZUV2QxMmxs?=
 =?utf-8?B?bG5CQldmYnJXNk1SUkhNemRyeXhYSmxrNkkwWkk1OVNuSjJBZHJoQVdESzUz?=
 =?utf-8?B?cEpFNHZiMC9DZnMzaXZqT3IrelBBN3A1RG95dGVvTWZiaGtDRERndnlQYkhD?=
 =?utf-8?B?OGRSV1d0akk5cG1tVWtaeDE0eDhhazhhOGZycW1SeWY5REE2MlBGQ2JWU1Na?=
 =?utf-8?B?QzZCYnhFaVlwY3R4YzhhV3o1SFdIQmJCbXI3Y3hZcmlmYlBOTDlVVjViNWVk?=
 =?utf-8?B?YjRNWkhRcGpScmhZR083OGtnSmpFNy9DUnoxVUQ2S0lTZGkxU0laQW11WHhO?=
 =?utf-8?B?VHJNeXR0MmM2S21mYU9Jb2cxb2tTNldwN2FBd2wwMEwvZWNXUVVoZ0J5TFBm?=
 =?utf-8?B?UjlxTDdUVmhqbjVVcjRHVUpjaHlkNE1tbXlXRHZnZlJScUFsdjhoSElESm1W?=
 =?utf-8?B?aStNY1RrU0pQcWxqUFdCeWIzUkNoME1JOFkwYyt5dWhwdWRIdGhHa2RFUm80?=
 =?utf-8?B?SWx4TmcwT1NYa05BdmZlTk5ZbWlPT1dsdFRybDNuRC9TcmVVa3BnRlloaE5v?=
 =?utf-8?B?WXM5czlCeXhlaXROTGVnNzFJNUczM2FXcEprRDc5MElrYVF5S0pPaElhVDhL?=
 =?utf-8?B?ZnY0ZzRmc29Ra2ZZL01UeTQwQUtVMU1WYnNPMEhaa2YwU01uaXVvMzU2QnlM?=
 =?utf-8?B?emROOXZoWEtua3g5SEtkbTZ1cE80NXpaeTByanNIdFNLSjFCS3lMeU1wSDFQ?=
 =?utf-8?B?US85MzBtelkwTWpWdzFkeUoxbzU5cGIzWE9hUVNQQ2N0TjBMcmFzY0VWUmt2?=
 =?utf-8?B?VHNzQkloMlhXNWttbmVLUlN5LzQ0RStjeU9NaTVnN2NLL2FiWWtKejVGeGhh?=
 =?utf-8?B?TTh1OTE0TXBheWVkUHFqU3NmcXpDcWN5NlhsZGN4NlozQkJ4YnpvWUlsMWVD?=
 =?utf-8?B?cmMzbEozNkdDb1l4bXNYR2YzRW1nRnJld3NjYVRaRHRjOUgxc1hoMTlUQlIw?=
 =?utf-8?B?TVNkUFN0anJNd1RwT21iQXAvejlMdkxyNHVQUm1sWHB5djQ1cmw3bmF2VEov?=
 =?utf-8?B?SWUzRFR5a2UyWTZ2REt1a3J1T2owbDFJdGpNZmJvNDU1QTErR0taTFJMYU9n?=
 =?utf-8?B?SU5NakRpZE1IWUEyK2VGVDN6c3ZnaFBNL0s0YjVzaGxSWnE1YUNzMzY3aGVT?=
 =?utf-8?B?WTJYemJoaE9VQ0VMRXN2N0xBSThUdU5QVDFWS2pPRVVjQVBYbWJ3WDdXc2hI?=
 =?utf-8?B?aEVYc040aFBaWmwySTRRWjgyNWgySkEzUkNMeEQvbXFHYUcyaWlha1dDa2lj?=
 =?utf-8?B?dEwreW1XSVRtL2ZxMlJYSnBXWUFTQy9DREFlMXRoSzRjRTVWbVllV2pGc1Bp?=
 =?utf-8?B?Y1dYYXRJZlBGZzVvcHczdUIrelNTSy9oaFV0VHdHalROdUxkQ0JyNVZWRXQ0?=
 =?utf-8?B?WHR4NlhwYlNQaWVEMVNZNWg2SjlFSEFOMkx0b21ka0hmYzhqdFNXRkxRY1Mv?=
 =?utf-8?B?RVY4QWk4RDVsV0UwQlp4NHN4ZmtwQjRYNFoyb1FBYmpmQ1FENFAycUZBbzcz?=
 =?utf-8?B?NlYzM0NNVUNHQXZyYmV1MFU4ams1bHUyRHdtdVd2Mk1aYUhLb0pyQlc3WVgv?=
 =?utf-8?B?TEpCZDc4T3ROQktiOGlWWUJuYmczOXJZS1Nwb0pSWDBxMHozZVh6c1pPUzA5?=
 =?utf-8?B?NlNPdng5RytlOS8zbXhsL01HeFV1YkNVbU55L1I5djM4OVpWLzhzYlRTb0Iv?=
 =?utf-8?B?MVlXeU1rdkhyY3Nrb0dxWW04ZjIzSGdyNUVyc0lBV1FRZ0R1OUZGYjhrbURT?=
 =?utf-8?B?N0tHU3hqQ1VQRkVIY3p3OG5qSzI3cXllZUZyaWY2MFpqNEczR2k1aDV2Skhz?=
 =?utf-8?B?ejFUZXdMODExNndKQ0hJbXoyTWJIeXpiL3JJTk5XZkQ4SGxmbHdnL1lkbDJP?=
 =?utf-8?B?SmU5QlFVbk15Y01hUDFVTzNnaGlRTVRuei9NSmdNVE5PVHF6cU9jQ1crcGNH?=
 =?utf-8?Q?/EfMWJq5v6o1hiTkfcSkiMAUyTSqDJ9AdMPmf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eWalQO3AHmsXadd6BV1K8I2AlV/m00HmcODWi6cZI7l/CdqX+QZVWMdDzSHE4M85bCUQrcGOaLj9W+fBnTXefH7KaW19ZfzkUMvmJyoft2wXz9Gy2MOVBNfH5TF+U+4szdPzfob6R+qLLUm22ng0Ib4TQx2JROYVrI0MuWa7cFw/dnacvO9hhogL7FjzaUkTZDMObrejV8zvXLbddOPz04xEzfHjz0oZ8XR+07YD69+vsBuBUQCKjnEybqc8/tKfqelMEgXkxA5nafKN/PZMkYl3AicDlVnDkBbBCk3TpuiUwjOTkrPXjeOSXiP5cwJ6lLkknHS4lARhOaMSiWPIIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4923ad85-28c5-46a5-a3a6-08df2b4fc87e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:36:17.5284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ThcGcnubc3Nnk9JI5CyU9hYxNlfBW8jPFHlcsHSeRuIO9of/yvSICFUvHvu3QYldz65Nn0rZj0oBt24+3+KzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYWhvbGEsIE1pa2ENCj4gU2Vu
dDogRnJpZGF5LCAxNiBPY3RvYmVyIDIwMjYgOS4zMg0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1
cmFqLmthbmRwYWxAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIg
NC80XSBkcm0vaTkxNS9sdF9waHk6IGFwcGx5IHRoZSBQTEwgcG93ZXIgc2F2ZSBXL0Egb24gTFQg
UEhZIHBsYXRmb3Jtcw0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZy
b206IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiBTZW50OiBU
aHVyc2RheSwgMTUgT2N0b2JlciAyMDI2IDcuMjcNCj4gPiBUbzogS2Fob2xhLCBNaWthIDxtaWth
LmthaG9sYUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogS2Fob2xhLCBNaWthIDxtaWthLmth
aG9sYUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiA0LzRdIGRybS9pOTE1
L2x0X3BoeTogYXBwbHkgdGhlIFBMTCBwb3dlciBzYXZlIFcvQSBvbiBMVCBQSFkgcGxhdGZvcm1z
DQo+ID4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiA0LzRdIGRybS9pOTE1L2x0X3BoeTogYXBw
bHkgdGhlIFBMTCBwb3dlciBzYXZlIFcvQSBvbiBMVA0KPiA+ID4gUEhZIHBsYXRmb3Jtcw0KPiA+
ID4NCj4gPiA+IFcvQSAxNDAyMjA4MTE1NCBjb3ZlcnMgUFRMKywgYnV0IG9ubHkgdGhlIEMxMCBQ
SFkgc2VxdWVuY2Ugd2FzIGV2ZXINCj4gPiA+IGltcGxlbWVudGVkLiBQb3J0IEEgaXMgYW4gTFQg
UEhZIG9uIGRpc3BsYXkgdmVyIDM1LCBzbw0KPiA+ID4gaW50ZWxfZHBsbF9wb3dlcl9zYXZlX3dh
KCkgaGFkIG5vdGhpbmcgdG8gcnVuIHRoZXJlIGFuZCB0aGUgUEhZIHdhcyBsZWZ0IGluDQo+ID4g
PiB0aGUgcmVzZXQgcG93ZXIgc3RhdGUgdGhhdCBibG9ja3MgUzBpeC4NCj4gPiA+DQo+ID4gPiBB
ZGQgdGhlIExUIFBIWSBzZXF1ZW5jZSBhbmQgZGlzcGF0Y2ggb24gdGhlIFBIWSB0eXBlLiBUaGUg
UExMIHN0YXRlIGlzDQo+ID4gPiBjYWxjdWxhdGVkIGZyb20gdGhlIGVEUCB0YWJsZXMgYXQgUkJS
IGFzIHRoZSBDMTAgc2VxdWVuY2UgZG9lcywgc28gdGhlDQo+ID4gPiB0aHJvd2F3YXkgc3RhdGUg
aXQgYnJpbmdzIHRoZSBQTEwgdXAgd2l0aCBpcyBtYXJrZWQgYXMgZURQLg0KPiA+ID4NCj4gPiA+
IEJTcGVjOiA3NDE1MQ0KPiA+DQo+ID4gU28gdGhpcyBic3BlYyBkaXJlY3RzIHVzIHRvIFhlMl9M
UEQgV0EncyBidXQgMzUgaXMgWGUzcF9MUEQgYW5kIG9uIHRoYXQgcGFnZSB0aGlzIFdBIGlzIG5v
dCByZWl0ZXJhdGVkLg0KPiA+IFNvIHdoYXQgSSBhbSBjb25mdXNlZCBhYm91dCBpcyBpZiB0aGlz
IGlzIGFjdHVhbGx5IHJlcXVpcmVkIGZvciAzNSBvciBpcyB0aGlzIGp1c3QgQnNwZWMgbm90IHVw
ZGF0aW5nIFhlMl9MUEQgV0EgdG8gUFRMLFdDTCBvbmx5Lg0KPiA+IEJlY2F1c2UgdGhlIFBIWSBh
bHRvZ2V0aGVyIGNoYW5nZWQgZnJvbSBOVkwgYW5kIHRoaXMgaXNzdWUgd2FzIGFjdHVhbGx5IHNl
ZW4gb24gU05QUyBQSFkuIFdlIHdpbGwgbmVlZCBtb3JlIGNsYXJpZmljYXRpb24gb24gdGhpcy4N
Cj4gDQo+IFllcywgdGhlIEJTcGVjIDc5NDgwIGRvZXNuJ3QgbWVudGlvbiBMTkwgbm8gbW9yZS4g
TGV0J3MgcGxheSBzYWZlIHNpZGUgYW5kIGRyb3AgTE5MIGFuZCBjb25zaWRlciBvbmx5IFBUTCwg
V0NMIGFmZmVjdGVkLiBJIHdpbGwgc3BpbiB0aGUNCj4gc2VyaWVzIHNvIHRoYXQgaXQgYnJpbmdz
IHRoaXMgV0EgYXMgcGFydCBvZiBXQSBmcmFtZXdvcmsgZm9yIFBUTC9XQ0wuDQoNClNvcnJ5LCBt
ZWFudCBOVkwgaW5zdGVhZCBvZiBMTkwuDQoNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEN
Cj4gDQo+IC1NaWthLQ0KPiANCj4gPg0KPiA+IEFsc28gRllJIEkgdGhpbmsgcGF0Y2h3b3JrIG1l
c3NlZCB1cCBvciBwYXRjaCBvcmRlcmluZyBmb3Igc29tZSByZWFzb24uDQo+ID4NCj4gPiBSZWdh
cmRzLA0KPiA+IFN1cmFqIEthbmRwYWwNCj4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBL
YWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyB8ICA1ICsrKy0NCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jICAgfCAyOSArKysrKysr
KysrKysrKysrKysrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9s
dF9waHkuaCAgIHwgIDEgKw0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcGxsX21nci5jDQo+ID4gPiBpbmRleCA2NWNjMDI4YTkwZGEu
LmRmNDE2YTA1ZTY2ZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBsbF9tZ3IuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcGxsX21nci5jDQo+ID4gPiBAQCAtNTI0OCw3ICs1MjQ4LDEwIEBAIHZv
aWQgaW50ZWxfZHBsbF9wb3dlcl9zYXZlX3dhKHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ID4gPiAq
ZGlzcGxheSkNCj4gPiA+ICAJCWlmICghaW50ZWxfZW5jb2Rlcl9pc19jMTBwaHkoZW5jb2Rlcikp
DQo+ID4gPiAgCQkJY29udGludWU7DQo+ID4gPg0KPiA+ID4gLQkJaW50ZWxfY3gwX3BsbF9wb3dl
cl9zYXZlX3dhKGVuY29kZXIpOw0KPiA+ID4gKwkJaWYgKEhBU19MVF9QSFkoZGlzcGxheSkpDQo+
ID4gPiArCQkJaW50ZWxfbHRfcGh5X3BsbF9wb3dlcl9zYXZlX3dhKGVuY29kZXIpOw0KPiA+ID4g
KwkJZWxzZQ0KPiA+ID4gKwkJCWludGVsX2N4MF9wbGxfcG93ZXJfc2F2ZV93YShlbmNvZGVyKTsN
Cj4gPiA+ICAJfQ0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jDQo+ID4gPiBpbmRleCBlMDVmZDIzYjhhNjUu
LmQyODZkMzNhMDNlYSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gPiA+IEBAIC0yMzEzLDYgKzIzMTMsMzUgQEAgdm9pZCBp
bnRlbF94ZTNwbHBkX3BsbF9kaXNhYmxlKHN0cnVjdCBpbnRlbF9lbmNvZGVyDQo+ID4gPiAqZW5j
b2RlcikNCj4gPiA+DQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+ICsvKg0KPiA+ID4gKyAqIFdBIDE0
MDIyMDgxMTU0DQo+ID4gPiArICogTFQgUEhZIHBhcnQgb2YgdGhlIHNlcXVlbmNlLCBzZWUgaW50
ZWxfZHBsbF9wb3dlcl9zYXZlX3dhKCkuDQo+ID4gPiArICovDQo+ID4gPiArdm9pZCBpbnRlbF9s
dF9waHlfcGxsX3Bvd2VyX3NhdmVfd2Eoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpIHsN
Cj4gPiA+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5
KGVuY29kZXIpOw0KPiA+ID4gKwlzdHJ1Y3QgaW50ZWxfZHBsbF9od19zdGF0ZSBod19zdGF0ZSA9
IHt9Ow0KPiA+ID4gKwlpbnQgcG9ydF9jbG9jayA9IDE2MjAwMDsNCj4gPiA+ICsJaW50IGxhbmVf
Y291bnQgPSA0Ow0KPiA+ID4gKwlpbnQgZXJyOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoaW50ZWxf
bHRfcGh5X3BsbF9pc19lbmFibGVkKGVuY29kZXIpKQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4g
Kw0KPiA+ID4gKwllcnIgPSBpbnRlbF9sdF9waHlfcGxsX2NhbGNfc3RhdGVfZnJvbV90YWJsZShl
bmNvZGVyLA0KPiA+ID4geGUzcGxwZF9sdF9lZHBfdGFibGVzLA0KPiA+ID4gKwkJCQkJCSAgICAg
dHJ1ZSwgdHJ1ZSwgcG9ydF9jbG9jaywNCj4gPiA+IGxhbmVfY291bnQsDQo+ID4gPiArCQkJCQkJ
ICAgICAmaHdfc3RhdGUubHRwbGwpOw0KPiA+ID4gKwlpZiAoZHJtX1dBUk5fT04oZGlzcGxheS0+
ZHJtLCBlcnIpKQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gKw0KPiA+ID4gKwlkcm1fZGJnX2tt
cyhkaXNwbGF5LT5kcm0sDQo+ID4gPiArCQkgICAgIltFTkNPREVSOiVkOiVzXSBBcHBseWluZyBw
b3dlciBzYXZpbmcgd29ya2Fyb3VuZCBvbg0KPiA+ID4gZGlzYWJsZWQgUExMXG4iLA0KPiA+ID4g
KwkJICAgIGVuY29kZXItPmJhc2UuYmFzZS5pZCwgZW5jb2Rlci0+YmFzZS5uYW1lKTsNCj4gPiA+
ICsNCj4gPiA+ICsJaW50ZWxfbHRfcGh5X3BsbF9lbmFibGUoZW5jb2RlciwgJmh3X3N0YXRlKTsN
Cj4gPiA+ICsJaW50ZWxfbHRfcGh5X3BsbF9kaXNhYmxlKGVuY29kZXIpOw0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICBzdGF0aWMgdm9pZCBpbnRlbF9sdF9waHlfcGxsX3ZlcmlmeV9jbG9jayhz
dHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwNCj4gPiA+ICAJCQkJCSAgaW50IHByZWNvbXB1
dGVkX2Nsb2NrLA0KPiA+ID4gIAkJCQkJICBjb25zdCBjaGFyICpwbGxfc3RhdGVfbmFtZSwNCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3Bo
eS5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgN
Cj4gPiA+IGluZGV4IDM2OGNlZWRiMWUwYS4uYTkxODAxMmI3MWU4IDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuaA0KPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuaA0KPiA+ID4gQEAg
LTQ3LDYgKzQ3LDcgQEAgdm9pZCBpbnRlbF94ZTNwbHBkX3BsbF9lbmFibGUoc3RydWN0IGludGVs
X2VuY29kZXINCj4gPiA+ICplbmNvZGVyLA0KPiA+ID4gIAkJCSAgICAgIHN0cnVjdCBpbnRlbF9k
cGxsICpwbGwsDQo+ID4gPiAgCQkJICAgICAgY29uc3Qgc3RydWN0IGludGVsX2RwbGxfaHdfc3Rh
dGUgKmRwbGxfaHdfc3RhdGUpOw0KPiA+ID4gdm9pZCBpbnRlbF94ZTNwbHBkX3BsbF9kaXNhYmxl
KHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyKTsNCj4gPiA+ICt2b2lkIGludGVsX2x0X3Bo
eV9wbGxfcG93ZXJfc2F2ZV93YShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2Rlcik7DQo+ID4g
PiAgdm9pZCBpbnRlbF9sdF9waHlfdmVyaWZ5X3BsbHMoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRp
c3BsYXkpOw0KPiA+ID4NCj4gPiA+ICAjZW5kaWYgLyogX19JTlRFTF9MVF9QSFlfSF9fICovDQo+
ID4gPiAtLQ0KPiA+ID4gMi40My4wDQoNCg==
