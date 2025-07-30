Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE43C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 06:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325C210E035;
	Wed, 30 Jul 2025 06:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKizM7NY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95EB10E035
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753855648; x=1785391648;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LzzLHllp6yFIjeb0HkY3HNKfLW/c2X0lBjP+AakLDTg=;
 b=NKizM7NYC9tGsmk8nFzJxmD6vb4+3aoM9Jv5hxvCYStzv+iY8x1VcZl+
 LKEB6oweER4W8PfYAs0LFsHDClsdt1kRkd86UwUsx2C18t+zegt1pRWNP
 wafNgcVpNXQh1cr3ogaGI7gIXl6/mgCd25Lli6mSkuog/n0Nn7zSXMCVp
 eOhjtNMXz8OKNd6W1kjuatvDSq8hpQ7C+MY3cs370gl4uukQQXCPFBlc/
 i9cuygmAmnQZlVrkjWANpnZCL9+DDPWGBwirZ+GnFGa51HH553509JZP9
 hs6bX7M0lxOB6LXIF6zD6/xO//69c4hK6sFjx7q8ddXWeNX/Jmicflus3 A==;
X-CSE-ConnectionGUID: b0bLnmnaQnuuuEtSTXxF7w==
X-CSE-MsgGUID: jLspoNdERmGwpIOvTCGBPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56031249"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56031249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:07:27 -0700
X-CSE-ConnectionGUID: 3A7wa52OSti5cYW0mzw4Ww==
X-CSE-MsgGUID: 9T+p+hIVSpm8KzhDZGfpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200080195"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:07:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:07:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 23:07:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbjM07OCgq4+XP+3GSVzGps7fsdMbEZLEd/IHz7xzcDCxQWORFDZsuCElCmQI5SXgBsZ8UF2CJIBaWW79+Is8FPiBwaOo6qWq1aP3PtlZjEj0FB6d/oOwLdWmPGpvwCfE37/7f9J+BEvcfVv/Oqp+JGO5ku4hymWKogoQs8iL5Diyw6EpRa/zj9yT0kiAwwgZq+XVeT3vuBB9ZFuxG8bgsJN7rdvLB3cerCY8lhnZ+Y3b6zJahSMtbF/3nw3XOkY86NnN1vjYHyhsaX76m7ZokXG2T9qR8ixbsFyxX5HNC27kSuXvolgd7TeRetVii2W2N8Z+yen1m2AN5rIbtXnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDi5jmhlT1iy3s5vwUElUdujUwk346quttm/Dft2v7c=;
 b=ElPevGmrxVSDmIlEWaTTyaUs28hUxqp+KmYhfKHln8xHsGEj8sL24dWWHtioywDdS1WQnrICQzBNWQbMUHbURue4kRNoOnlcknWnJew0J8s4c9uzQt3f8ftTUb4bWqLfMFQMiH6YYq40zOVuxOZPFqPHCDeA8kbaxzxGn+oYOYcfH1MveUameaQbY61cR2wn94o+MZKotd2t9a8jlpVuQNqjDR5+U4LFS5AqhX3uJx9LBzFifcZsR/NH25QJm6awftmHdv2397CYqdeY52Rv4QZdmvSGMnEfvzFP2GbonxgTkQ7PZHwX0Q7KZA9Zor9sXoqX0puSJNOuzrn6HJi2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB8374.namprd11.prod.outlook.com
 (2603:10b6:806:385::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 06:06:57 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 06:06:57 +0000
Message-ID: <59b60675-443e-4f68-8728-ea13429b0666@intel.com>
Date: Wed, 30 Jul 2025 11:36:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
 <aIhe+nJCv5PQ2Y1d@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhe+nJCv5PQ2Y1d@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c130fa7-6d5f-4283-72ab-08ddcf2f4a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2FsWGlHeWVRL2YyS2xkSVJXWHVSdVVFVmJuaEl3ck5jMlBtUFBIMmRMNUpi?=
 =?utf-8?B?SUF0TngyRmFHSTNmaEhMUGI2SnVVSFRTVDNxMVM2MWJxMEppTkMvTTMxT2g2?=
 =?utf-8?B?L0czR3B2LzU5NGgzVzFjL2c2QUhldGYzRmZrd3BaNWp5ZE5HQ3ZWc1A5Q3V5?=
 =?utf-8?B?QkhRejFxMStVcVJsUCtHdGZoeXlldWs0cTRnNlplZE94MzgrUkF0MlZybTUr?=
 =?utf-8?B?ZGxlWWVOMFlycXhTeE1XSnhETGp1SVBnZ2Nzb1l6ZzlsLzRCak1TbURlTnBa?=
 =?utf-8?B?NTlYcXpPZzlUeGZQWFllOHltTEYwT090TENuRHdvV0VrTjNtU0R0WHNtZTlv?=
 =?utf-8?B?bCtpU1hmNjlFZVNuNWlTbkpFeDNwZ0xlRzkzRUtSQWhKTUNUa2N4R3lVU2RO?=
 =?utf-8?B?M093eHVvZWNvYzlNb3MrTlJaSSs1ak5YNGR1YjA1bG1uWEpsVVRiR25PbDZQ?=
 =?utf-8?B?S1UvaHIrQlNkcHhPVnFYOGMwSmxCa3VzNm9tTS9NUnRyVXhrUlFyaVhzNnFq?=
 =?utf-8?B?S3J5UC9yUm1iem5PNGJ1aFlJaGNPSm00Nzg0K3gyRkZYRWZEc29hSEI3YVF6?=
 =?utf-8?B?bHVjNDdRLzI1RWhyL29EaUlXZS9KSzlyVVN1MFJUZHBqdWF2SVBWNlNSWTlP?=
 =?utf-8?B?YStDNlRQbG5sOXJXY0Zydkh1T2lSNHd6R2Q5djhmZnpUSm1QdnFtOEhranYy?=
 =?utf-8?B?ZHFYYStIZnZkRUtEOW9CaTNvK1pnYTNXSnVsS3h6VXVhNjlENFhXT2VteG9R?=
 =?utf-8?B?cENYUTlsdGpCT2xHY3ZQblRaUkEzc1dNSVpySVRTb3dnWE01Z0owemVVME9r?=
 =?utf-8?B?MTA4V3kxL1ZVaUg2ZGxrSU00M3B0Unc3aDA4T3cvUS9pT1NyUTdabU1rMXpZ?=
 =?utf-8?B?dGdYZVVyWnFBU0l6NDRRdEVzZ1g4R2tEVkUweEZ4d2UrOW1mdkE0RHdBRGhB?=
 =?utf-8?B?a3JMY2JKeHdFS2p3TURrZUdoQk1Rc0xTNG9KR3BZTW5Ic3VUYkY1TlVNNzhD?=
 =?utf-8?B?R2ZwdStQVkNiZTlhVm1acHU0R3cvSXJaQ3J0bzhlWXFXSFJyeUc0NTc4MTVX?=
 =?utf-8?B?ZFgvY05QODA4VXRHYVN5V1dZV3BTY0NLdENlR0VDYWJJWlJoODNlMUUyV3V5?=
 =?utf-8?B?ZjRQelNTUWNxOWpSK0xBelBCNHZ2dXUrWTFQTGJReFJEZ0YxNlhQczcyL0Jl?=
 =?utf-8?B?YTVYR2FaZUxjazZ4M2tCWmloL2tMT1pTcFJuWm5xSko5ODB5THB0M0d5L1R2?=
 =?utf-8?B?dUFpaThOeUhLTExDN01ocWJkUDh1Q2VGV09WZVUwZW9tbkZLeDdzcFI1ejNM?=
 =?utf-8?B?Y0xIRUlDUEd4TmdxVzFkYjFCMGdsczJrUTNOeVltcElrUTJJeWMwckxxamhP?=
 =?utf-8?B?VGEyZy9NVGZMcERrOWFJZ1l5UXppTU5iS2pZTXh3dWY1cTZSdHlQS3FCZHFU?=
 =?utf-8?B?RVR2emxpdWx4RWlwdzZNUEVZRGd4YXFXTUZQdGNNSk1UQmx5K1dDWEt5L0Zr?=
 =?utf-8?B?RXdiWnBlUS9Wdzdyd1JxVWJiNWUzcThPZVdNM1R5akxxcURNL3RxV2dJeEdn?=
 =?utf-8?B?MWxtdHNDbll0cml5RnVhWmw5bkcvRWhFSWZwMmlKbGxIQUFtZmNCYkdDQmhl?=
 =?utf-8?B?MjhGNklHM0J2ZjlFWWpzYjB2VkdyMklnREdSVmJNRDJIQnZYajlLbUZHOVdF?=
 =?utf-8?B?N3NoeU9KVVplUXY1Y1FqVXF2TkpkRzVIY29LYk1MTVZUR2Z5cms0eTZvK1pv?=
 =?utf-8?B?ZU1KaTJ3Zk9IdFppaXpudXU2b3dJeVFGa2JiZERQbVFJRnBUOXdnNVJoUFVP?=
 =?utf-8?B?cVBwNTBrekxmdDBvNU1uR2lYbFhyQW83MHZ1ZUJEdG1Xc1JlSlMxL2F0MmlJ?=
 =?utf-8?B?VjNzSG5Sdnh6bm9XNDhuS3hSb3pLWkZUOHZYOU9UWWluZlRPblBkWWtIMy9G?=
 =?utf-8?Q?szWdWMT8N+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWR0aXZ4bG5jYmcrMktHbTF2MmwxQm5Wd3VCb28xdGdEd3NyUXpsaWZCbDNX?=
 =?utf-8?B?UCtYZnVQVk5URjd4N0JBcC9kMDJpamYrL1hHSENHUnI3UjJHeW9kWjJjYzRK?=
 =?utf-8?B?NUdpK3FLblk0S29CcXdQV2M0bGRFUDUzN0lUMEcwV1ZsU2RnR0RHUk1PYnVn?=
 =?utf-8?B?SDM3T2daU280OUU1UVk5RkYwUDFDeFJYY2tMQVhSYnFsbjk2N0VvcFdsZ1FP?=
 =?utf-8?B?eVcrUUhXcENaTVJUa1c0Qm0rdUVTQ0xNL0lWZFJzU1pEdUVZQitXdk8xM1lD?=
 =?utf-8?B?RmdNczA2dVp6MXVDZTRpMWdHR3A0bU9Sc2wzYTNZSHExQTJlZGhtaFhCTUQr?=
 =?utf-8?B?blRYaE5mYkZPMzVxQ1RaL1cvcm1Ya25jN2NMbklHTGF5S2t4Zlo3SEY3MzVm?=
 =?utf-8?B?b1dHdlFlN0NNRlFQZlhZeC9QUkt0QkNHbG42ZWw4ZkZhYlh6R3ByYU1pdG5T?=
 =?utf-8?B?K2tianNQdFpodVBDeXFweG03SFVtKzY5LzBxUnQrTWpNc1Mwb25GT3hoUzky?=
 =?utf-8?B?WHo2TGp6cTMxWE5yT3p4c3hua3RvTEhSaTNka2dkUkdya01nYVRFYVAwQjFl?=
 =?utf-8?B?YVBaZVB5TTVkT2ZJU3RBd1hFNXBDSjhpNnFpZUFsSThpUG9TWXVwb2xuRDBK?=
 =?utf-8?B?WUh6Qy9yMnNTeUVkOExpbXh6TzQwOW9FR1ZPUzBvN0VJd0tGOEoxL2x5ekRO?=
 =?utf-8?B?UzZQYm1PQnBDWVc1R3JUZ0xYcGhFdFdwRWFUaXlPQ3ZjOGYydTFhempJRDZZ?=
 =?utf-8?B?R0VPY3RaVE4vRzN1b2xrU3hIV1dncEdTM3ZNSEtSbXlKVXdncEwwcE13ajJC?=
 =?utf-8?B?WXhuZGtlMS9scnpVL2xhYlJQa0hMYmdOeUdrTU5wZW5YQUJJSlFnWG0vVUw2?=
 =?utf-8?B?UEE1M1k3bHBUM1pHaTBpcEhmeHM1RzZaVDBIYnpWT1l5YjVOZFBLYzZhNWlO?=
 =?utf-8?B?T2FEaHpIdCsrKytVTHpjU3lwVk9YMTJDRDhWeDdUN1kyclBmc0p4SUIxd21N?=
 =?utf-8?B?UWJ3UFJINnBHNnlyRGFteUx2UmxSMFU0RXBGSSt1NWphbjFnbU82VFF5ZmZM?=
 =?utf-8?B?WFJ3b2ViNk9IK1VqZ05LQkJjb0VvVmFHc1dCbGcwMDNWVHdpYnl1VXNMME93?=
 =?utf-8?B?b00rclFnRkNwS3Y2ZVFBTkNFTGVVUlc3bDNDQVJ4ZmRnRVovb2VLd0lSaUs2?=
 =?utf-8?B?eWpDUmVuY0pDQUJqU0svVlFCTzhueDFIMXZzU0xIbGNqeWVDV25DYnVhNmJh?=
 =?utf-8?B?S1VHZklZQWY4N0l1b08rNFhaNWdsZXcvT2o0dVRqRWRhdERmallOT250cGp2?=
 =?utf-8?B?elMrQjZzRG1wVStGMExtVlY2c05kblFNVHJuek5IcjJ2QzlhL2FJVUJsWVl2?=
 =?utf-8?B?THNkcVlmRmUxcDhvUm9YK3pkK09BT0l0SzlEZ3BkK3E1U3hDNEpha3kzRk1y?=
 =?utf-8?B?Qmo2YWVQNzJuUWdIeG5rM01OOXN4ckJ3dWFaMnVPZDNtdTlpNSsvSThJaml5?=
 =?utf-8?B?emJhQ2NoeVE3eHJVZnpuL1Vqc28ybStVN21ZRW5uSjFxTmV0eGh3OXJBV2dL?=
 =?utf-8?B?Ymc3Y1ZqSFFOSmdySVZuR3d6NFNKcEJxeUd4VVJVYzFkQU5zb3FISTR5ZS90?=
 =?utf-8?B?VzRzMGRTUWJvQnhpN0t0eUlVanVRNlpSZzRxR09kdnM1cnFEam5zeTJhR3RB?=
 =?utf-8?B?RzlkS1NaWVdBQXAzZmFiQU9EYjIxZ213czYzVlJxTUFRZjMxUzVuZEZFRU9h?=
 =?utf-8?B?d0U1ZnVlS09PWVBhK3hDYmpKazFKNjhtZUFPL2hzaDRQczNFR0FwUS91Y3gy?=
 =?utf-8?B?cHNvQlpRZzFUbTlKOG1iSDVMY2MwZ1dObGlGSm1FZnBOenk5Z1JuTXRIcDdD?=
 =?utf-8?B?TTVtKzN4bU1KbExEeFRVdmdsakJYRC9ITHFWcVQva040WHVDYjBTMTRIYi9x?=
 =?utf-8?B?cW1ka0NuYklpUSt1WUJFejlBMFhGb1pYbXJPTE1HRVJZZ1dYQzc3NXEwNVpY?=
 =?utf-8?B?TU1LUDlxc041R05INlBMWk9VejNzVTBvMXJtUjl4MjBhMGNWYTJlNW9JdW8r?=
 =?utf-8?B?MTdYaUVPWTJaSm4yNURhaVh5V0lhSnZlR3hPRmJEbnFJK0NlWitvU0llbmxm?=
 =?utf-8?B?N1RIRUp4WjlxNDFuQUxva1ozbTFTYUFsamlySzNoR1RuRWxtVFh5bXc4dmNn?=
 =?utf-8?Q?gk5DupAqE/R51vd+tvOortU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c130fa7-6d5f-4283-72ab-08ddcf2f4a32
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 06:06:57.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV6HzxR/epyiin81dqT8m8m5rTVxmHWrngfqOJVWm/U8w8mvMCWRAadERmWg8ravf5apioWci5yN7dhE3/A92KRvYK4H9e9Akp3jhjZ9COs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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



On 29-07-2025 11:11, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:23PM +0530, Himal Prasad Ghimiray wrote:
>> Restore default memory attributes for VMAs during garbage collection
>> if they were modified by madvise. Reuse existing VMA if fully overlapping;
>> otherwise, allocate a new mirror VMA.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
>>   drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_vm.h  |   2 +
>>   3 files changed, 135 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index ba1233d0d5a2..79709dc066b9 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>>   static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   {
>>   	struct xe_svm_range *range;
>> +	struct xe_vma *vma;
>> +	u64 range_start;
>> +	u64 range_size;
>> +	u64 range_end;
>>   	int err;
>> +	struct xe_vma_mem_attr default_attr = {
>> +		.preferred_loc = {
>> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
>> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
>> +		},
>> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>> +	};
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> @@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   		if (!range)
>>   			break;
>>   
>> +		range_start = xe_svm_range_start(range);
>> +		range_size = xe_svm_range_size(range);
>> +		range_end = xe_svm_range_end(range);
>> +
>> +		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
>> +
>>   		list_del(&range->garbage_collector_link);
>>   		spin_unlock(&vm->svm.garbage_collector.lock);
>>   
>> @@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   			return err;
>>   		}
>>   
>> +		if (!xe_vma_has_default_mem_attrs(vma)) {
>> +			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
>> +			       xe_vma_start(vma), xe_vma_end(vma));
>> +
>> +			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>> +				default_attr.pat_index = vma->attr.default_pat_index;
>> +				default_attr.default_pat_index  = vma->attr.default_pat_index;
>> +				vma->attr = default_attr;
>> +			} else {
>> +				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>> +				       range_start, range_end);
>> +				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);
> 
> I missed this corner, if you call from the fault handler the VMA it
> looked up originally could be gone, if you modify the VMAs you need to
> signal the fault handler to lookup the VMA again.

Makes complete sense. Will update in next version.>
> Matt
> 
>> +				if (err)
>> +					return err;
>> +			}
>> +		}
>>   		spin_lock(&vm->svm.garbage_collector.lock);
>> +
>>   	}
>>   	spin_unlock(&vm->svm.garbage_collector.lock);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d3f08bf9a3ee..003c8209f8bd 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>>   	}
>>   }
>>   
>> -/**
>> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> - * @vm: Pointer to the xe_vm structure
>> - * @start: Starting input address
>> - * @range: Size of the input range
>> - *
>> - * This function splits existing vma to create new vma for user provided input range
>> - *
>> - *  Return: 0 if success
>> - */
>> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +static int xe_vm_alloc_vma(struct xe_vm *vm,
>> +			   u64 start, u64 range,
>> +			   enum drm_gpuvm_sm_map_ops_flags flags)
>>   {
>>   	struct xe_vma_ops vops;
>>   	struct drm_gpuva_ops *ops = NULL;
>>   	struct drm_gpuva_op *__op;
>>   	bool is_cpu_addr_mirror = false;
>>   	bool remap_op = false;
>> +	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
>>   	struct xe_vma_mem_attr tmp_attr;
>> +	u16 default_pat;
>>   	int err;
>>   
>> -	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
>> -
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>>   	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
>> -					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
>> -					  NULL, start);
>> +					  flags, NULL, start);
>>   	if (IS_ERR(ops))
>>   		return PTR_ERR(ops);
>>   
>> @@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   
>>   	drm_gpuva_for_each_op(__op, ops) {
>>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +		struct xe_vma *vma = NULL;
>>   
>> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
>> -			xe_assert(vm->xe, !remap_op);
>> -			remap_op = true;
>> +		if (!is_madvise) {
>> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> +				vma = gpuva_to_vma(op->base.unmap.va);
>> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
>> -				is_cpu_addr_mirror = true;
>> -			else
>> -				is_cpu_addr_mirror = false;
>> -		}
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -		if (__op->op == DRM_GPUVA_OP_MAP) {
>> -			xe_assert(vm->xe, remap_op);
>> -			remap_op = false;
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				op->map.is_cpu_addr_mirror = true;
>> +				op->map.pat_index = default_pat;
>> +			}
>> +		} else {
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				xe_assert(vm->xe, !remap_op);
>> +				remap_op = true;
>>   
>> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
>> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
>> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> -			 */
>> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> -		}
>> +				if (xe_vma_is_cpu_addr_mirror(vma))
>> +					is_cpu_addr_mirror = true;
>> +				else
>> +					is_cpu_addr_mirror = false;
>> +			}
>>   
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				xe_assert(vm->xe, remap_op);
>> +				remap_op = false;
>> +				/*
>> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
>> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
>> +				 * we assign op->map.is_cpu_addr_mirror true
>> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> +				 */
>> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> +			}
>> +		}
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>> +	if (is_madvise)
>> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>>   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>>   	if (err)
>>   		goto unwind_ops;
>> @@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   		struct xe_vma *vma;
>>   
>>   		if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> -			/* There should be no unmap */
>> -			XE_WARN_ON("UNEXPECTED UNMAP");
>> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
>> +			vma = gpuva_to_vma(op->base.unmap.va);
>> +			/* There should be no unmap for madvise */
>> +			if (is_madvise)
>> +				XE_WARN_ON("UNEXPECTED UNMAP");
>> +
>> +			xe_vma_destroy(vma, NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>>   			vma = gpuva_to_vma(op->base.remap.unmap->va);
>> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
>> -			 * to newly MAP created vma.
>> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
>> +			 * VMA, so they can be assigned to newly MAP created vma.
>>   			 */
>> -			tmp_attr = vma->attr;
>> +			if (is_madvise)
>> +				tmp_attr = vma->attr;
>> +
>>   			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			vma = op->map.vma;
>> @@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   			 * Therefore temp_attr will always have sane values, making it safe to
>>   			 * copy them to new vma.
>>   			 */
>> -			vma->attr = tmp_attr;
>> +			if (is_madvise)
>> +				vma->attr = tmp_attr;
>>   		}
>>   	}
>>   
>> @@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   	drm_gpuva_ops_free(&vm->gpuvm, ops);
>>   	return err;
>>   }
>> +
>> +/**
>> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
>> +}
>> +
>> +/**
>> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits/merges existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
>> +	       start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index a4db843de540..f7b9ad83685a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>>   
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

