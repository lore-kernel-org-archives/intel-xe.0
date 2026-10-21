Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F25606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=axNRE7sm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84210E0A3;
	Wed, 21 Oct 2026 01:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5910E08E
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 01:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792544497; x=1824080497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XTN+ZSgwq57Dv7stiB5HxEIXxLXKHOalXmRHGnZDVCU=;
 b=axNRE7sm+lx9ohS9nS7xT9VrT579twUkQ3q6uG/HsaZjAqmLN9NBXi2z
 gaDNrGxXap2YO6KDf/EKvZOgR2qJXlFjGvjECjjAuH0fHqjaFvhk9oa+b
 tJaDnHV+hSvGz29COzibzq5uOAdTg+z/0das9J7iGircqrFSJiIj3sPzC
 WRy66PIOeO0xJwAHGp8HjKCfxmaFRM9yEjVOTK9SKIg3BVqSXnWGS5rRI
 b+Ju4FunVMSRGlL88YtajYUand31ZIGSUTyRfgx0O2+V6YnJFVmHGRzn0
 k4Pai6OmbG5DJkCg2Lfc1u6T2dKW+pG2ccsasdwARWnPjP3/hMKrNlG/M w==;
X-CSE-ConnectionGUID: w/yhcIV+THWphlF+FvqG/w==
X-CSE-MsgGUID: DMfAvfLfSnakURdtY+q9Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1242291"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1242291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 18:01:37 -0700
X-CSE-ConnectionGUID: Ziy8I5byTu61JrRjy8sSVg==
X-CSE-MsgGUID: DnoFLIOZRrSy7TQwMO2dgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3311399"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 18:01:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 18:01:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 18:01:36 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 18:01:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPLshZoGl4TfLvvoiR0bZ4AFZBmsT8P+rP803ZvxMOEkHoazsi4W50HfJxzpBQB08KkkaqNTFyJnTj15de1CCeQkwMaTKVNLDCq+yxdSomC2aSNMy3GlJybcqrAg8T+rJIbXtkz5nufnrVUAeHZc8JQelS16O4PPKTP18sZMr9oBrqEiowy9XwQOFLAbzToZLbyyQzHlf+kfxDAHuBtKgm4QTLAhB20EI348p42XyDHhpRYUCvkrGZuiVyu25Hli9QmGpD9NJMo0aipGdSY3hM2cmcQVfAQQ4+3vFr+/8D8hxJu1rFREhgjMs+b0a06TyTG7erA+l4o72cweTRpfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u15auljDbGpB93NPlbibUlzxLi3ET2L3yCmO8AKJPo=;
 b=cR9uNXk2MCrsrgdv6Q/Xxkh9TvmVK7c291OwfVJ3jXK6IBRmAjtOquKNWudYfhbvdX7JszX7nUGN90zBgi6uJ4jarGlN94rnPPgoYjIOfWeuh5bL2H+YHY1NieykxZUMRFqqN97ygfXQz6CY68lTEAAcrOusa/y235syVfqDsz+6ge9oEO5JoRwpgAEM+9kTjNJ/vDd8cZsXb0UrQh/YcZrWko8MzePmC9D9p8T0x/C79PGPFSf3QTqDIhjGZycW79RaF7XTb1PeE3rGBs4Bt+mOevqPL2k8FOlvLSBCP5uUkTGxbuWxtAKnOPjMPd8pRmCRUowGDhSz05/8w7Mk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 01:01:26 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 01:01:26 +0000
Message-ID: <1b91e597-dc36-4769-8315-90fbbcac1d07@intel.com>
Date: Wed, 21 Oct 2026 03:01:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/ggtt: Split GGTT into usable and shareable
 pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
 <20261020095532.473609-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261020095532.473609-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH3PR11MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 89883e24-cfce-4e5c-e74c-08df2f0ed545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: kMuD1fdY/2/A8xOsRupGsWMQVdQiZctWd620qGJ12SpsuQDroLGxYZPpAdtthE2RGoIwB7uR+tSWe/+DlxVWUc/bAMRZfhIpWuuWLSkEzMNtAlberR8rIGd+RcVSdLL78kNj2XXI2eetYBw6HpkTHwz8AOu5wa8NcLqJNP+2XQIRBY71L2yu8SFUCpLYKYNl1KjGj8AHisoCnTZTFtT5z2cX0lyt8DcjHisdF0TGEC52ya+KDQPWJdqHWS4UHwm4hiXa9AEy7c7Y61J25iiLs4W5EnleIFwKNGRbnfLPZ1JCGD/krx0EoJLDNH04j2G5RFefePGKW9lXVgTCmL7fiL0hebJd8oxlaznnKSurdnF/UQ83jgc4aS1chJULOi6jxIQ5m+3sGe209bUIf2vBD5WAnJWjmxkjrTSYrCM7AmNM1y5TJN56X7DLmcwky4DdaFJQUMAy+U2SzOTBYJmVJnCEkevNZu0BUT7XfDf+kGxPtwzaqJy7AcypRgADqKYMIxVbkV0QX/jAq5yArSG4lgNume9enmKEseyDUlQhmYLtfHVXE6fWBBIBH0sG8KVBSrMLFkRFz6++TuovuDmYlMD4Ai4mpKBUX5LRd7tM5txDvkNiKHecokytxDZnZbzbdyYiFs0THKPBc8zaQnt0MIwGLSilzQ6lXlpxVLRFuAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9XbGQwK0V6Yi9zZGJGRmh1N0R0eDBHT3hLQ1dLM0NnZSt2MVJsUU9jaGpJ?=
 =?utf-8?B?b0JWSjhxblZEa3dKMzVhUmpoVUpGNWZzOCtiTCt0b0FpRURqYXlpbTM4RVV3?=
 =?utf-8?B?ZEliVFZabWdSY2MvMDZPdVVWN3ZZc0ovTmlkVjNxQjBaUzNYdzA1SlVPR3ps?=
 =?utf-8?B?dmVsQjBTN1U1MDU0RUZhTnZEdUNVVzdQMmNWc3gvTSs4ZHFWZFptSlNJODFq?=
 =?utf-8?B?c004SEUxVDUrUERWaHlJRmF0TW9VT0F1c2pYdXBUMDc4d0lrZFJOTFUrWVhP?=
 =?utf-8?B?dzlQYTBxOEsxbjNiTHB4U25KMSsxcTNiY0hEbS8yYmFqODNSdGtvNnhzTXFp?=
 =?utf-8?B?aWpSTDV6NzRGWnFTbEYxZlhuSDdBZytnTFJXZXNmRHQ1R1JTd2NCUFZHd0Za?=
 =?utf-8?B?TmVpNWVtNDJURmRUQmVOZy8xNm1FRmwwTmwrb3J6RVVrWTlNSkx0SHpQT3BK?=
 =?utf-8?B?eFdWTjgwNEJrOWZEeTN6NG9qc1RJQTk1aGRuSjNLVDV1dEpCNmxYNFNmcVgr?=
 =?utf-8?B?WXVjend3d0hXU09qR1pnSTd0SWZSd0E4ZnJsckVTM3hYLzI0UmZpekpDV1BR?=
 =?utf-8?B?T3ZVcW5IZzFGL21ZajhHV1dLS25kRWN1MWo3eXVsNjF4Ykw2eVpta2w2Mmcz?=
 =?utf-8?B?RkVuTS8wUytSS1VrMEJBbkV0SVJZQ0s1c0FrY2pITWo5b3QwaXlNandpaUdP?=
 =?utf-8?B?ekNQSnh6Mjc0MGcrWjhNT2NySVFFMDljT00vZHZyMm5YZUxPQklNR3ZTN09T?=
 =?utf-8?B?TWFkOWVYRDFmSlppMnFxb0F2RTFZZ21wNERiVUJ4ZkRRZjc3RkoxbmV6NG0y?=
 =?utf-8?B?M2lQZUNUVVhpb1lZVG5GQmZpYUFDTUFQWTU4dElxdmdpeHdwaXlDYmFURTdn?=
 =?utf-8?B?b2ZsbGJjTWlvVHhTaVgyVDA3b0kyLzJPNmdKdGw0NnRCTEYrd1VZTmNPdWN3?=
 =?utf-8?B?SG9iS3FwWVhRVGlSNzlBWjU1WnhEemx3QTM5K1ViTElqem9jY1ZteWo1U1gx?=
 =?utf-8?B?Z3Y0ekZLT2kxbjBCd2paVWE1c0MvTUdRLytTU3dPWnRtS1F0QlIyazdNcUdG?=
 =?utf-8?B?VWdkK1VSdnNvVE1jR2FlYnQwM2VoemVuYThQdTFRZlNkeEg5bXF6bjMxRDVE?=
 =?utf-8?B?TUsvZXI2ZWdpQ2Yvak84YlN4K1Nkc1FEVEtFQzdiK3hmdU1nL1lRd0pBZTNa?=
 =?utf-8?B?R2ErTUZLZFdrT3R6VjNpV2plOGVyOURMcTVlYmN6L1A0czY3ZjROWGhaWTVY?=
 =?utf-8?B?ZWI0ZlZXbWhsZ04xVDNnTE5hVU5aMkhXc0xycExtS1VsVmQwQ1E3N2JhdjZD?=
 =?utf-8?B?OEdQam90elBHbDBhcnlUQVBDMWdKVDZTekJORTlPeDdUN3U4TjZyU1FMQkFl?=
 =?utf-8?B?Y0p6WE0vb0RQYlN4d1lhYjhUT1EyUlRRdGRHSjJmMVhJTS9FQThoZ0E2bE9J?=
 =?utf-8?B?c05hQUV1S3NldzY3WmNrZ0FmMGdTKzlOd3V6eFQwK21lQ0Y0NFB1RTRHQlM4?=
 =?utf-8?B?VHNhQ2NWSEJhb0xZMGlaUE0zcHZjdERiOVk0dW5NNklsUVAxa2FxUTFWRHFX?=
 =?utf-8?B?VFAyQ2k3ekdla0FzdDc2UXZtaGg5eGkzYXRTN1ZrSmJQNEZhQzJSbDY1a2xH?=
 =?utf-8?B?YWhpMk5OWEdCdkxQYTIzaHg4V0lDMEFXNzFodEM4bjg1aTZtUHJ2dXoybHM1?=
 =?utf-8?B?aVJUS0ZiQ1F6aS9WUFdodERqMHo1d2MyK1lVcXVmR3RCWHZGQkdJLzJKaDJ6?=
 =?utf-8?B?WDY0dEVEUFVLOFlYanZabW9jYnBodlYvTFV5aWVQdTRYMHMxVHB6N2xxbXcr?=
 =?utf-8?B?Mkc0VlcvOGpUc2NjYXFJc2hGM0tjSUkyWUtTbzBXblN4TkpSQTF6aVp0MjRu?=
 =?utf-8?B?UzllSFpFb1VRaXRuSVpiMDdXMGhrL25TS3IrdXdIVkl5a3duZlhEZ3VqTm1y?=
 =?utf-8?B?eHhJcXB5T1IwWEtUeVp2K2tLeXp5VUhqd0Z3R3ZMUWVxVUo5K3R6VWo2Y0Ny?=
 =?utf-8?B?V0xXTEVYU2drZUxiSnI4NEU2bC80ek51M1NnaFp1VlJZSk1sZEVnbGxyd0lB?=
 =?utf-8?B?TXRzME5vZ0N0eUV6NWduR3FKS0ozQlF3ZVVuRjR5azArSXZCQVNtaTloZzBn?=
 =?utf-8?B?M2cxa2ZidEN3alZNR28xRFRLa3lwOTBWRC9rT0U1YmVVWVdnU21xSEg3Q2NX?=
 =?utf-8?B?cE1wdzF3UHZHaEhVOGFxaGcyUXpEZ2JERTVvclNkRVVqSUxicDUrQ2ZZS05R?=
 =?utf-8?B?OVk0M0gzRFJvOXJsdHpzSFMzTWFSTVNUYi9EajhaOFVqWldvUkdtNDl3bTlv?=
 =?utf-8?B?b0J3bkdDaVpkUkFxVldzM1YxOGc2dVVtMXFMdTZQRWFLV2dOL2JaQT09?=
X-Exchange-RoutingPolicyChecked: MkbQLhWtfg7gyLb86fAe8rtudEFkqRkaq/ZHz0nY5DJx0l4xS+zvph60fJPiu9FTWgAVYrl0DeQHw7d7ukP4HXiuRYa06tlyCd1BthuEjkrcS/9g+9saXTLdRzx+RQ8UQx0rNNnvcIry1FObWvOs6DETVu92lQOdkxTMyOUnHQvhLmuhOw2HeOvOdGZhNPr96h0MWyU0HERca5rOkpYzfyeAEK6q4cPH1D3PeUHsnODWfUjQrb1O59Tb6SSXce15F441p9XsKcR7vRwvqyc9RIsLC3wsCejvM2Ve7Rzayxcs76mqF3a4HX7K3rUCgehEpzim8mHforvud2R6gLCLjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89883e24-cfce-4e5c-e74c-08df2f0ed545
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 01:01:26.6106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9Ai535a6eXi5TMNRZrIB3vuD3tzZkiDz4bNfD6Qs0UUHttj/MgRiLHavn714jPFqnVPjlb0uDO5RvjxM3VyhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8434
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 2026-10-20 11:55, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Driver-owned GGTT allocations and VF provisioning currently use a single
> GGTT pool. Split it into a usable pool for driver-owned allocations and a
> shareable pool for VF provisioning.
>
> The pools are separate logical ranges and may overlap, but allocations are
> limited to the configured size of their corresponding pool. Allocate from
> the bottom of the usable pool and from the top of the shareable pool when a
> shareable pool is present.
>
> Add separate insertion APIs for the usable and shareable pools.
>
> v2:
>   - Rename ggtt->usable_size back to ggtt->size.
>   - Remove the ggtt_insert_node_in_range() helper.
> v3:
>   - Introduce the full_size struct field instead of the ggtt_accessible_size
>     function.
> v4:
>   - Set the shareable pool size only for SR-IOV PF,
>   - Return -ENOSPC instead of asserting when a large BO no longer fits after
>     end is clamped to ggtt->size.
> v5:
>   - Move range initializer rename and full_size parameter here.
>   - Use shareable_size and compute the shareable start on demand.
>   - Constrain regular allocations to the usable pool.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 166 +++++++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_ggtt.h |   4 +
>   2 files changed, 143 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index abcc929c08535..8c8354d47782d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -145,8 +145,19 @@ struct xe_ggtt {
>   	unsigned int access_count;
>   	/** @wq: Dedicated unordered work queue to process node removals */
>   	struct workqueue_struct *wq;
> +#ifdef CONFIG_PCI_IOV
> +	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
> +	u64 shareable_size;
> +#endif
>   };
>   
> +#ifdef CONFIG_PCI_IOV
> +static inline u64 ggtt_shareable_start(struct xe_ggtt *ggtt)

This name is unfortunate. A function with `start` in name actually 
ignores the `ggtt->start`

and returns a shift/offset within range of nodes assigned to this 
`xe_ggtt`, rather than GVA.

Can we use something more matching rather than `start`, or add a word 
which would

emphasize that this returns a relative value rather than not Global 
Virtual Address?

> +{
> +	return ggtt->full_size - ggtt->shareable_size;
> +}
> +#endif
> +
>   static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>   {
>   	u64 pte = XE_PAGE_PRESENT;
> @@ -358,17 +369,30 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>   	.ggtt_get_pte = xe_ggtt_get_pte,
>   };
>   
> -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> +static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
> +			     u64 usable_size, u64 shareable_size)
>   {
> +	struct xe_gt *gt = ggtt->tile->primary_gt;
> +
> +	xe_gt_assert(gt, full_size);
> +	xe_gt_assert(gt, usable_size);
> +	xe_gt_assert(gt, usable_size <= full_size);
> +	xe_gt_assert(gt, shareable_size <= full_size);

Does that mean usable area and shareable area can overlap?

If they cannot overlap, then we should assert for sum of the sizes.

> +
>   	ggtt->start = start;
> -	ggtt->full_size = size;
> -	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, 0, size);
> +	ggtt->full_size = full_size;
> +	ggtt->size = usable_size;
> +
> +#ifdef CONFIG_PCI_IOV
> +	if (shareable_size)
> +		ggtt->shareable_size = shareable_size;
> +#endif
> +	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
>   }
>   
>   int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>   {
> -	__xe_ggtt_init_early(ggtt, start, size);
> +	ggtt_init_ranges(ggtt, start, size, size, 0);
>   	return 0;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -445,7 +469,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   	if (!ggtt->wq)
>   		return -ENOMEM;
>   
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> +	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
> +			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
>   
>   	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>   	if (err)
> @@ -639,6 +664,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>   	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
>   }
>   
> +static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
> +{
> +	return xe_wopcm_size(tile_to_xe(ggtt->tile));
> +}
> +
>   /**
>    * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>    * @ggtt: the &xe_ggtt struct instance
> @@ -650,24 +680,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>    * This function may be called multiple times during recovery, but if
>    * @new_start is unchanged from the current base, it's a noop.
>    *
> - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
> + * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
>    */
>   void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>   {
>   	guard(mutex)(&ggtt->lock);
>   
> -	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
>   	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> +#ifdef CONFIG_PCI_IOV
> +	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
> +#endif
>   
>   	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
>   	WRITE_ONCE(ggtt->start, new_start);
>   }
>   
> -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> -				      u32 size, u32 align, u32 mm_flags)
> +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
> +					    u32 align, u64 range_start,
> +					    u64 range_size, u32 mm_flags)
> +{
> +	struct xe_ggtt *ggtt = node->ggtt;
> +	u64 range_end = range_start + range_size;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!range_size || range_end <= range_start)
> +		return -EINVAL;
> +
> +	if (range_end > ggtt->full_size)
> +		return -ERANGE;
> +
> +	if (size > range_size)
> +		return -ENOSPC;
> +
> +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
> +					  range_start, range_end, mm_flags);
> +}
> +
> +/*
> + * When the shareable range is present, allocations start from the bottom
> + * to leave space at the top; otherwise they start from the top.
> + */
> +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
>   {
> -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
> -					  mm_flags);
> +#ifdef CONFIG_PCI_IOV
> +	if (ggtt->shareable_size > 0)
> +		return DRM_MM_INSERT_LOW;
> +#endif
> +	return DRM_MM_INSERT_HIGH;
> +}
> +
> +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
> +{
> +	struct xe_ggtt *ggtt = node->ggtt;
> +
> +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> +						ggtt->size, ggtt_usable_insert_flags(ggtt));
>   }
>   
>   static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> @@ -684,12 +753,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
>   }
>   
>   /**
> - * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
> + * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
>    * @ggtt: the &xe_ggtt into which the node should be inserted.
>    * @size: size of the node
>    * @align: alignment constrain of the node
>    *
> - * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
>    */
>   struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
>   {
> @@ -701,8 +770,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>   		return node;
>   
>   	guard(mutex)(&ggtt->lock);
> -	ret = xe_ggtt_insert_node_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> +
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
> +	if (ret) {
> +		ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return node;
> +}
> +
> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
> + * @ggtt: the &xe_ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> + *
> + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> +{
> +	struct xe_ggtt_node *node;
> +	int ret;
> +
> +	if (!ggtt->shareable_size)
> +		return ERR_PTR(-ENOSPC);
> +
> +	node = ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
> +
> +	guard(mutex)(&ggtt->lock);
> +
> +	ret = ggtt_insert_node_in_range_locked(node, size, align,
> +					       ggtt_shareable_start(ggtt),
> +					       ggtt->shareable_size,
> +					       DRM_MM_INSERT_HIGH);
>   	if (ret) {
>   		ggtt_node_fini(node);
>   		return ERR_PTR(ret);
> @@ -710,6 +816,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>   
>   	return node;
>   }
> +#endif
>   
>   /**
>    * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
> @@ -793,6 +900,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>    *
>    * This function allows inserting a GGTT node with a custom transformation function.
>    * This is useful for display to allow inserting rotated framebuffers to GGTT.
> + * Allocates from the usable range only.
>    *
>    * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>    */
> @@ -813,7 +921,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>   		goto err;
>   	}
>   
> -	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
>   	if (ret)
>   		goto err_unlock;
>   
> @@ -835,6 +943,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>   static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   				  u64 start, u64 end, struct drm_exec *exec)
>   {
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
>   	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
>   	u8 tile_id = ggtt->tile->id;
>   	int err;
> @@ -852,16 +961,16 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	if (err)
>   		return err;
>   
> -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> +	guard(xe_pm_runtime_noresume)(xe);
>   
>   	bo->ggtt_node[tile_id] = ggtt_node_init(ggtt);
>   	if (IS_ERR(bo->ggtt_node[tile_id])) {
>   		err = PTR_ERR(bo->ggtt_node[tile_id]);
>   		bo->ggtt_node[tile_id] = NULL;
> -		goto out;
> +		return err;
>   	}
>   
> -	mutex_lock(&ggtt->lock);
> +	guard(mutex)(&ggtt->lock);
>   	/*
>   	 * When inheriting the initial framebuffer, the framebuffer is
>   	 * physically located at VRAM address 0, and usually at GGTT address 0 too.
> @@ -880,28 +989,31 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	else
>   		end = 0;
>   
> -	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
> +	end = min(end, ggtt->size);
> +
> +	if (end < start + xe_bo_size(bo)) {
> +		ggtt_node_fini(bo->ggtt_node[tile_id]);
> +		bo->ggtt_node[tile_id] = NULL;
> +		return -ENOSPC;
> +	}
>   
>   	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +					  xe_bo_size(bo), alignment, 0, start, end,
> +					  ggtt_usable_insert_flags(ggtt));
>   	if (err) {
>   		ggtt_node_fini(bo->ggtt_node[tile_id]);
>   		bo->ggtt_node[tile_id] = NULL;
>   	} else {
>   		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> -		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
> +		u16 pat_index = xe_cache_pat_idx(xe, cache_mode);
>   		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
>   
>   		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
>   	}
> -	mutex_unlock(&ggtt->lock);

We're switching to keeping GGTT mutex throughout GGTT invalidation. This 
creates dependency between

this mutex and invalidation mutex, and also keeps the lock during GuC 
communication, which greatly

increases the time window in which it's locked (the previous operations 
are insignificant time-wise in

comparison to GuC comms). Do we have a reason for that, or is switching 
to the guard just a style fix?

-Tomasz

>   
>   	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
>   		xe_ggtt_invalidate(ggtt);
>   
> -out:
> -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> -
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c864cc975a695..59b2f02870195 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>   
>   struct xe_ggtt_node *
>   xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#ifdef CONFIG_PCI_IOV
> +struct xe_ggtt_node *
> +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#endif
>   struct xe_ggtt_node *
>   xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>   			      struct xe_bo *bo, u64 pte,
