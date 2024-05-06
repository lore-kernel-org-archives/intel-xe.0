Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D158AC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 18:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A19B10ED67;
	Mon,  6 May 2024 18:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0h2Ravd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B85110ED67
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715019046; x=1746555046;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cQmTRtwJaPw8lVWY2UsVlI19PutaTOdq692te8AV9VA=;
 b=h0h2RavdZCQZHsslPxXjauUkJ8wQxh3XdQ75Ldb9ZPaZZhoFSdDmySma
 lCx83LAfJ0hh71IQqCyz5EZ1hIkiTsdL6pCH6DLqajGwatWwmJUcaE4Ct
 rL4Y4TLndrlUagCOb1ff0ZzRAtyytjzkZTJElkdI3BchNDKolzsukZWL7
 e2cEV37h8P7I36caRdCopFoaH6gbUEL5MnkNUdpLwqbWAsKh8ha7p9IRj
 wos+vs/eR4FO2Xz4ponEKw8GWeAFsGh2uH2IcMot8AyHfnGzrszuR7ScS
 D0ZWmGENh7InGeFI3XYom6yskSFXJhsYGuUUwrv8m1j1Bzzqm92AKn9b/ A==;
X-CSE-ConnectionGUID: fRO+2or9ROyH9YDSElEDwg==
X-CSE-MsgGUID: 9WEb7Rr1TSi6rwNrD6Rq3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10941159"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10941159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:10:46 -0700
X-CSE-ConnectionGUID: BJYu0FX3QkmtNbJ+I0ChOw==
X-CSE-MsgGUID: CtjjoFypQny1kOhPu5eaiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="59100119"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 11:10:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 11:10:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 11:10:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 11:10:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 11:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz0aJr1HcEaGFNdKuXA03+qn2Plc4DKwj5SekS3IUBp4vt81GqyBqlTlUndcSLu95Mfu5H34J7keM+4pkflVX3yNHN9CzFxQn3XcHyQFp3e93+pc9KUvnJzB6cPRRPDcGjLaI7I5sLDLqCxt7Pn+1KoRFYRs1hg6uuurTZmoEF+va5vI/86RXImk6hTj7ufrDBNW/6Un0N9EJ7SG/RevmXkLiun8H9Lb5cejgfjpjg5Q4GJZOdJGivBEtfLHgkzDmv6j+KX91Qgrm4gEfGLjIvjzojlcvfmZlVYLsH/zsDU/fxc1Tsl1D3oH1lu9IpB8ZjK4eGIVlq207BT/1RHGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQmTRtwJaPw8lVWY2UsVlI19PutaTOdq692te8AV9VA=;
 b=BgdPl50nYTSleGYI9Z8jsqvvbSTHXVkQuOgh1BzefniX9pbUBPzjgCtgR6EhUk3Vrhaa8z4rHho34v2J6+5aMrEEtE1g4/cU7NjeYkofMDnlfSr8d6DH2hy/0BlJU1jwGWClKtvj6BnrqwNPxZjQEgKobLbkQq4IKjqifm347qW9Cqr4m7HKUzmbaUjTTQ+lFHZKBcAJO60DHsMd17RHxos5E2lJ2tLO3IGF3BjHz1MNWfjqbdTg3/MPyT2W314ufoopIE3SwCNpyTstYx/2R7i9gD4pcJw/5hNPtlkYcBAM7awt+HP9E2wafLhwDZVPOreaDJj62+QmK3wrAPcJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.42; Mon, 6 May 2024 18:10:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 18:10:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/xe2: Enable Indirect Ring State support for Xe2
Thread-Topic: [PATCH 4/4] drm/xe/xe2: Enable Indirect Ring State support for
 Xe2
Thread-Index: AQHannu8PgvZkKjuMk6HpS/DgJ64YrGKhHGA
Date: Mon, 6 May 2024 18:10:42 +0000
Message-ID: <b13423ac144e2819c6c3d26388a755bbb686336e.camel@intel.com>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240504233503.16095-5-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4941:EE_
x-ms-office365-filtering-correlation-id: 7947f82b-b73d-49b1-b767-08dc6df7d805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?N2EwaXVCQklkZGhzQlBNbzFFMnF0N0w0Ly92RHZXZ0F6T3dwaUxKb2pURWVD?=
 =?utf-8?B?UFRYVWg3OHhTOXJRZEI4WktjTTlINVAyblcwd3RCYlhaY2dNdGs4UUpoOEJH?=
 =?utf-8?B?ckY3USsremNRZlZPRzlhY3NHak1SRlF2WnBncG9nZVA1Yk02Y0VrMExtR2My?=
 =?utf-8?B?VFVUbFk4ZmtOWEVMbHRLZ0JkT3JLTFBqODFFL2t5Ymx4VFEveXdObitCQ01F?=
 =?utf-8?B?WDNmY3ZZSnJaLzhrU09Oc21DVTUvZ2gxVmhreVVrSmFCVzNZMzJRdUdLRHJj?=
 =?utf-8?B?dlZGUUROa1VKc1QzMEVzZHJjbnVYa3YrRFl4QlZEQ3RRVjBiYXFKV1lLcXBl?=
 =?utf-8?B?MUdha0hEMyswK2FGVHFOOHQ1b0MxVWJKbXIwd1pYQzQzenc5M1BoejJaNytY?=
 =?utf-8?B?LzFuQzJOWHhHWThDcUtwc01Xb0Q1dy9wL2NsRTZxSHhDZFZ3S0psQmtHMjI0?=
 =?utf-8?B?Zjg0KzRnMkUyMEVPWGhtUlR0WUJlMUZqZzAwdllkamZhS2cvSi9xamd4bEt1?=
 =?utf-8?B?ekhEOUZiMzdxZCtKSFc1bmo3K09SeFU3UWpKa2VZYk5Udms2MlNNZXZDZGJh?=
 =?utf-8?B?eldoVzBkbDJZcFNraDI2L3ZVWjdJY3N3T2JreEdrL2t4eGx1cHFSU0JsaG9h?=
 =?utf-8?B?bFJENFhUSXI5bWQ4K1NRSmNneHR1dkRuZE1pUFhTSHRPQnpXTUx6dldad3FL?=
 =?utf-8?B?VzhaMUphQWhoSmFEdHB4clgvZjEySmtUcFA5aEdRQzJkN1VLdXlBR2NON1Ra?=
 =?utf-8?B?U1FGVVNCeXI3OUxGSGVtT01HMXhVY29vdks1RklyRkJXZ2JhbmRMMllOam9y?=
 =?utf-8?B?ZkxzT0x1SnlpTjFJcUhHUEdwU2lCZGNyN1MzdmVsbHpMTlVQd1VNSUhkN05p?=
 =?utf-8?B?REVIVnFCZm41Smp0ZUxrMEpPVVZEaDlOaFhaVmh6cUVCaDZsaFdQcXRzQ3hX?=
 =?utf-8?B?cjU2cTNOa21EZHdBMjVkZVlDN3VWb2VqMDVtYUliZDVQd0RHVFJnakFGOE1m?=
 =?utf-8?B?VjRMKzUwaG5iK3A1WGVoTVAvU0NYSDVJVlFuRDVVUXZoSFYzakNyNkZiUU1L?=
 =?utf-8?B?K2I3YmZPeFY0ZklJeWFFYU51S1hWTzZhSHNHa1JDTFErY2YrSzlLYTR6Yi91?=
 =?utf-8?B?NUxnTGpuenh5K0xISFI4L2dNd2hZTzVraXc2c3VyYTJtUXpTSzcrZzNBK0x6?=
 =?utf-8?B?dm1uWFYrV0pCU2d0ZXE0R2lCdlVIVXZGbDJUSzdEd29xU2hmLzFjb21kM25B?=
 =?utf-8?B?dEQycjNibkwwUENuN3VXRzRvREVQUlRvWjRIRTA4QmRPQjAvWFBVbHdkSXVT?=
 =?utf-8?B?alpXZjdlamZPQmRybDJBWEdVQ05reG1oZHA3VnNSUUoyRHlQd0o5U1lKZ0Nt?=
 =?utf-8?B?OVRROTkzVm5TSFF1aUREOWRsamlNVkQydHNneEt0N3RxaU5peWVzMnBPcnFl?=
 =?utf-8?B?aERVODFSbUg0UWpTWjVsdmM4czFlMWdCLzJIUGtjSDdzcnRnNnBEYnZlOTV6?=
 =?utf-8?B?eGs5OHpzTW0xYVpxOWJuZElqcHI0S3BvN1FCUGxsNTF5OTN5YUZTeUE4Tmhl?=
 =?utf-8?B?S1pVZmYrbEUrMi9HZVFFUWY0QkFLTi90Qmt3TkdPWWVyRjI1T3FEVjM4eW5O?=
 =?utf-8?B?Y0NtVVRYWlVwekg5WXpRb2pnWjducmowbWhPdlF1QTVLWTlTNHQyK291SWVq?=
 =?utf-8?B?cXJ4bFJuZnFGeFBPZzFEd0JHTmFuQzd4Z2xQRXBFRndxVFU0RG1FU2xiZ1Fr?=
 =?utf-8?B?cUlaT0ExZjhlRVE0WXlBSTQ4M0ErRk9WOTg5SHRJUUJxWHJmT3FqZkpSVDQ0?=
 =?utf-8?B?blUrSGZNM2hFenRoT3Nndz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk0rTDNwRkNQSXRDVTVtWjREY1VGVXFsa3djRXZkdkUvaEdZQVFHajZreVdN?=
 =?utf-8?B?aWMvdFUzNDlzcmZIbzJ0dWhuUnE4bS9rb2dWb0czZjVSMWlZLzd2cE5BZWw0?=
 =?utf-8?B?b3NLYUpGSDE3VDRzS1RnYmNMVHZpemNONDh0MlJqbjVjdXdoR3J1VHBUd0lU?=
 =?utf-8?B?TEZxVW1uQXgrREVOeitLTm04bDQxT0hwWjRPWXlxVHZGcU5wOGNnMkNMVnFV?=
 =?utf-8?B?ZWYrd2FqWDZ5SlVrRGE4YnpWOE5YVmJ4YUZBRmVIdEFOYktjZ3lQdGlpMlZL?=
 =?utf-8?B?eXlRSnpDbmVOUThmZ1B5Z0kvaUtGTHJvVWZzWFBnL1RkWk9NaExGbTZtUDJl?=
 =?utf-8?B?YTFlV2pYbUNjdm9WV29qYkN3eERrNVhOcGJrc1NqTDJ5WlZBZXh6N1JBUFNV?=
 =?utf-8?B?UXdDdG1rSllSVXFIL2d1M1RsZnc1WGswdU5GaGwxMWR5cSs4ZE0xemNDeTNh?=
 =?utf-8?B?ZjFUYVlPV3FZeGxOY2FiYm9TZVpoUGtYZm9mTzVXMC9TUkpZQVNEeWk0MTIw?=
 =?utf-8?B?UDNBQUsybEF2azE2eHJZaG1GcHNpbGRMdjBmQTN1T0ZjdU1IbXNFTnNKQmpE?=
 =?utf-8?B?ODdmekRMQk1uZjFKdy9RWThZOEV0RDVsL3krSTc1VjdFL0V5cXVnb2lTazhK?=
 =?utf-8?B?bnZtZFJtYjZIaTJ2MDV5ZlAvcGt1U00vaXNxNTVIZ3RldzR3U1oxdnl4cDhM?=
 =?utf-8?B?cU1UNCs3Y1E1WmF4VVhnMEdtdUszZFh4a0FoQmlxQjhTaDFBaUZydVN1V1JU?=
 =?utf-8?B?L0V3LzQ0bXlqeEhIdU90V09qTXlOUnU4TFhTMDc0MTlmbzBWS0t6c3gya3M0?=
 =?utf-8?B?WVY5ZWdyS2lIWEQza1dZdElXSUJRVlljdHZXaTZ4UlUxLzBsUnU5ck5pdis1?=
 =?utf-8?B?WGVlYUg5d3pEZ3FSS1ljWUQyb3RPQkxNd2oxNFhPOGN4T2o4S2U5eUV3SVpZ?=
 =?utf-8?B?amdKUk1ybXg0dFJ3VFlFZUN6c2tyQW5NTGJJa3Z1LzBMM2hEV0hXMEFXKzlI?=
 =?utf-8?B?dzgwbXB6Nk1Tcktwb25qUi9FZ21KZ1c2RWxRMlBKK015SFV6clRXb0xEQ2g0?=
 =?utf-8?B?RTNJOHZrVmdzaUw5aForVmxaSzNVbENUazA5eDJ6TkUwOUJVT05pRndmZ0Fx?=
 =?utf-8?B?TlFNRHlVbkk3dlZPZmVUa3A4NHh4djV4THRSeXFmOWtaT05SK3VnWkFPRFBO?=
 =?utf-8?B?WXJOVWhoNlJTbXlERmpLOWo4emNNL0xBWmowanlFcCtQNVJtUUtFYVNmUFlU?=
 =?utf-8?B?TUhSMHBQRm9JbzdZbEQvV3pmOEUveXhCZjMxdEdrVm50OERmSGgrTEJCSHMw?=
 =?utf-8?B?Unl4VkZsMUxDS1B4MHRrc2V0RXFVRklqYWZFRDVhbHhadUNXSlV2azFHeWdw?=
 =?utf-8?B?ZXlqczdtTUl2V2gzWnhxWkQ4UFI5dU1GQWc5UnRXSDBHNk1QdHlNRG1ESE1D?=
 =?utf-8?B?endhd2s0eUlzK3orMHJ1Y1YwcnFOODA1UkoycGNjUmFnUFF1cGJDKytmcndj?=
 =?utf-8?B?ckZyZ2xiOFlVSFgrVEtWQVdDNkQvZjBiajlFbTVyZk03WTlnVlcydnpKRDNM?=
 =?utf-8?B?TU5CNFBkLzh2bWhTM2t4a25YbzVIQUdRZnpyaEh5ZS8yWFJObmYyWkxPRTIy?=
 =?utf-8?B?YVBMeXZ2RGNSUUQvckVadTlXZGpYK2RTTEtLZTMxaFovVG9XZDhCRUhiQmRT?=
 =?utf-8?B?UG1CaUFFdUJCdUVFQVRIVERHUEdoT0NhYnZmRXB6YzYzNHlWZ2lhQnFFSGdj?=
 =?utf-8?B?QXc2eGlwNHphK0ZvWGt2cm9oZ2l3cmtycjZtNmlTSEpEWHFZc2tpUW5ZU0p2?=
 =?utf-8?B?RTRrUEtndFdERGtvam9hdWI1ZjVKcEkrMWlONFRZaEd5WDdhRTBKdjBGUkxv?=
 =?utf-8?B?cmdmb0hQNENiY3JDb1NuQlJYVUxndDR3QjFERkd3WXlNWk9Cd2d6dHVOYXZv?=
 =?utf-8?B?alFCdHBxLzlZVFc1RWs3ZDBOU1JiOE1NOU5pME1GQVpqZGU1SThuV2U2ajBH?=
 =?utf-8?B?algzZXNIeHZQSlFybHNNU2VRc3RLZGVwcExYejI4VkZSQytTVEViQzV4bTNh?=
 =?utf-8?B?c28xa0xpdGNrYzhReUR6ZmJSa2tNUXdJQ1QyZzZGWkdVU0xsNk5JeDVvaWpN?=
 =?utf-8?B?NytNdTcyQmJmQ2tBSEV0QWpSbER6TWVCalJQd25PS2oxZEZBOHZwT2I4R3V2?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9594DE55FEC5FC4A9C13F871393B784E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7947f82b-b73d-49b1-b767-08dc6df7d805
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 18:10:42.8271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6wcXk4ZNQ5d3dF89VEYArqgxDaTzik8wFxf59gdbW+wwpg2BqwDUYR69hKR3Ypu9ct0ndQqucK9pgzruyxw4syc5M0Lw7p3EfkyOHYhyrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
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

T24gU2F0LCAyMDI0LTA1LTA0IGF0IDE2OjM1IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBJbmRpcmVjdCBSaW5nIFN0YXRlIGlzIHRoZSByZWNvbW1lbmRlZCBtb2Rl
IGZvciBYZTIgcGxhdGZvcm1zLA0KPiBlbmFibGUgaXQgYnkgZGVmYXVsdC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmENCj4gPG5pcmFuamFuYS52aXNod2Fu
YXRoYXB1cmFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFy
dC5zdW1tZXJzQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNpLmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcGNpLmMNCj4gaW5kZXggNWJmOTRhYmY4NGNjLi45ZjY2YzQxMDY3ZDMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTE2NCw2ICsxNjQsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHhlX2dyYXBoaWNzX2Rlc2MNCj4gZ3JhcGhpY3NfeGVscGcgPSB7DQo+IMKgwqDCoMKgwqDC
oMKgwqAuZG1hX21hc2tfc2l6ZSA9IDQ2LCBcDQo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2FzaWQg
PSAxLCBcDQo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2ZsYXRfY2NzID0gMSwgXA0KPiArwqDCoMKg
wqDCoMKgwqAuaGFzX2luZGlyZWN0X3Jpbmdfc3RhdGUgPSB0cnVlLCBcDQo+IMKgwqDCoMKgwqDC
oMKgwqAuaGFzX3JhbmdlX3RsYl9pbnZhbGlkYXRpb24gPSAxLCBcDQo+IMKgwqDCoMKgwqDCoMKg
wqAuaGFzX3VzbSA9IDEsIFwNCj4gwqDCoMKgwqDCoMKgwqDCoC52YV9iaXRzID0gNDgsIFwNCg0K
