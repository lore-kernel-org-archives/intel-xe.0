Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38358C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E277F10E595;
	Fri, 16 Aug 2024 06:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EL7yeOVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB58610E595
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723789541; x=1755325541;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZmBwR3dPLg2fm67E9n2D67m8lHqSf0tiJU47ciwAcSQ=;
 b=EL7yeOVtdbkBjZevdLnZdNXUj0IEOm5GwrlcZdkDdFEAjBczDbbcePLD
 jqrKtViO2jWZKds8PM1kMCBQqOIUy9joetG3s0IDP2HNliN1z3hEUcu2n
 egYktTJ4WW5ZDQ105YIYrmn8DJlw/39cjxT9X75VruoP3aM4HveTOANzR
 zUfrrgd68Nx8qEHGRr/7FhNd3EXDVCEObUX0bBebRnU8i6xDmWL+l1EVD
 2TKngVzggyq1eTN49CuZJvRJShv3wZv3WA9u7R87JXBMgOXAPRYfO4O2I
 qpHUl2nB3c/sd/1H2FIyQV6emDhVdvUSSZ1zQ/vrur/kMoHiEJud6VeSO w==;
X-CSE-ConnectionGUID: RIapVRVUQ/yAosMDv2gRWQ==
X-CSE-MsgGUID: atKWZ0g4Sk+hBWU5gjTBaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32750583"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="32750583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:25:41 -0700
X-CSE-ConnectionGUID: Vze/pAeyRKe2KdUKFTYbjA==
X-CSE-MsgGUID: xvy1xy0jRjqCEj1+JXnjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="97098133"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 23:25:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:25:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:25:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 23:25:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 23:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab1jF7ewF52gub6uKF7y3ljJcKsfcyq2kpZ7OtzbRMmk8tR/gPG6KuDCl8n9+ZJh434KgNxgygd9lKACkidhCsy1ivEjgwM5YRB34c8drCaOTbZxeAiPHm/p1Ws9Y2jOp7QLjelSCU3UY04zjEkiwlgEjqRcGNxmVr2oYJn3ZL+0mxr/V7rClIsV2WJzsbPqsLiSPnwgTmqxeK8S9JrXCQoHhvfgPoZApvhpP50mT5boc6X5jYoIdYRujosA1Xtk/U3/snOw78wUlWL3AlhdHtPdSp7i/jXhMrgp16vjjd3fpXI79PnurTEtSMPgMZp0gbTvVTfr0UDXIFX6VYnpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmBwR3dPLg2fm67E9n2D67m8lHqSf0tiJU47ciwAcSQ=;
 b=gGDZDqL9rwEcNzuFBH5JcLIbYLoh9t6ojJUn39e9xkHKOVxEJn7cSEIFsCiiTa+XavkfIATCzc/YHlMC5TsLpSfjEewwl41zI3mndYbDk7y1Rmqq7kkRRKUcK7dlNuXMEfxuvHNgrrVbfUE7/bWWlSWZjwAHkwUZBcZGKZfkEeNHoug6DFK4PhZbldnaSGsJfc09zRbXmlJlHG/6LBdz1To5nWwzfIIw8AHTkbJSyD34qkmDD6uZOifwgrJb3YFQohpTj1TDnmtwdGigIBN4t8WFyZ0BBajSJSo9opk2tZMtKfV/6I6tHNaeuW1ohidrqZaLFZKxY73P1SIqEQlanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 06:25:37 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%3]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 06:25:37 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/fourcc: define Intel Xe2 related tile4 ccs
 modifiers
Thread-Topic: [PATCH 2/3] drm/fourcc: define Intel Xe2 related tile4 ccs
 modifiers
Thread-Index: AQHa7wFIvTmQPgL6Mk+G8d3GCQP1D7IpbBzA
Date: Fri, 16 Aug 2024 06:25:37 +0000
Message-ID: <MW4PR11MB705498C843B6CB31BF83D493EF812@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
 <20240812201549.2014168-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240812201549.2014168-3-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: 2989a5de-f680-4dc6-ab0a-08dcbdbc3e19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d2gvNVpQQjNnNUFhOGFYK2YvdDhLUW1zcjhjVVlvM05HRHpCUlJ3QkpYcldW?=
 =?utf-8?B?VmppY01yT3k1b3BpMzFOODhaY0ZvZ1hXeFQ4NlE1TmpucnZXWktzL21QaDlG?=
 =?utf-8?B?ZHh0YzNNMlNnQ0lhMjk5RGg1VytlYlpXeEtmZmhUUnNDMWphdTJXNGw4TWpQ?=
 =?utf-8?B?OVRRTmJHNzY3Mjc1ZGdjUW1kLzh4d0RUaFVMYmM3dFlGbVVYWFIzN2xzN0VF?=
 =?utf-8?B?NlZvK1BHaUlEUjJ1cmpvM2cweUNzTmJsU2ppTEUrSUoxMjhEWDFvQmVaeVdD?=
 =?utf-8?B?SWw5bjRFTjltV0F5bWdBSDhFWXlpem02SlB1S2RTdWFnNytyNzR6NzVhb3Bo?=
 =?utf-8?B?YjV4ZVNzbURjWHZTSUY1WWhnUE5JZmlkVW9BWXV3Q3paWFZZM1RsanU3Z0tI?=
 =?utf-8?B?UW05a2N1SkVMbXdHSC9IT1o2eFRTMUZvYVI5QkxZbkhTSStxb3paa09vU242?=
 =?utf-8?B?MkoyMDNiRkZraHo3TGI3ZVV0L2lTNVNVRkkxM0RJUW9hcjFhZTFVY2xzYjdU?=
 =?utf-8?B?VHR3Wk1BNk4yWWgyUXZBK3cvVjJUOG0yVytPSXFxMVFJa3FzU0ZZdDdUUUg3?=
 =?utf-8?B?SkRTK1djdHZvWFBFdCtnTTNaVWFvc0x3UHZIcHBzSWx5bHIxdVJKUU1hUzho?=
 =?utf-8?B?QmlMRE5TeG55VDVLd3V5QmZlNDhScWhsVUFKR0tncTJoN2ZvZ3JmcGE1eGFW?=
 =?utf-8?B?bTNydnhxOHI0NjN4MHovdjlVS1h5WGhmNDJIblp3Z0RHb2F0Z0R4ZTBXbVBU?=
 =?utf-8?B?WDBHc0hiMms1dkFra1BadHVXNFlNNlpaZ0N5UW1YRGVtZEVldjc3Z2w1ajBH?=
 =?utf-8?B?Tzk2bGtVK3BWMGg0YnZXaGxxZXJ4Q2J5KzEyWGtERWlzekZWNGI1VHAzN3px?=
 =?utf-8?B?cERtb2F3amYrODhRdXZIUmErNG04UlRUOWZpWkJHL3p4TGdLZWl3NndQRmhr?=
 =?utf-8?B?anVKdCtHL1J1bTMyYk1YUy9CQ2pvS09FZy8wdG4yd0NOYk9uUENzWVlUUWc3?=
 =?utf-8?B?dm1kY1owbjNrNVVPRm9zang3aStTM3c2VXBBckM2RXJyNkwwY0lKbGFRWnZ4?=
 =?utf-8?B?d1NOTlQ4aytQcEhwUm5zSnNqcnBpMmZrNGdyYlE2RHRqQ1hHK3FhTmw4NFVE?=
 =?utf-8?B?ajZtc0wrSTNHejdxdGhpN3Y2U0tuOTNheEoxb0tmT3RhdXpGSkNiUmNrWWF1?=
 =?utf-8?B?ZllCZXA3TzM2ZWZ2MkNJRUJHYXlRUS9CRk1QRWRPd0c3aVRUV280OThHUUt3?=
 =?utf-8?B?MGl5bm5nZnYrL3cra1J2UVk3T1lEWUgzNWRxQXZtdGlxVDQ0NjA5dWdabkk1?=
 =?utf-8?B?eUJ4WHVIS3VZQXo4NDFtV0MyaE1WNU52SVN5NDI2SE1VVVdHdzA0UVgrOWJt?=
 =?utf-8?B?a0hXZGJ5NzAvTWhwNmR6M2tmZW5VbTdYK1p6NlZGOHVMRGtxamNEY3dOdnpO?=
 =?utf-8?B?c3NlWGlsMkpYVDg4ZTRiZzQxNkpmVkpNWG1uYUlyZG9xZFc1VzdrcDRoZ1k3?=
 =?utf-8?B?a01HdjkzUTU5Y3BPMElzWW80VTZzS1BGYzhnSEdoQ2o2WHBGcTJmRElrV1Ar?=
 =?utf-8?B?cjZnKzljYjhMU1hTODJUQU1SYUtlL2poQjZQck1ELzZiQ0taeUJqSGVLUjNk?=
 =?utf-8?B?bkQxQW9hZklUdm1jSGdHelg4ek14d05BNVFmdW1Ud3VXTVltZEp3SitUcVVW?=
 =?utf-8?B?dXlQOTNvYlIwK1ZGN3pkSEVSczFEditZQ0U3NWlMay9FaTNtNjZsU1k2OHpu?=
 =?utf-8?B?NGxIR0VoZ2FhQkhJY2s2Z2JmTzBWZjVjeEt4YmF3ZFdkd1lkd29Td1luUm1R?=
 =?utf-8?B?OUlUVWlUSEgxUHpMcWRIaTVMNGl6ckZIcjJydlpIWFJKbGRwc0V0MEpOUEtq?=
 =?utf-8?B?TG9lSGh0QUxHYXl3Q1Z3STcrY2h4QUQ1a3N4QTl6NXd2U2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFkrTFhZU3ZnTThqUFg1dHR1UmtRVW5vYWhLVnZPM2dRcjRkbU9VUTEzWGcx?=
 =?utf-8?B?NTlSTEtXY3ByU2NxMXJyUElnbExoenRFcXRnTEZrVHlKQUM4M2l6U0c0M1Zz?=
 =?utf-8?B?OUJ5RmE0RVl0aUhkWHlMUkNvcTNjYkZZUmcxZmtteU1TaXBZSm5Zbjl1U0xv?=
 =?utf-8?B?cHFWZTEzNlRZUmNzZ25LYnlXUnEvdUZ0N0JySTNkcU5DOVF6UEh4aEQvTFpr?=
 =?utf-8?B?ZU9xemhkdUtFMmVQNEtGK0FTNjMyOXdUclNFQmUxcFRMVkkwQU4ycFRrL2o5?=
 =?utf-8?B?NXU3ckVzREUrU0dRejdSanVWdGgwdXVCa0VnZnJwekVkaFdldXFPUm5sR1pU?=
 =?utf-8?B?M0dPeFppaXZWTU5YMWhYM1IvR2JZUzlpNndxM0FQMzZQUmxreTZrMnIyczZO?=
 =?utf-8?B?c1J1c3UzdVJlYm9YR2dlVk84Z084MzV2NE5EWk1laDJhRzdmSXhRcTBZeGpO?=
 =?utf-8?B?TjJEdWZOVHIzY2ZlRy9OQXkrOUQveHZYSklSSVhnb1FVTTR1c1BINENkQUlB?=
 =?utf-8?B?U0Qvc2owNnJ5WVVTdTM2aVFJQkEvYk5mRW5lTXNwSWwyNDh1SXRzczRkekpY?=
 =?utf-8?B?d0JZSy9jSytUeDZQN0ZjS1BMQi9URWRmSG5Oc3poQnJrb2xMb1loRHgwbDJY?=
 =?utf-8?B?bTZKMGxrVXN2UFFCU3hkRDBIQmNzVmhoVVNTSGxCbzJOS0J6endZUE50QUFW?=
 =?utf-8?B?cFppWENRVjN2ODBQV2dkenFwRitBak5rWWk5VFB2NHV6RVlNNTJKU2JsNDNj?=
 =?utf-8?B?NXFQRjB3b0h1UzU3N1BkZXNNTGdremhhc3RqSFlMTlc0dHFWTFc0dlg3UGIx?=
 =?utf-8?B?U3dJTHR1K1FodytYVEp6djZEN3Y0QjJvR2xoOXdqK3ZvWGgzUUF2U05MN0Fy?=
 =?utf-8?B?OGxCT3I2Wmo3MjBodmc0TmlhSnViV25zakFkSGM5OUowZGVwc0hVOU04emhR?=
 =?utf-8?B?eUpJUVo5emxkRzhoMXE5b3RpQVV4WTNZaGtvMTVUTjNHTUthN1Npa2QzRENT?=
 =?utf-8?B?QTRwN1ErdTFqdzVNUlRMOTdueWlwNUI3MTh2L0x6OVJySFpyM2V0SHdwQmxV?=
 =?utf-8?B?MitYM3ltbzh5Wm14dWpLWTFqY09hK3YvYzNwYVFYcjQ5RGIybCtKR3JEbjFT?=
 =?utf-8?B?RStnQmMxWlpGRW5IbDNRMlJWeXBYRWNDVjU4dlF4cldPSjBUVVZ2WXNRaWJ3?=
 =?utf-8?B?MEFSUGlMNmh6S3JIT3UwdWN0czdsNlFzb1hFeUw4Wk9mWFZ4YmxVTk9qbDQ2?=
 =?utf-8?B?SUtJZVB5SlVlZW5yTkZ1N0dGaHF2N3loWGoreHhyMUpTRGtDK3RwZFlpcU9t?=
 =?utf-8?B?Wng4S3JlMjZjbm5vd0pvMEF2c28vQmI2akhhUFVESGFSekVhaFp1TTZxRVZB?=
 =?utf-8?B?dWp6N0I4QXloREFXZmhOZnN3WFNEcDBpRFB6WDFJMU85cW83Tm9rd25UK05J?=
 =?utf-8?B?WmxKZEFVdEdVNmJQWmFFVnJSTFJJZXRDNDNaYjRvS0NDK21lSDFwKzh0TUtl?=
 =?utf-8?B?UHhleHpqNnV1SlplVU5URStzQTFTWUdCRmRUK1h3L3VlRFc1elJGWkZFSnc2?=
 =?utf-8?B?MWQ5SlBHM1JWOTlLWU43ZXhaczV4M1hjd3pOVFk2amZDVS9KTUo3QzBoZGZE?=
 =?utf-8?B?STVKMUFuWWZRd2gyaUtuNUFSVy8xT2J4QzRyMVo0ZEx3Qnh5L1J3cGVzN245?=
 =?utf-8?B?U055ZkJpY0JzTmdxVk5DMXc2Y1A0M1pxaHVGUXhWV1RBYnlkalJ6ZkIrbGhU?=
 =?utf-8?B?OGNudHI4akhoSWpxQy9OOHBLRkx2TEtNc21tWHVOcStldEk4bkp4eHdOYUFQ?=
 =?utf-8?B?YlNtWlBEaHEzdEJ6Z1RMRzBEempSVnI4SEJyTDFZWldQOFNiRWtFV3BLekpS?=
 =?utf-8?B?d0MwNm42cDMrMTBiSHZ4OFpqZ0F1Uno1UTk3anhVbnhtV2luT1dIR1RtVmVk?=
 =?utf-8?B?ZWtRVG5Md0h0cXgvTzdGUWtYL3VDWjVyK3RsMnVJYVBjanpReFp5WGpFdStr?=
 =?utf-8?B?S2tiNE5SY1JyWDQ1Mmh2ZEpPa3YvU1ZMRW9Ud01nd2YrUkI3Zk42OUNJK1Q5?=
 =?utf-8?B?TG1JU2JITHV6THJVcU85NjI1bHRxa1dUc0EzcVFTRWtPcGZ2SGkrSmtHaUJD?=
 =?utf-8?Q?UU+gji5KISKHdBLRuLig4IR6W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2989a5de-f680-4dc6-ab0a-08dcbdbc3e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 06:25:37.2521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jltnLkLzCS8Ron0/NBZ1J7tWLNVKGzhaN7FuB4LaR4m2kRcVruHjrEPJpLA0rvXMP1YXCuiHYYaWNcvcXC9veQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAx
MiwgMjAyNCAxMToxNSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMi8zXSBkcm0vZm91cmNjOiBkZWZpbmUgSW50ZWwgWGUyIHJlbGF0
ZWQgdGlsZTQgY2NzIG1vZGlmaWVycw0KPiANCj4gQWRkIFRpbGU0IHR5cGUgY2NzIG1vZGlmaWVy
cyB0byBpbmRpY2F0ZSBwcmVzZW5jZSBvZiBjb21wcmVzc2lvbiBvbiBYZTIuDQo+IEhlcmUgaXMg
ZGVmaW5lZCBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9MTkxfQ0NTIHdoaWNoIGlzIG1lYW50IGZv
cg0KPiBpbnRlZ3JhdGVkIGdyYXBoaWNzIHdpdGggaWdwdSByZWxhdGVkIGxpbWl0YXRpb25zIEhl
cmUgaXMgYWxzbyBkZWZpbmVkDQo+IEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0JNR19DQ1Mgd2hp
Y2ggaXMgbWVhbnQgZm9yIGRpc2NyZXRlIGdyYXBoaWNzIHdpdGgNCj4gZGdwdSByZWxhdGVkIGxp
bWl0YXRpb25zDQo+IA0KDQpSZXZpZXdlZC1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGlu
dGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVr
a2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2Zv
dXJjYy5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGluZGV4DQo+IDJkODRh
ODA1MmIxNS4uYjdmMGNjNTM2NjI2IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9mb3VyY2MuaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaA0KPiBAQCAt
NzAyLDYgKzcwMiwzMSBAQCBleHRlcm4gIkMiIHsNCj4gICAqLw0KPiAgI2RlZmluZSBJOTE1X0ZP
Uk1BVF9NT0RfNF9USUxFRF9NVExfUkNfQ0NTX0NDIGZvdXJjY19tb2RfY29kZShJTlRFTCwNCj4g
MTUpDQo+IA0KPiArLyoNCj4gKyAqIEludGVsIENvbG9yIENvbnRyb2wgU3VyZmFjZXMgKENDUykg
Zm9yIGdyYXBoaWNzIHZlci4gMjAgcmVuZGVyDQo+ICtjb21wcmVzc2lvbg0KPiArICogb24gaW50
ZWdyYXRlZCBncmFwaGljcw0KPiArICoNCj4gKyAqIFRoZSBtYWluIHN1cmZhY2UgaXMgVGlsZSA0
IGFuZCBhdCBwbGFuZSBpbmRleCAwLiBGb3Igc2VtaS1wbGFuYXINCj4gK2Zvcm1hdHMNCj4gKyAq
IGxpa2UgTlYxMiwgdGhlIFkgYW5kIFVWIHBsYW5lcyBhcmUgVGlsZSA0IGFuZCBhcmUgbG9jYXRl
ZCBhdCBwbGFuZQ0KPiAraW5kaWNlcw0KPiArICogMCBhbmQgMSwgcmVzcGVjdGl2ZWx5LiBUaGUg
Q0NTIGZvciBhbGwgcGxhbmVzIGFyZSBzdG9yZWQgb3V0c2lkZSBvZg0KPiArdGhlDQo+ICsgKiBH
RU0gb2JqZWN0IGluIGEgcmVzZXJ2ZWQgbWVtb3J5IGFyZWEgZGVkaWNhdGVkIGZvciB0aGUgc3Rv
cmFnZSBvZg0KPiArdGhlDQo+ICsgKiBDQ1MgZGF0YSBmb3IgYWxsIGNvbXByZXNzaWJsZSBHRU0g
b2JqZWN0cy4NCj4gKyAqLw0KPiArI2RlZmluZSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9MTkxf
Q0NTIGZvdXJjY19tb2RfY29kZShJTlRFTCwgMTYpDQo+ICsNCj4gKy8qDQo+ICsgKiBJbnRlbCBD
b2xvciBDb250cm9sIFN1cmZhY2VzIChDQ1MpIGZvciBncmFwaGljcyB2ZXIuIDIwIHJlbmRlcg0K
PiArY29tcHJlc3Npb24NCj4gKyAqIG9uIGRpc2NyZXRlIGdyYXBoaWNzDQo+ICsgKg0KPiArICog
VGhlIG1haW4gc3VyZmFjZSBpcyBUaWxlIDQgYW5kIGF0IHBsYW5lIGluZGV4IDAuIEZvciBzZW1p
LXBsYW5hcg0KPiArZm9ybWF0cw0KPiArICogbGlrZSBOVjEyLCB0aGUgWSBhbmQgVVYgcGxhbmVz
IGFyZSBUaWxlIDQgYW5kIGFyZSBsb2NhdGVkIGF0IHBsYW5lDQo+ICtpbmRpY2VzDQo+ICsgKiAw
IGFuZCAxLCByZXNwZWN0aXZlbHkuIFRoZSBDQ1MgZm9yIGFsbCBwbGFuZXMgYXJlIHN0b3JlZCBv
dXRzaWRlIG9mDQo+ICt0aGUNCj4gKyAqIEdFTSBvYmplY3QgaW4gYSByZXNlcnZlZCBtZW1vcnkg
YXJlYSBkZWRpY2F0ZWQgZm9yIHRoZSBzdG9yYWdlIG9mDQo+ICt0aGUNCj4gKyAqIENDUyBkYXRh
IGZvciBhbGwgY29tcHJlc3NpYmxlIEdFTSBvYmplY3RzLiBUaGUgR0VNIG9iamVjdCBtdXN0IGJl
DQo+ICtzdG9yZWQgaW4NCj4gKyAqIGNvbnRpZ3VvdXMgbWVtb3J5IHdpdGggYSBzaXplIGFsaWdu
ZWQgdG8gNjRLQiAgKi8gI2RlZmluZQ0KPiArSTkxNV9GT1JNQVRfTU9EXzRfVElMRURfQk1HX0ND
UyBmb3VyY2NfbW9kX2NvZGUoSU5URUwsIDE3KQ0KPiArDQo+ICAvKg0KPiAgICogVGlsZWQsIE5W
MTJNVCwgZ3JvdXBlZCBpbiA2NCAocGl4ZWxzKSB4IDMyIChsaW5lcykgLXNpemVkIG1hY3JvYmxv
Y2tzDQo+ICAgKg0KPiAtLQ0KPiAyLjQ1LjINCg==
