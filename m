Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E2DD374BA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 16:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF52510E201;
	Thu, 17 Oct 2024 16:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7qMg7pO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCA810E201
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729181695; x=1760717695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=idYj6aENPgGUsiYhv6ra4w3pQaIvIepykjG8q/e/LhE=;
 b=T7qMg7pO9y/VCFZ7iE9wqYCqWNX+WqkBOiQ2tV+jqQOqNIR0r+pM+fqK
 PHqSLDc60OOoilTi5LUX1gjJ1wC+7UgssJFNVFlXncJlDppiglEZGuBuE
 FJ8BTbzuYSDOqgRqaIbFcAyLF0nef0uZFQEpd34PKTDwbavUX5KipC5Sr
 veDKKfTGgjF2L5M1ivTvZ5L9F0JMiNB6H1QC8za7t0Fjx/dAsh7Hd0Mra
 GZWu9LTf37HXSxOBljUsv4BHiDefr563EhF+QSaecmWs2ZxvkNzE+zkh3
 WibktmlGOEM+mIHZpgHVDXzMqWRgi5CJbp8jhmxzxFxTQiY4KWCKonmBC A==;
X-CSE-ConnectionGUID: F2Z0L0kzSxCLe9wr4iLZ4g==
X-CSE-MsgGUID: 8VqzhuL5QSacGy6jmljF3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="16301036"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="16301036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:14:54 -0700
X-CSE-ConnectionGUID: SFc1XIdXR5WUUoCAzrNqZw==
X-CSE-MsgGUID: Vrxx1dbRS1yO/uWcIr/RdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="101904868"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 09:14:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:14:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 09:14:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 09:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viwfvE49KhvalgJewbpVopWo2/phJ31PHYWloAJRU9aMxgKo5r7UBvhFLhGCXhRyvJs3d5kXWyA6Bp45kXvgvE1qIFGUf9iypaNj6mlfTVlT9TjGEY/b9JiM+D7K6wJ2lT1uML/ttJgnAYU1lyDR/nrK51RB3idb/Vg2KD7KNf8w/2zPtb+qkR1xRw2DuIy9C54H2diUkcrJ9afuIImZBR0rSrvHklv3LKOk47LaAHsqtlcIWuvG2OV+Fb+5lYXk+FkVBBiJ6qwPim7Y7xRAhUef0U4nL46WJ77/DKiij4yIFizvIGh2wEOdwl03MSLt/QdsMr2gy132KL6yGCot6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idYj6aENPgGUsiYhv6ra4w3pQaIvIepykjG8q/e/LhE=;
 b=F8W6jfbLoF+IzpT71wzBLjakT9kakKzWR8b0MWqluTo9HT6W4R+Lbjh2VSMqglJy9pjQd7DrOfC6M59GzO4Z9fHv1kmzt6be6+maeKNItU2onao8UI3iZ1Qa9YTd1wNWjDYv8q/B6fGw4GR1o/SybFYJg7BIxMqYpEOTFpE/qSJYD87LQh/V8qKPGRtoQljyW8AXZ3/wJ+fLCVAJwjZnnRxW3UTZ5Jw5iCIA8utMcmCnu+rquSyMse8yfD1HZKqL49DMPfWKpOV3fZNfrnmiM4MyLFXyw5hIQnvhOJssiCmsVcFit8pAMNwXCJC1sK94/s4SnBu8LY8SSRuTJ+HB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Thu, 17 Oct
 2024 16:14:46 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 16:14:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: RE: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Topic: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Index: AQHbIEtWeMnglZAxbEqOBRGptm4AcrKLEnqAgAAE2/A=
Date: Thu, 17 Oct 2024 16:14:45 +0000
Message-ID: <DM4PR11MB54560FD5F6C45890E41EFB70EA472@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
 <8875582e-5e7a-4c10-9c69-23c7b892f745@intel.com>
In-Reply-To: <8875582e-5e7a-4c10-9c69-23c7b892f745@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BN9PR11MB5228:EE_
x-ms-office365-filtering-correlation-id: b7d78bcb-89a2-44d1-d326-08dceec6d104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b1h1Nk9oYUdZVWZiTjFVejYvMDVoSEwrUmJ5TW0razc2Tm40cW5OS1AvY0Ri?=
 =?utf-8?B?VnlUcVBOekUvWTRFYktiY3p5QnMxTG5yRVV5RjVwRGJJaENHNFhvZmRDNitV?=
 =?utf-8?B?LzJaYUkzZ0l0WmhWV2JnbWtpOVltV2R2Y2VwZE0remZ4WmdrcnE4dXdQYUhO?=
 =?utf-8?B?d05SNmlZdVplMEtnRHZNNUI0Vzl0eXJReTVScXhNNEdVSlFSQmtUWmR2NElo?=
 =?utf-8?B?cEZuTVJMV3ptODZzU25YaTRHd01Gdm1QL1FWZTY5NGtjSmNWRjRHdFZKZmRR?=
 =?utf-8?B?ZXFudVBZTnE4MzJwaThidGdBSThjdXNKWkhOMDBMVCtCVzUyQ3JaNUNkdEhM?=
 =?utf-8?B?dVNvMnE3eFc0Y2pOZldJcms3RkZBOGZzWFNrc0hZYThRdmtvNTVJRkVKUC9Y?=
 =?utf-8?B?cW1xZnRSQk1RNzl0TkZ0a3RhWG5rQlJqREt4YjI2aUZrOEg1Z2ExY0QvM2Mv?=
 =?utf-8?B?aDRTd0dZL1EyaDZGaDFXUzkvWWlldVVPSWtUZ0w1eWJ3VmJXbEFadERDL3JQ?=
 =?utf-8?B?SmR0M1JWdW44Y09JOGpGcDdFTlFkTUhyRmt4aTZlaFBmU2NvMXBpeG51ZVRN?=
 =?utf-8?B?a0pPR0UwaC9oL2VoRFlBTUk3R2NZNlZya3IweVJ6dk1IYk5Jak1uZUNscHJw?=
 =?utf-8?B?UUtoSVdKUHF6WXVzbmlqMTA4UlpteHcwZ25FTEZDejhNYkJuUjZnVEdCbEo1?=
 =?utf-8?B?YWRzY0hKd0tKQXRUanMyUE5kQWVrK0NMdnNoaG9jV3Q0SlVtT1dFTTVCN3h4?=
 =?utf-8?B?enhpK0xsYnh0Z2Z1T1J0cVUxYmJrYnlIcUtnbmhqTk9zNlR1eUR2ejR2VmQ4?=
 =?utf-8?B?eXdYb1BOanNYQ2Z3QWdWcVFHb0VYV1AxOEkrZkVUNUxlaGJHS2dZdkF0endC?=
 =?utf-8?B?NlNNclVHS1RmMXJPVmluYVFVQTU5SCtxM0JSTG5WSVpoNXI2T0hYYXl5NWxh?=
 =?utf-8?B?b01nMnpmSjVYV0VMcU80M0JSS3IvTFhOQkIyMFhtWDh4cTdoSFZ6VkVRZ1Z6?=
 =?utf-8?B?Y1VXdDE4QnFoWEVYRE5NMFU3QnN6OXNqd1pEL2l2ZXpkcnNvR2o3V0R2S00w?=
 =?utf-8?B?UzNNUTQ3bVVoeU9VVGtTVCtTaFJZeWhqbCtYcXB0QzlEaU9adW52U21JOWZn?=
 =?utf-8?B?VkZpNXdmMkU1NFZycm9kaVB0RXRydzFRZW9aK3ZiaU9VY3M0bGFJaDh0VmJC?=
 =?utf-8?B?eWJQL055TFBHOTlteDlYd1RIcDVuMDByWDdvcEszMm95bSt1blF1anU4MVdm?=
 =?utf-8?B?MVBGbEpQYUFTajFEVEZkSS9mZ1ZTYy9jRm1mOWl5ejd1Ky8vV3hWbTVjR0FB?=
 =?utf-8?B?eVc3cU1yN1ZmZWlXcmpDK0JybHQ3Q3lxZzZXS05VVG5GNmltN2xVM0k3UkJ5?=
 =?utf-8?B?ZlZLbnZkSHlOczRLLzZwdlVmTXBjbkE3em5aNTYyOWVsRjBQWDRSZHByMzJJ?=
 =?utf-8?B?WTBzaEdIZUMzeGtvTDVJbGNqeFpXQ0JUdmJ2QW9tTkxySC9ZZTVGbThYeDZ0?=
 =?utf-8?B?MHhFYWtFSWJBQUVmZ0p3VHFDTGFKQjBibEdmZkxCUVRnZkcwQjJ5eldMV3Nr?=
 =?utf-8?B?YnM3NFdEVllCTC9RMjhjTVptNjZuN1Uxck1EeWtiS0lGUythUlFqQWdzNUwy?=
 =?utf-8?B?SFR5VzJKaHo5VVFydzljYU9MdTJaS0M0TDZPZ1Z1L0dKaGZraWhRRXIvZGhQ?=
 =?utf-8?B?Zjd0QThyaVZLUU41YVRKdkl4UXh0NUhNbWxrWXNzbDA1bUFKN1J2c2p4M2Va?=
 =?utf-8?B?Z2FsK2RUM3lJRlFmK3AvTFV2SUwycUN4RFpQN1RnZjRBVGNUbUxNZUg3Qmk0?=
 =?utf-8?Q?/CQ5nC1iFWrar3sRqSQELvR7G1ytAg08tWVDQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU9MMlp3R0dyc2g3UndJWEx2czdxMlp4amdsT0RsS05MUkJDbVQyVWlVd1VB?=
 =?utf-8?B?OVNqV1FqeFI3VEJRVEZsQ2RYL3k0VWQ1Rzg1RGxQcGo2WWVOaEhVZWJtMWxt?=
 =?utf-8?B?WWhscTVUNjhqZnNzS2kySzgvUHU2a2dDYkIyMEkxdW1WZ21MM2pmS1UrQURp?=
 =?utf-8?B?U09oRFRkN1ZsRDFMTHdIeTBNVUFQbENIRkdkSHlRZDQvakhKQTFWcEQwbjNE?=
 =?utf-8?B?eTlSZ3BJQlFGanZQYmtyN1dOQUU2UkoxaXhyNk03d1pMeDJZeVFDK00rYkoy?=
 =?utf-8?B?ckFrMDQ3R2RVOHYwT0hQRlVKQWsxcGtLL3ZkUG5aY3FTR1M3bkI4YUNTM1lq?=
 =?utf-8?B?QzJ2WHRwbERpa0NGc3V6alVaUWlQL0o1cmtSNHZod1FLTjNCcTZ2enU5Yy9R?=
 =?utf-8?B?cG5kVTVDQUFYMy95MHZCMXBrS1JPZTVwUUNIY1ZEWHF6TkU3eFcwcmJTOC96?=
 =?utf-8?B?dloxamp4MWtwYldObFRuNFJnNzJhS29CZkp4aXRQTUhyWmkwMWx0R0pFVWR6?=
 =?utf-8?B?cHY2NWNycTNzL1UrNkRhYlFDUitOejJCWTd1OHFxNFg1T2dXOEtOVGRnY3VI?=
 =?utf-8?B?anNsRUozTHpQRUMzb3duVnF6NFhxUXRvNlBrdFU5OW00NmJLTlBCVktGOTJK?=
 =?utf-8?B?SlBZV3NUUlB5Um0zR3JhRFYwbXNIRXkrRGEycVVHQmZkWU9jajJvWVFkOXRC?=
 =?utf-8?B?RTg1a1V4TUovWitQMzNMS0hEeVY5NU02QmRWRk5aeWVhTGxpblNYL0VwdURt?=
 =?utf-8?B?OHJrMEY5N2ErZjlkT2p4WEhqOTFjZURWWXI5YlJ1dHpVbFhwTThKUi9sTTZ1?=
 =?utf-8?B?WUlkd2t1a2hGaW8xblQ2RThzcHl4MENCU0RaNWlkNjVIbHIxYjNGQ1BzdVky?=
 =?utf-8?B?K2dKeTNaMHJMREhBV1VLQXJKbmxtalFmajFVU204S1R1cElLeERneDBoZWZa?=
 =?utf-8?B?eURuekwzemlNcjVXOGU4N3BjM0RmcXNOUGlwejk1NmdnYWNodzBMWk1LanR4?=
 =?utf-8?B?MW1mdmc2eThsMER1NnIvVVZjbHBtRVJuSTMwaTBPbzEyY3lWUUVMNVhDUFlm?=
 =?utf-8?B?REVqYzJ0djlVOS9Cb1lwcWJ4K1h5VWcwQXY0QUNheFI0Ti9jQmRCNCtOSGFG?=
 =?utf-8?B?NUVCa0psUXZwWmhhT0FhZWltNkNRSEdvYWV3dEJMSk9CRGxaR2Q2QU9UL3JG?=
 =?utf-8?B?RURUL2plR2xHQ21QNHVCU0ViQStmS1hmQ1R4Zzd4RzV2Y0Y0QlIwZk11N3JO?=
 =?utf-8?B?d2dIaFNpT3pHTldnL0RLWVVyem15cndOT2tKenlndUpwV2daR3FWRkhVZS9G?=
 =?utf-8?B?ZkdPTkZ6YllvV054TTc4SVhNUUF6RlM2TE5OSkxxVnF2ekFxQmtMS3lUcHZt?=
 =?utf-8?B?MXZsZmRpbjFUcTczZndEYlNnNjVNb1pkNXV4K3FXUWVtYWhrT2hZNHQrNDhn?=
 =?utf-8?B?VU4vaTZ6RmZRQnptSWFmNDl1T3grOEJjZkZjVE1NVGN4d2dBUzh0andQdDlq?=
 =?utf-8?B?UXFhQktYZ3R2dm5GN1hCdWkrNHAzWGRmdE1XeWhjWit1dkRjL1pnS2ZRY21k?=
 =?utf-8?B?TDlxejFhNGJMRmZUWURZTlh1MjhiQVpUR0hhdWZBeituS1Q5bkhWanlkU0tp?=
 =?utf-8?B?eHdWMkRnTzU1ZzRrL25tb0hpcHJYbVNhdjFJT3BSc05uU2Roa2xDNEJSTmRq?=
 =?utf-8?B?WFZoZUN5Z0grNHdUS2hUMlUreUtrQTQyRVNaMzhBNXNSRFR3N3Q2aWc0dkFl?=
 =?utf-8?B?OHRZTm5mN0tYSlNuRmNXSk01MUpBdDJFc3llNEFnYzFkZUhQbVA1QXJWNXI4?=
 =?utf-8?B?SllZNUFsRlZ6R05lRHhXOGVlUmw2Q2IwNzVSVFErREk3Z2N3WWlmVU0xUC9T?=
 =?utf-8?B?RTMvWnp3RFU0aTdjRkdLU3pENlJlRzl2TzY3Wk9QT25oSTNKa25RdEZFRWFN?=
 =?utf-8?B?TkRGWFRaSFFMMDlrYmY0RHN1VzIvK2Zidy9udGtNWWNMQ296QXo4WVQra0s0?=
 =?utf-8?B?bHpqLzFZMnVOcFNabTh2WkZ0a1BxZDZzalhvN1FDQ0tEaFRwTkFGRlkzMnB5?=
 =?utf-8?B?YzRIZWdvbnBPemIyU1ZpRUZVcE5tQVJXVndFajRpM0dsRzBuaTFzMkpqeFRH?=
 =?utf-8?B?KzVjOHJRMEo4aDFCSzR6VnpWK2hHTFJiZlphRWVLeWpqdEZCV1VPTVR6UVlY?=
 =?utf-8?Q?v3cMvkntybpMm5iQoj0KLKRM1vA1eEqoe0tIPxppxBT1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d78bcb-89a2-44d1-d326-08dceec6d104
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 16:14:45.6929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAHmgLcHOfguFAlJ3J1xOA57aZebzdY+ksIjQK3Qbh3oiU2tkyqGJm0yA6NBEvVAedvooQF0XXavAAoZTv15CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMDg6MzEgQU0gQmFkYWwgTmlsYXdhciA8YmFkYWwubmls
YXdhckBpbnRlbC5jb20+IHdyb3RlOg0KPiBPbiAxNy0xMC0yMDI0IDA5OjEwLCBTaHVpY2hlbmcg
TGluIHdyb3RlOg0KPiA+IEluIHNvbWUgY2FzZXMsIHdoZW4gdGhlIGRyaXZlciBhdHRlbXB0cyB0
byByZWFkIGFuIE1NSU8gcmVnaXN0ZXIsIHRoZQ0KPiA+IGhhcmR3YXJlIG1heSByZXR1cm4gMHhG
RkZGRkZGRi4gVGhlIGN1cnJlbnQgZm9yY2Ugd2FrZSBwYXRoIGNvZGUNCj4gPiB0cmVhdHMgdGhp
cyBhcyBhIHZhbGlkIHJlc3BvbnNlLCBhcyBpdCBvbmx5IGNoZWNrcyB0aGUgQklULg0KPiA+IEhv
d2V2ZXIsIDB4RkZGRkZGRkYgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYW4gaW52YWxpZCB2YWx1ZSwg
aW5kaWNhdGluZw0KPiA+IGEgcG90ZW50aWFsIGlzc3VlLiBUbyBhZGRyZXNzIHRoaXMsIHdlIHNo
b3VsZCBhZGQgYSBsb2cgZW50cnkgdG8NCj4gPiBoaWdobGlnaHQgdGhpcyBjb25kaXRpb24uDQo+
ID4NCj4gPiB2MiAoTWF0dCBCcm9zdCk6DQo+ID4gICAgLSBzZXQgcmV0IHZhbHVlICgtRUlPKSB0
byBraWNrIHRoZSBlcnJvciB0byB1cHBlciBsYXllcnMNCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTog
QWxleCBadW8gPGFsZXguenVvQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hl
bmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hh
bC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhp
bWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93
YWtlLmMgfCAxMyArKysrKysrKystLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9mb3JjZV93YWtlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3Jj
ZV93YWtlLmMNCj4gPiBpbmRleCBhNjRjMTQ3NTdjODQuLjQ5Y2ViMTZlODJlNCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2ZvcmNlX3dha2UuYw0KPiA+IEBAIC0xMTUsMTAgKzExNSwxNSBA
QCBzdGF0aWMgaW50IF9fZG9tYWluX3dhaXQoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0DQo+IHhl
X2ZvcmNlX3dha2VfZG9tYWluICpkb21haW4sDQo+ID4gICAJCQkgICAgIFhFX0ZPUkNFX1dBS0Vf
QUNLX1RJTUVPVVRfTVMgKg0KPiBVU0VDX1BFUl9NU0VDLA0KPiA+ICAgCQkJICAgICAmdmFsdWUs
IHRydWUpOw0KPiA+ICAgCWlmIChyZXQpDQo+ID4gLQkJeGVfZ3Rfbm90aWNlKGd0LCAiRm9yY2Ug
d2FrZSBkb21haW4gJWQgZmFpbGVkIHRvIGFjayAlcw0KPiAoJXBlKSByZWdbJSN4XSA9ICUjeFxu
IiwNCj4gPiAtCQkJICAgICBkb21haW4tPmlkLCBzdHJfd2FrZV9zbGVlcCh3YWtlKSwgRVJSX1BU
UihyZXQpLA0KPiA+IC0JCQkgICAgIGRvbWFpbi0+cmVnX2Fjay5hZGRyLCB2YWx1ZSk7DQo+ID4g
LQ0KPiA+ICsJCXhlX2d0X2VycihndCwgIkZvcmNlIHdha2UgZG9tYWluICVkIGZhaWxlZCB0byBh
Y2sgJXMgKCVwZSkNCj4gcmVnWyUjeF0gPSAlI3hcbiIsDQo+ID4gKwkJCSAgZG9tYWluLT5pZCwg
c3RyX3dha2Vfc2xlZXAod2FrZSksIEVSUl9QVFIocmV0KSwNCj4gPiArCQkJICBkb21haW4tPnJl
Z19hY2suYWRkciwgdmFsdWUpOw0KPiA+ICsJaWYgKHZhbHVlID09IH4wKSB7DQo+ID4gKwkJeGVf
Z3RfZXJyKGd0LA0KPiA+ICsJCQkgICJGb3JjZSB3YWtlIGRvbWFpbiAlZDogJXMuIE1NSU8gdW5y
ZWxpYWJsZQ0KPiAoZm9yY2V3YWtlIHJlZ2lzdGVyIHJldHVybnMgMHhGRkZGRkZGRikhXG4iLA0K
PiA+ICsJCQkgIGRvbWFpbi0+aWQsIHN0cl93YWtlX3NsZWVwKHdha2UpKTsNCj4gDQo+IFJlZ2lz
dGVyIHZhbHVlIHJldHVybiAweEZGRkZGRkZGIG1lYW5zIFBDSWUgYWNjZXNzZXMgYXJlIHVucmVs
aWFibGUsIHRpbWVkDQo+IG91dCBhbmQgZGV2aWNlIGlzIGluIGJhZCBzdGF0ZS4gQXMgY29tbWVu
dGVkIGluIHJldjEsIGFjY2Vzc2VzIGFyZSByZWNvdmVyaW5nDQo+IGFmdGVyIHNvbWUgdGltZSwg
d29uZGVyaW5nIGhvdz8NCj4gDQo+IEFja2VkLWJ5OiBCYWRhbCBOaWxhd2FyIDxiYWRhbC5uaWxh
d2FyQGludGVsLmNvbT4NCg0KRm9yIG15IHRlc3QgY2FzZXMsIHRoZSB0aW1lIG91dCBpcyBkdWUg
dG8gaGVhdnkgcGNpZSB0cmFmZmljIGFuZCBkZXZpY2UgY291bGQgYmUgcmVjb3ZlcmVkIGF1dG9t
YXRpY2FsbHkgbGF0ZXIuDQpJdCBzZWVtcyBkZXZpY2UgaXMgbm90IGluIGJhZCBzdGF0ZSwgb3Ig
dGhlcmUgaXMgYXV0byByZXNldCBmdW5jdGlvbiBpbnNpZGUgdGhlIGRldmljZSB0byByZWNvdmVy
IGl0c2VsZi4NCg0KU2h1aWNoZW5nDQo+IA0KPiBSZWdhcmRzLA0KPiBCYWRhbA0KPiANCj4gPiAr
CQlyZXQgPSAtRUlPOw0KPiA+ICsJfQ0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4N
Cg0K
