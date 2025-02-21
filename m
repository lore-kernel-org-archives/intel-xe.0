Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56E5C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 20:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80F10E213;
	Fri, 21 Feb 2025 20:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3rmRtq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0210E213
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740170328; x=1771706328;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7GAFR4AwS2n5FLrXDWpbz4Pei18DSDuScew9uz1ZmZw=;
 b=O3rmRtq+x6GXCjZskjWGPIBBVzyeMQA0ot9UUuNbfKLBL6CcsskizUZ/
 6w+RZIqanuqEquXguKH2Arg6VbKqxaw5rEgBMdCvMBMCe4iuOXO2gZT+h
 oq7dbL628CKFuMkXkVCH0V9oqJGWTK7PajXaevd0liG1cc0kIHQxoJLpX
 TV0E5KFFlhbCFGKeK29b4tR3LoUokv50bU5fkd4QQLGwYS5ThLHY4lUlz
 h9IN2Rh6e1A+9hH0oYuNpijvlKG9FXk6jTbj5+gunMW4hb6oefMvXmXwo
 IHMaMJol2iOVWGplg5A8qY7IMMOmGV5n2feADinV/k4uWrRnfW+XYuedf w==;
X-CSE-ConnectionGUID: WQJBjrFrS+KqgrI5KjLqLQ==
X-CSE-MsgGUID: P92d0aOEQaWQFqCk7yQGsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="43831866"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="43831866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:38:47 -0800
X-CSE-ConnectionGUID: wmR4udAdQAiBILpHMXSSqA==
X-CSE-MsgGUID: 9zalntibS/CRNHCF6BZ+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115185158"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:38:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 12:38:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 12:38:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 12:38:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de8koQjUfvJDbTDJuwG8Mh7DplKtlYmHB3qL/m+2cyIrHdLgcXp5GY+lJ15vVMCRAhHFKHV3rkMH7rHP6sRsD0CIJjaEQa6qzk0XfDyTRYEEiQPmpoqgdywsIv69EO1UHsRVYfCYku1bXcKNs1lWbOOIiZDy3vDH4Ocy5cJCND7qSErBteyy0xQX5Nns72YFhvBIoKiDZ34IhRlO4W7+c2puzGmpLWYnHm5uEhoKUy4/Wd7mAOMQQg3xT78bf6AuOhRSRBd7EFvWSBlk0Po+kCAcS2GLfUFa2z8M+OO40P8LM12PfG6UzR/R0L1YiWml255DkLUjQyJUkqisS/XvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxhAbyB9DwAW+EbJx7xALFZDOb48r3eO2nZw4NGTzs4=;
 b=cL/qCVgn/uVVD7pRY4BZwjMkr4TSy60KMBKhN58PUI5BVd9z9pw1snEmenoIhFWwjuJADkYLqJZlUoynghs2fT9UaM41sc94Aks2Nj4D6H4SDIeIHN64uvPETcFAvGk4I9Z2oX523Yt4JLyJc2g6qo1TCesGsihvMF5xkIhmSXI3oUsQlsW0wd/QQE63hGv9O0rNQVFCj+sWURnqCAf7Xw897g+r6WlXCj7fQ+3kDxxD+vOi8xHD88Rc4WDXeAEBebzVlAPeZmSFPe/x/G0LM2gFpF68/qVGN7n5ndRPsdJGZIsGuDKSIHN4qqlykhxHARb0mWc4bOKDx+Tx1onGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 20:38:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 20:38:41 +0000
Date: Fri, 21 Feb 2025 12:38:40 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/oa: Allow oa_exponent value of 0 (rev2)
Message-ID: <Z7jkUMbQNjfzATQt@orsosgc001>
References: <20250212162610.1432159-1-umesh.nerlige.ramappa@intel.com>
 <173941596458.1508100.5238417724237785982@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173941596458.1508100.5238417724237785982@b555e5b46a47>
X-ClientProxiedBy: MW4PR04CA0213.namprd04.prod.outlook.com
 (2603:10b6:303:87::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: eb04834a-8d5c-461b-fbf0-08dd52b7ba85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejNKckM2TkxtbTMxOUpBRFRWK2d0WThUZHJxc0t5bDd6YlBnZVJGcXRUMG1V?=
 =?utf-8?B?OGNnYlZ2VUl5VW9neFNzbXJ6aVhTVXlYaThQNzdCVGxBWnpNODB3K3hqYVV5?=
 =?utf-8?B?SHJwTGVTTHZ1VldLRXFmNExXVjNobkw3blFOcDdLa2V5eUUxUFNUMmg5ZUt2?=
 =?utf-8?B?T3JUOEJQRXFBemk5UWk5SC94VldvZ1FZb1d2VFpEeGV2S04xUXdHSDI1ZFY3?=
 =?utf-8?B?YldyN24rQnppeVZBTk5SMUVsS1RBbDdhdVBrSjBUK3EvaDNLQWo2Ym90cWZF?=
 =?utf-8?B?TStwdjRGY3FaYXF1Zm9ORXRzN2xib0pIcW5MaW9mZVlmL01iMmJ2bE4wbVlB?=
 =?utf-8?B?TjE2ZjRZZzJqSFo5K2lUQ21NVjVGbkhmODRGNm4zenRSNkhPNnR4UXJlNTNy?=
 =?utf-8?B?cWZlcGpmRkRpRitpR3VGM1ZuNVdGcEo1SHBXaExaZFB6ZVNKQnFpdUo1bkRT?=
 =?utf-8?B?ZkJoQ3BGS2xwQnNSRkcvb2lHT3RrYStWSzRMQkErS1Y3Y0F1U0JQVjFleE9D?=
 =?utf-8?B?eXhPZnpEdkNLQ0RyNXp6S3FYVjlKN2RkdWxmNWZEbno3QVZXMHJnclNFOExn?=
 =?utf-8?B?RWpINkhUWkZKR2xFWGtRQVlka0R3QlRsRitieEd4b0ZTcVlHQSt5aEUwbklu?=
 =?utf-8?B?ejlkcDUrOGdvbTFJc1dOdlI0SUNadzdUTGl5Skd4RWt1enY3S3cwZTVTUnZT?=
 =?utf-8?B?YXRYVmhrUFk5RUNwUHFyNzFKL3BHcWlocDRYSjFJS3huaUIycHVyak1nTVR1?=
 =?utf-8?B?Zm1RQjMvdWl4SnRQSmt5aTFVN0RuRmRtTWlSVWtvNkhCRE5wZExkRUdkcEVz?=
 =?utf-8?B?VVJDM3BJVHFhSDg5VFVlZlp3VTFSbnV4dTZPL2hwdEZhM3o5YWwvSTRHSndM?=
 =?utf-8?B?SkRHRGZWYzF1cHRaYlRDejIvTXVzVFNlWE81cC85L1hSSVZ0YnlsSlhrYjhu?=
 =?utf-8?B?Q040ZTdreUFIZFVBQllCREo0MTlEY013YmQ5Sy9RMWg4N1A3MHVXWFRnOFNj?=
 =?utf-8?B?TGNaRVAyYzA3clJuUXBTVzZieEVRaXlyOVVDVWVna294NUoyRmR3WVpFTC8y?=
 =?utf-8?B?WHpQZGplaTdRLzFzMXhoQ01kWGdhRU1kNTdLZVg3MkYwT1BLZWRSQlg2Vzg1?=
 =?utf-8?B?WXhtUHVtWWt4MWRWdTFPQm5aWklGcFpESnAwMW14RVdLTnJ2UlN0NTIwT3Fi?=
 =?utf-8?B?MktEdVluLzNqM2hqVXF0K2xoemJBVll2RU12NnpzV1NRaWlVSzh2Si84ak9K?=
 =?utf-8?B?c2NLVUtqZTJRaVhwNjBxTUVySjNPdi9LVlpJRnFOTzhFOGIrQ3U0QXYwT09H?=
 =?utf-8?B?M3JpSFJYVWtQZFhKbVdzajNZR25TUXhXWjlDNmU5ZitFaUl5b3Z1VEQrVm56?=
 =?utf-8?B?aUhEWjR0Rlh5UEpGOENxekpxV0thVmE4MlRUL2JxWnBmWUJUM043MXFzNXF5?=
 =?utf-8?B?Y2EzcEtQb2wwMlVyL3BYQWEzMVpmRGh4SVN4THd4MnVjL0xLbTFsQ0xldmQx?=
 =?utf-8?B?RFpycWUyYVBaWlpkbmZyY3hITTNRR0JzQzNRWHhmN0gveFFsajlQcElnb1J0?=
 =?utf-8?B?S3FSUkVsY21lR3JNUHpWQ1NvaXBZWG1IclE3MTRFQ3lYeE1WZ1JSS1pMTUtr?=
 =?utf-8?B?SjFURWliNUNzM0htV2YzSU5leXBSQWdNbnhxUGQwOUg5VFFqNXpRRlI4WG5w?=
 =?utf-8?B?cUpORFFZRjlhRnRrSE14K0RmRWtQckFjd2pSVURDSXgxMHJNMk1HaWltcTBj?=
 =?utf-8?Q?zR10voz5wR6aNo/71s+ZP2Mryl5FIlHdS5BHhmk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZ6eURkT0pGR25SNFd0eWRENGpGTnNwNDJnKzJiYnZIWTlGRXVTWndoaS9w?=
 =?utf-8?B?YTN4aVpzbG90eU5CVHhZYXBlbjhpeURFQURZd3RBRU1KeUs2S0pxbHd4Wkhi?=
 =?utf-8?B?dThiaGJyZGFoMnpubXArNzhoZnJpRkZObndneDhxbk84ZEtDQm10V3k2UWxJ?=
 =?utf-8?B?dWNhZTN6RTQ1SzJUVU5oSUw5dXdwWXhwUTcvQzJFVTR2OWJxWGtqVXhlaEdv?=
 =?utf-8?B?Rk8wZ2dOYTlWTEJGMVVCU0hHN2M4WW5SWndkZTRtR2EyemIza29GeEkzMnpl?=
 =?utf-8?B?Qk9kdkJPT3BhZjZiRjIydkMvbkcrRVZtMjNkZHJqU2NWQzZwTnVjN0kzOHZm?=
 =?utf-8?B?OXpXc3JpQmlZb1hMZ2lkenBlcjdjdldjTVJaODVuWUVmbmNaOXBFWG5qRmNI?=
 =?utf-8?B?eVFyS0xCSEhsbXZiMUExbmcyZ3JsVEJwbFdrUTJHeHZJUVZjcW9qK1pwbnNv?=
 =?utf-8?B?SjZxdmkrQjdsTGt4UjVoZ2o2QjR1My9ZYTJuZE5uR0V4aEViVTBCMmF0a2tm?=
 =?utf-8?B?K1VOSTZBTVRDZ3VVZTk1K24zMHFRL0VzM3pyWVNENjJhOUc4VWV3U1VqUmJ1?=
 =?utf-8?B?Rk9FS3RzSStndVRDYUZ4QnpuZXFMWHpYRlRNaDY0Wkl2b2xlTUh4aFJEWXRZ?=
 =?utf-8?B?cTFTNDlNTHprK1RMRWsrd0xVTytQZHN4dUtZUlhaUC9HMGdmbnNjL3VCbGZV?=
 =?utf-8?B?YVovNGExeHA2aElyWFdFU2U0MGU2djV1ZU10R01hZmVhT293U1NGMXZxVTEy?=
 =?utf-8?B?N2ErejdhbmNXVU9PdHYzcWdEbWYxbHlGZ3VJQVdWbU5vS2MwMnNsUHZCbXZv?=
 =?utf-8?B?V0NpMjViSHdIcTJCYitnRDNmK1BtM2hhM0tUNmhqQzNsVTBWV3l3MHpkM0xC?=
 =?utf-8?B?UVJ6ZkpyNlFwbDNJd0RZM2hVRjU4MGY4b1NmY3F2TjRzRllvYkFKeFVOY3ZD?=
 =?utf-8?B?V0swK3pVaUFWZG95Y2pIeW1wRnBna3A1TDRZM2wwNzNxYlAzdnErSHhvd2dx?=
 =?utf-8?B?L3B2UEdVREd1S3M3dmFqRENxSVg1N1AvdmdieFQyUVE1SkF2bWptOWJsd1Jo?=
 =?utf-8?B?eHJIM0x3czdQZjdaNGpHOW50YlFTMFhteGYzTVV2MU0xU3NpOWJrZ052d1RI?=
 =?utf-8?B?RFY2OEptTDY0Rnh0SXZackR6eWZKd2JZSXY3eXJpY3NFNFFobk96bnlBR1Rn?=
 =?utf-8?B?b3owWUMwY0ZJQXhNOEp4NFNBTVBRenZuWWREaGlaNW5ncWs1YkJtWHVXSEcx?=
 =?utf-8?B?ck5LRnVPaTgyeEFPSzAwQWh4Ky9JcTQvaHN0R2NMc290MGU1WmY5S09QSGd1?=
 =?utf-8?B?dVpkc3AxVXVRWVE5SG5JQ09VWVBmdlV5ZkNuNHR6UlV3SCt5TURQT1FhakdB?=
 =?utf-8?B?eGVJS2VNZ1IyMEx6ZEVML1pnWks2cG9LWE5mN1JiZDNTN2xTalNubUFUSjlZ?=
 =?utf-8?B?Ykc2QjdEejR5NVRPUk1JYmp3d2lBYXM0TUR2b01xMGVEYTlteXJ6MU5USnhz?=
 =?utf-8?B?SDF4LzQzQlNMVHVBTnNUcE5FRWRxTEJWczB4cFZ5bEhBays1MU5QdldqSGxm?=
 =?utf-8?B?MTZjTDhSbWhjdmxoY25OWDRpMFh6MjJad01mWTRYdjVFNFpHMGFGS1lHOGZq?=
 =?utf-8?B?QWI1c0c0dkZnMDFtQ21pK0l1eWFVUkhoUk4vRHhETTlzTHI0K2g4d1plS3lY?=
 =?utf-8?B?b01uSDd0ZXNmbTNWek82bEF0TFl1RXFyZzZEYjJjUS9wMVFYYkl6dWZXSjRT?=
 =?utf-8?B?MlQwSmRDNURlTHljSU5VVlhGQ2VGWkhHSUp3ck8zOVFCNzZCckhXM29iTnEz?=
 =?utf-8?B?STRlVHVvdW1kUkR3OWNOM0diZDEvTTJDM1NyRW5HbWZnbFBQemtlK25NdDEz?=
 =?utf-8?B?b2JzKzk0ck5NWjJvenVRVVRWaFJkaEpsQ3lBWGU0OGU1ZGptMSsxbjZvZzdj?=
 =?utf-8?B?d1BQWkFCTWx3REtPR3l1NWFaVDVpK0Y2QWZlTzlYRXBRMFozcldhWm9jWXpB?=
 =?utf-8?B?MisySTBDZ3gzZTdEYlFGais2cS9nL3FFaTFqWmVFNHNUcGRNVEF0U1VaVFUy?=
 =?utf-8?B?M0tVY2F5Nm9MVGlEcmphRTI4M0xDVFNJZU9Jd09oenZlL2xodmV5dHk1WWZ2?=
 =?utf-8?B?ZElVK2dYSWlxY2VJZG1pS1dVcHZESDFGNHNQS1VZaW1paEdFZkx4TkFCRzBG?=
 =?utf-8?Q?vlHhS9VxZjpQ/mbnpBHOj5k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb04834a-8d5c-461b-fbf0-08dd52b7ba85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 20:38:41.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBY43oZ9/lSHVGZzZwF09teqCjmLkSdfbuQec4q6dUmbeGxpcL2+CMH8zjNnQUIYxvNUpvm5Kzt7gIt3JTdssqiZ11qDzbeLBJIo7rBTPag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

On Thu, Feb 13, 2025 at 03:06:04AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  drm/xe/oa: Allow oa_exponent value of 0 (rev2)
> URL:     [1]https://patchwork.freedesktop.org/series/144685/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v2/index.html
>
>CI Bug Log - changes from xe-2649-cbd90e3e74e3102b4a3eeca23e0136382e8a478f_full
>                             -> xe-pw-144685v2_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-144685v2_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144685v2_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-144685v2_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>          * shard-bmg: [3]PASS -> [4]DMESG-WARN
>
>     * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>          * shard-adlp: [5]PASS -> [6]DMESG-WARN
>
>     * igt@xe_oa@mi-rpc:
>
>          * shard-lnl: [7]PASS -> [8]FAIL +2 other tests fail
>          * shard-bmg: [9]PASS -> [10]FAIL

This is a bug  from this patch. Will post a fix

Umesh
>
>     * igt@xe_oa@non-sampling-read-error:
>
>          * shard-bmg: NOTRUN -> [11]FAIL +1 other test fail
>
>     * igt@xe_pm@s2idle-vm-bind-prefetch:
>
>          * shard-dg2-set2: [12]PASS -> [13]ABORT
>
>New tests
