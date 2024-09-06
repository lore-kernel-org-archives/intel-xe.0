Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DACE7B1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 14:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96B510E644;
	Fri,  6 Sep 2024 14:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaDu0RTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0567310E644
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725632847; x=1757168847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mZpzLoP6bYUTFrJo4kzrs2MJn4PJ279hoKNTkrAkuvc=;
 b=OaDu0RTx1oLmn2+jU/zuAbopaIwlvhlb+7LE3mxB3M1113XreMuMSWNF
 MTiq98vAXmRgKBOWj3z89cYzNYLq/KfFMj+zZ2wXc0/ss7syWnXMY/n1k
 vztk0YCg6ZSyh78fYrMdY6bbFF+e5lrB04Z2+lTkpdAy8iKoI2KcYwt8P
 44XZhV4897CyI/0eMU6ec0yl5SVSBGKOKF5PMCxuUguxzmG009fjJLnjb
 51sk/0B+y23vRwZoBSGFa5owxD2AIoNPo9ig8jkF+JqhZUimlFe7OKEtE
 ryFnS067twCXZmnsZcJkh6UpRLtbU+NUgtddaxApvMQ8qxPg9+GL5ua8j A==;
X-CSE-ConnectionGUID: jbbnHYlFSxaFm8g9kOWiEg==
X-CSE-MsgGUID: Q/Z0h3gKSQCfmMzivr35Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41902225"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="41902225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:27:27 -0700
X-CSE-ConnectionGUID: nRTM8V93RryLJhiVxAwSPQ==
X-CSE-MsgGUID: Q0nZVm/5S1mUUIEL7KkRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66718696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 07:27:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 07:27:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 07:27:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 07:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlGXZuLiryR6Vr2BTw24JuBEW7DKE3A4kJTkGkT1/Lx451EiLF158rZbRhyvrlT3DCTXKZj09aAsLX4PTViLHPACk8T35jwiBMBp24zqnLYLyJVWKMGSfmosmQ8PRxRu0716E+kQQ0ZS2/USxctKeP9Bec6tO7D2WBzw3UHpPgPN69QyCIWSdbfsv6EYjSw/qsxN3axokfW27MG14QkrG0THEj+1w7c/NAqH/f/46qCMqbAZKLTC+2TbjsdJXD83SD0U/zhXLy9HqQu641xjx75cAZfwgcSBOuiUbMNtfJlU5nQ+wt2OJ1obLWkZSQTGkCgy/0oKWUeK0m0NsbtP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZpzLoP6bYUTFrJo4kzrs2MJn4PJ279hoKNTkrAkuvc=;
 b=ZYKfWcRYHhpWE88VudwF54PqAfwxNbYD8stf7z22rIZ65EAI52HNTj4OctaL6h37kQKTdcJd+yD32U1lrQ80SMhGEXEP7JJHLlORM+gXyDIoVXn0ifKZJWX1+DJFK1gOKOsQrgD08yJ+PEyuQ7YkCNnHmx4znx1th2jNq5jjbObxe208JnsusuPSc3XK+o6Jyg0uWcZPNHY9HB+Sits6ZgMklUiit2KiCfyFpnscqjJz3X6Y8Gy63eDBbiw4HJWj+aZZMfHl3UKJ/K+VZvU57jMCkjYTt01EZ2ah/OrDgYXZQ8kaNYsdh4g87quE+etiOQQwQO/vvG0Shwl8i+wIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 14:27:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 14:27:23 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix arg to pci_iomap()
Thread-Topic: [PATCH] drm/xe: Fix arg to pci_iomap()
Thread-Index: AQHbAAxqUgm2yyWl2Eqdz15KUTnqo7JK0auA
Date: Fri, 6 Sep 2024 14:27:23 +0000
Message-ID: <241487a9b32c918016b8ac83faa7232ce1fad760.camel@intel.com>
References: <20240906032507.2952859-1-lucas.demarchi@intel.com>
In-Reply-To: <20240906032507.2952859-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN2PR11MB4759:EE_
x-ms-office365-filtering-correlation-id: 6203a05d-4d07-4217-4f3d-08dcce800637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NFNKb3hWank5dmlxay9qbTNPajBYTUl4bjRmSTVPLzcyY0JvRHVvRUZoSWNX?=
 =?utf-8?B?aGdvZHlNVHFmQkZZMmd0ZVdLNVF2TG93Tm9SUU9wdHpaMC9sZXZ4anVjK2l2?=
 =?utf-8?B?TFNTL054dDdmR0dpOHpGRWwrNVhQQnpQUGp3cTV5YjZ4U3YzZHJDdFRkeFNL?=
 =?utf-8?B?SGVMZGpsSldDdVQ5NGd1Nzc0enViM0lIZGJNR2VoRE43TE8xSHhlZ0JKZG0w?=
 =?utf-8?B?emRRdUlBeGxhYjB6N1Q5Q3FkREpGOW9SYTNvOXQ5b1grVGYzSGVQSE1lclRQ?=
 =?utf-8?B?V2tNWXg0VTE4NUJ5QmNQWnBuZnBBYUhmTnNadStaNXZERTk5UmhhMkd0aHpu?=
 =?utf-8?B?MG5QRDVsQlBCSlRRalkxajQxL3R3dDBZUGpHcWtVUHBWbDhuWjJGT2JRZk45?=
 =?utf-8?B?K0tzSGFka1djTUJvaE0xUW94Zm4yUktsTFVUWFNXOUhQcnE4N3FXcUN5aDZl?=
 =?utf-8?B?eHpaQlZSemNPSVVRMThWMmQvRzBOY3lWNTFhRitkT3lHUFFJZVJMdjVHTnpi?=
 =?utf-8?B?dk0yQXZ5a0FiQWpyd0dPSEgzMEhaSW1tQ1VQQ2RVUHBtUlZsNDBUZkE4OFJT?=
 =?utf-8?B?SmhBOG9hbE5ZaC9SbVlacWZoQkh6T212SGl5allzSm1XUUo0cDdsMjMxenBx?=
 =?utf-8?B?clZGV0RNSVl0YmRURlB6VnhzckJqWWRnWjR1TWhRRWN2dkszNHRqbVBRa0U5?=
 =?utf-8?B?VWR5VEUxUklleGtvUjZ3YlBTdmhNV2FjeWVFdHVyVlNlc29jbXJkSmFhQ2du?=
 =?utf-8?B?cSt0SU05SERKdk14cmFnOVVyeVNBWDFheEp3ajZLZjgyRk1GTGpTOHBLREJq?=
 =?utf-8?B?dDI1em5GY0dHMWgxTDM4ZlJUMHY2VkxtajNFNFg2NU1vLzR6RVpGY250ZlhT?=
 =?utf-8?B?NWFzYlJqbm5YRjFEa0FDNjZRQnpWMjBFSGNNZys4ZnJZWjZiWWZQYzZzZGVw?=
 =?utf-8?B?d0NlMlRXZkI1TnJ3ay9EaDllUm9ZczlVSUU0NjVpSUlPdnJkR3FkNGRtVUo0?=
 =?utf-8?B?c3FRMHZ1b2lIRTJGRk9tV01KMGFEQlBRV1lMeHVrclN5b29zNDFxbGRacnVn?=
 =?utf-8?B?WnpXYzYwa2ZibjRJMlRCa3hkaFNZaC9GK2tvVnc1Qm1hdTRnRHVRakNEUkNw?=
 =?utf-8?B?RitQZHl6SG9BLzhtMmZiSlE5UHNSNTVZTEgzdmp5QVl1SHhtbFRmWjRyVGU3?=
 =?utf-8?B?SzZLdzU2QWMwcFkxSmw1VnVkamNhQzU0b3JENGZTWlhoNTA3ZDI2dlpkdXp4?=
 =?utf-8?B?VlVZM3d2T0xBR1ZKSmxVcWtMdUtTSFZEWTQ1S2VRTnhBcC9JUTltV2I1TG9Z?=
 =?utf-8?B?WEF0bW5SVjFjZlRSYjk4U1UwY2RkeW9JNUJzd1cwOExTdVREaVE5ZXZLNHJI?=
 =?utf-8?B?Q1FwWXFCZXExL2JBVGZpQ1VYUXhLZ3Vlb2VZZUF0MFBNYzA4eWdRTWlzZW9Q?=
 =?utf-8?B?dW15THM0YW50dmtiLzFocHNLbXZHcGk4cXhhbVRyWlJxV3dIZkE1dVhaNDhv?=
 =?utf-8?B?clNUYUdVVmdLMWd5ZnhFT1BERHk5Mm1nU3RybmdmOWVwS2FpVWpiZWJYV3l6?=
 =?utf-8?B?MllkdkJYRUdBdGUwZVdOTjdOYWJDcHVhMDJGQnFPUUlsRGR4dmhDcVZaK0Z1?=
 =?utf-8?B?ZzFHcFdQdUpYNUQ2RTBCWnpvc1A1VnYrV2ZZQ1NwVFJzR3d0NzZLS3NrRm02?=
 =?utf-8?B?dytyL3MzZTREMVo2cStwQzNQSlczWDd4Uk9DbERQVjkvTkRjSmorOU9hTlo3?=
 =?utf-8?B?VHFIeGNRNUdKZVhVeUQzTmFqT2dtd0w0c0tvdWNFWWtMY2FRNlJTdVJhNm1U?=
 =?utf-8?B?blkyNEwxRG1MWmdURzE0MUpXdi9hZTJRUzhWQWl1VWdyaHdCaTIvV0oyMW1y?=
 =?utf-8?B?NGpmK1pYQkxzenJNT3F5RWx4dWs1MjA1b2lrckNYaUR6MWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FzME8rOGxZL0l3V2FkMmlZVmFBRmdUcW0wK3RkUzhHTlNtNktDRFNxUy84?=
 =?utf-8?B?bFlmYmN5YTJlQlU2NURxd1FTZE9FZ0lNWHpOTTlLMnBiSWR6VU1GeDdHdzVl?=
 =?utf-8?B?VWRpanRsTXQ0STVSSzhrb0dMR2pFUHZVT1pzN3lVUjlwWGNDdURHcVBoaUY3?=
 =?utf-8?B?ODZRYkVIUzZiWHdHNFo4ZTI0WDN3and5cjhnUEs0WU8yeXc4YW54U3ZpdDk1?=
 =?utf-8?B?MEtwZ1hpQnh4clRsSC9LT2tZTTg3K21KK0E4b2tCK09RZHhtSm1DODZtR1Zr?=
 =?utf-8?B?Ung2QVgzbTZFUkpvcUZCK3ZsREFFTkhlNUFVMmV6ZzA0SmVhYlcwWWJmSWd2?=
 =?utf-8?B?NzlzaFBURXdsaStHWW5yaUxsNjQrNlFvUmtzVTNsdEpFU3BQV0ZXR3l0QTVB?=
 =?utf-8?B?bU5MUGJtTmcyRFdVK1RhSWVCYTJyMWgrdDJpRjh3RUlsOFp3VnpLaDFDVGlr?=
 =?utf-8?B?WWJaTGMzL3RiZCtLZnRjQWFQWDJxRUNrWURMUjA4YzU5djVQMGZTSG1zdWZw?=
 =?utf-8?B?alplYXJmdk5hVGY4R28yNWp2cmpxZVM2QkdSQ240bzhpUnh2RTlCNTdCd3hj?=
 =?utf-8?B?R2RiTU5SSWx0VGh6NFFBUGNITjZqbGtyckkwRWtOSVNLbmRiYWlpYnZIam8r?=
 =?utf-8?B?TFlEK3NYZ2E5QTZvWG1rcFptZThjTkdXdUhCcDRrWFErblU3b0pmK2dSdUJi?=
 =?utf-8?B?L09aM2RxWG1oM2N0WWZGYURsRmt0UDU2bDl4ZmFkeUVoblI1ZmFvT2xvUWN3?=
 =?utf-8?B?TnQzYjNSM2MzK0RFRXYzek43Z0FLZTJIRkJ4NTRiV3BUQzc5UW5odzRkSmhG?=
 =?utf-8?B?Z3BwSXZ5UEx6WDRNUVJ1VnFESXFRUzNwZTh1allpaDFmRVN1ZDk2MjVUaS9V?=
 =?utf-8?B?UytrSGJQQk9wbmtYUnBXZWJmYTZieXB0cmM1L1hBZnJBZ0N2ZnVOMkFKT0RK?=
 =?utf-8?B?aXY0UTYyVWxBN2xkaGNreUM1Z1lveWFDMFhrZXBNak9MTmtzS25nS3ByS3Vp?=
 =?utf-8?B?MTVaRXd6aHZKTlVFOE9BYTBjS1NOTDl5QTlKeGFaa09NcHF4ak1YaE9sYjNp?=
 =?utf-8?B?azN4cnhYZ2s2M0tVdzU3MXl2clZGa1R3b1Rsd0pWWmhnYWl6VnNQaVVxQU52?=
 =?utf-8?B?YWhwak5Rd0FJUTNBYzhrOS9TcHdycHVhWWlEMmxSTTdFNERWREE1cjRRQXBa?=
 =?utf-8?B?dzFvU0pCT1hXaEx4cnpETnRQM3hpMVN3THZCeHFEazZkSlE5cnAxQVNWRjFZ?=
 =?utf-8?B?bnp1UVhLNFFCMWpWUkJJUTVFTi9EcVZhOS8rL1crdlNXaWNKb2VoYzVyNEhC?=
 =?utf-8?B?M2JscWhvNzNnZ2I4V2hjc2dnbENDOEgyOVA5L1IrcFdZOC8xSU9QUm5mSHRI?=
 =?utf-8?B?OURZbUZZbjVCUnlWRThtQVR4T2E3N1Jlb21Ld3ZmNm93Q25JWFRGSlJZYnRG?=
 =?utf-8?B?T25pa1V4bFJGelNBQ1VHbjZJT2NLb1JMRnhwb0RmNEFmOU56ZHRaRklCNmtD?=
 =?utf-8?B?cktwYkYyMFlNbWtUK2ZmaTU4OVovcWwxVkNxZFNuUnNWUGlzZEdjZjYzbGpR?=
 =?utf-8?B?NFpPWjNHeWhVNkx3N2VSa0V4ck44bGpzU08rdUk2K1JJV2crTWs4aGluMWhN?=
 =?utf-8?B?SkNEVEJYMzVxQ1FLeXVrK3pkZmNXbzZwMzNncG1GbjhRdk10R1lzOUVYYUtS?=
 =?utf-8?B?K0cxL0NjTmxwTG1CT0x6OFRHQnJ3am1XMWlFaEowRjZNa04wWGxtUWFNUTNT?=
 =?utf-8?B?WDNZZ1FJcHJsbFBOWUhCYytyVS9KTzBaOTRCSE1MdjZhelVlbFV1RStZa0Rz?=
 =?utf-8?B?cjd3KzBhcUJoT3BLZjhOVmE3SlJ5UW45MExod3VTdDRNeFpiUStuY0tpbkZo?=
 =?utf-8?B?SzZ2bGJtYzJRR002TjY3ZU5RcXdLUzQwNkIvM082elByY2czRUhyQ1ZtOHNP?=
 =?utf-8?B?L1l2QnJ2UTVQM2Y4N2pvRnREdFdOT1JCRmYrbjF0cUlMa0FVRGNhR242R2My?=
 =?utf-8?B?ck9UWFRqTXZ4cEErcmdvODZUTVZodWNSQUExekxtdlYyclh0cFUrT2Y0VVF5?=
 =?utf-8?B?c0lHMVdmTHpPMXJaOUhuWk4xVEdiY1pTOVVPTk1NTEkvMHhYRjJxdUNralZY?=
 =?utf-8?B?ZmdPcDEza1YzNFVzbjZMeHl6RFU1dU1odjV6QXpNeTdwQUZ6bDNZblpXNTNK?=
 =?utf-8?Q?Qp1B8SRxPFjYvmCjPlPu/hs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F97F4421D6C774799C44AC10389FF49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6203a05d-4d07-4217-4f3d-08dcce800637
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 14:27:23.4965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2adHW8IvtJC8pFon8U7Zgqbr139Em1ZBAUsk2aTM5irKR7hl5QckU78Vtcxmz8OLVbqnyJ1uRyup39r3cBJsRZ7piPm1Fk24feqlSJMsO6uialJapC8vmrji8EtysyMe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBUaHUsIDIwMjQtMDktMDUgYXQgMjA6MjUgLTA3MDAsIEx1Y2FzIERlIE1hcmNo
aSB3cm90ZToNCj4gQ29tbWl0IDJkODg2NWIyNzcyNCAoImRybS94ZTogTW92ZSBCQVIgZGVmaW5p
dGlvbnMgdG8gZGVkaWNhdGVkIGZpbGUiKQ0KPiBtb3ZlZCB0aGUgQkFSIGRlZmluaXRpb24gdG8g
dGhlIGhlYWRlciwgYnV0IHJlcGxhY2VkIHRoZSB3cm9uZyBhcmcgaW4NCj4gdGhlIHBjaV9pb21h
cCgpIGZ1bmN0aW9uIC0gdGhlIGxhc3QgYXJnIGlzIGFjdHVhbGwgdGhlIGxlbmd0aCwgbm90IHRo
ZQ0KPiBCQVIuIEx1Y2tpbHkgR1RUTU1BRFJfQkFSID09IDAsIHNvIGl0IHN0aWxsIHdvcmtzLiBG
aXggdGhlIGFyZ3VtZW50DQo+IHRvIGF2b2lkIGNvbmZ1c2lvbi4NCj4gDQo+IENjOiBNaWNoYWwg
V2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgfCA1ICsrLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0K
PiBpbmRleCAzZmQ0NjJmZGE2MjUuLjRhYWUzMDg4MGJjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1p
by5jDQo+IEBAIC0xNTcsMTUgKzE1NywxNCBAQCBpbnQgeGVfbW1pb19pbml0KHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90aWxlICpyb290
X3RpbGUgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpOw0KPiAtwqDCoMKg
wqDCoMKgwqBjb25zdCBpbnQgbW1pb19iYXIgPSAwOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKg
LyoNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIE1hcCB0aGUgZW50aXJlIEJBUi4NCj4gwqDCoMKgwqDC
oMKgwqDCoCAqIFRoZSBmaXJzdCAxNk1CIG9mIHRoZSBCQVIsIGJlbG9uZyB0byB0aGUgcm9vdCB0
aWxlLCBhbmQgaW5jbHVkZToNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHJlZ2lzdGVycyAoMC00TUIp
LCByZXNlcnZlZCBzcGFjZSAoNE1CLThNQikgYW5kIEdHVFQgKDhNQi0xNk1CKS4NCj4gwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPiAtwqDCoMKgwqDCoMKgwqB4ZS0+bW1pby5zaXplID0gcGNpX3Jlc291
cmNlX2xlbihwZGV2LCBtbWlvX2Jhcik7DQo+IC3CoMKgwqDCoMKgwqDCoHhlLT5tbWlvLnJlZ3Mg
PSBwY2lfaW9tYXAocGRldiwgbW1pb19iYXIsIEdUVE1NQURSX0JBUik7DQo+ICvCoMKgwqDCoMKg
wqDCoHhlLT5tbWlvLnNpemUgPSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIEdUVE1NQURSX0JBUik7
DQo+ICvCoMKgwqDCoMKgwqDCoHhlLT5tbWlvLnJlZ3MgPSBwY2lfaW9tYXAocGRldiwgR1RUTU1B
RFJfQkFSLCAwKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZS0+bW1pby5yZWdzID09IE5VTEwp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZXJyKCZ4ZS0+ZHJtLCAi
ZmFpbGVkIHRvIG1hcCByZWdpc3RlcnNcbiIpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRUlPOw0KDQo=
