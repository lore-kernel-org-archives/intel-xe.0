Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5FCD5B87D
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A58510E209;
	Tue, 16 Dec 2025 01:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrdowxZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7A610E209
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765847583; x=1797383583;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tFeRFzsrPcTfVPsxWUY+E0Ta2iLabIvtDQSMw7XSDW8=;
 b=VrdowxZrCpFG36BQ4kNMRRLn9W2MPuNrWw/+ORlgyXsG0JA9i3Qn7w8L
 2mHIAUKSJww1yMSwxuX4tXpDUd7J2tpr01cwtbyFq492f5rSMWtjMX2W4
 JqQ7XYl1u9KAwFKuxycJtGYkqs33QbZnj/DQFrZzwuj6xr1wiL52mCZC9
 kOaf5aQJhuLCUA3RxaRlndu4hvI+SvZOQ0lmOxcNAkZ0IFTccXNuuaXV7
 bWuTtRqDNv1/A+l+407hRIXw/ACI1bofbcoNexNYehZSxnGXYQixHWbFr
 S9A4Lw9Po/gWwqFN4YCCZrQZxKCM/DGxrz7zxIgmKJnRdK7hrcFy1I8/Q w==;
X-CSE-ConnectionGUID: 8fbXQHx8TPOvXigjNR6qTQ==
X-CSE-MsgGUID: fkhnXXIxTl6ELcA+VG7vIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78069946"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="78069946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:13:03 -0800
X-CSE-ConnectionGUID: cqezupjTT+uBsfP7fcp0jw==
X-CSE-MsgGUID: IEnBKr3IQ+qe8d4l/EGyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="202372130"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:13:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:13:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 17:13:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:13:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvZ92YT4Z9WoNa4A12YKz7giWGOaiBBzZ1sj7c0F3QX920DEvJZjOpqcEhY1bYLs/g5l+20ulLnAmjkmXKXvR+qrVYPpEoOtnNVj10Oo1KpFdahHcMxQjxZ0J78hhs2UwylqICuE/YpL6875Szy8Fam2cReQjUvgamKP6l2uPOXlYkKVoD92XtToJL5fF003d7rfLJW85Wc/dREUTD9q4lySUWWbKLSG+TWmsIMyNXW8tHrqtA8RF9mtGUufva7bMdrUUYx0ZPPCS2vFanlWiGtXRcM9glRcyh19lN1hQ8rW1IR+068jEqTbAlzyqS+uXhNTSDVhNR50NZugJIyuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTjjOSAsw/AcqgHx0qlFRHN8fC9fYFqpSitD5DnuAxE=;
 b=qQB4IyoywgX7LfK0yrMVYk2wKfce/4c7GUIFo8cWTZ1pHe3RV26b7zmT4eWDSnjlLCgsoDwM6ON4nQP6FvzeBWdzgmoUDz9MoivVp1+qLoyPruCx1CyDiCjdQlnmQkhvAjurDQ9zStP1eNcQJGpOv9Y4CdvQnbcfbOkqtPQlsjrcge/t4C+KG1MTsOpG8jWlUMlxx0suJsvAPJBTtIcGjTFrdBERQXDu5xupUjkZ+A8WGdaFx1jjXt6NkvgW6x03UNVhecrwjUhdAU+NiSp+cBnILDgPrmt4C9YG/95MRtbD3b92xsMGEMwTqP6GZUpG82W+sLkhbbmOe6j6oOZmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9033.namprd11.prod.outlook.com (2603:10b6:208:566::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:12:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:12:59 +0000
Date: Mon, 15 Dec 2025 17:12:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 5/7] drm/xe: Wait on in-syncs when swicthing to
 dma-fence mode
Message-ID: <aUCyGSq/6p86GdoS@lstrano-desk.jf.intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-6-matthew.brost@intel.com>
 <f8d4426124338517d5bc9f99daf8fd665c9a0c3f.camel@linux.intel.com>
 <aUCBrn8nGPSp4lBR@lstrano-desk.jf.intel.com>
 <236818068ac38d0fbfe0603a84cd056d2961bfb8.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <236818068ac38d0fbfe0603a84cd056d2961bfb8.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e8bfd8-d233-4a99-a585-08de3c40409d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtCd1QzRWtlTDgwTXJIakJIM0hES2djeitSNnFJYmphQmp0d21weFZKR24z?=
 =?utf-8?B?NEtKdTNUbGZnMmdJNkIxbmI0d1pPVldrSzJTYnp1dzMxOGp2ZWhEMWxRYkNV?=
 =?utf-8?B?QndoQUVpQ2RoVTR3S3I1RER5NWs1TkdCSFFpT3hzVGROcnhyaW1DWit6N2Z2?=
 =?utf-8?B?S0VWcm9UU2p3QWY4OE43M1BPcUI3REh3blduT1ozTjdKcUMwaFhvWGhYN0FE?=
 =?utf-8?B?K3JKWW1vSjdOdmZXNlJCaFB2UHpCWDhoa2hESS9waDh4VWlqREVqanNIcURL?=
 =?utf-8?B?VUdkd0xlQ2RGcnNOdkNZM0JWRnlLYjc2RGx4eitzOGFIaFhvZkhlQkdYaU5U?=
 =?utf-8?B?RkRtbTVkWjRPaXMzU1ZDbnFmUFB0NUZPTmhldlJ3Y3lXdTJES3grbmVQVzcr?=
 =?utf-8?B?S0JNamtsT0hpaHVFWW01L2ZSNGNyU0NtZWFBV3RYdkxtUWUvSzVzQmQ2Z0pR?=
 =?utf-8?B?b0IxSDN6MkVKcWFqVytkRE9jWFlmd3UwYU5Cem5lVHFBejFFMHJoVHE3MHMz?=
 =?utf-8?B?RmZXL2NVT3Vud2hRL1NhMGNVZFhTUjFOeDhpSjNsM1RxTy9GRTNDd1VCVFBI?=
 =?utf-8?B?SWNJVWwvSVB4OGl5OFpPalphUktYNDZYMENMcWZXeHkyMVp4cVZhUTNEM2Mv?=
 =?utf-8?B?SWErbmVDK05aUHFCUG16VEE2MjlsZEVOaUdQNDBic0V0em9wZ1dMVVpmU0E4?=
 =?utf-8?B?QTlTZVVWcTUxZWt0R2pXSkk0MVR4T0ZBTWJZUnMrVW1kSHhZTmgwZ2lNd0VN?=
 =?utf-8?B?S0NMQVRwbzhaSnZJVmJlNlNWM0pBZVBmZGtTdDk0OVZZTXJxNXMzM2c2bHNQ?=
 =?utf-8?B?dnhyWmhMQnJ0Qit1VVFMZ3B1clQyM2FVeGlYS3hoNUZlbE5KblVTN29FbGtF?=
 =?utf-8?B?QWdZT3BZbUI4MmJreExIdkM5bGh1b3JPR1o1d0dyc294VkVkaHBKK0pycWZN?=
 =?utf-8?B?eUR6MWlJa2dsOGI2NFlqQnBkd0Q5TzZMbVBsY2hWdEk2VDFXUmNoMmRpUk1R?=
 =?utf-8?B?akF6WGNCUXZ1TmdsQUJ3VjJ4OWdoQmlvRHRrazlnWTBHaHR3aGdlbUpLcEYv?=
 =?utf-8?B?T0R3TEpBMW84RzZpVThrMVBFZVNVSW84UXNWSlNWUXFxNUw1QVRQOUhlRHBP?=
 =?utf-8?B?VHREN3NDM1VEaGI5Mkc5SmQ5d0hhYXBuMDlGdnlxR0JXRFJhc2x2KzBzSHk0?=
 =?utf-8?B?WkFTY2ppaFFEb1JpOWpTQkpzUTVEWUovZEQ4QlUzUEZOdHd5SnNsQVNLbTQw?=
 =?utf-8?B?OHprQWhQUHNOMXFyMVJWMmx1OG5LQkhNUERrRTBoaUJ1UnlxOGMrL01FKzlU?=
 =?utf-8?B?c3orbkxlU3daZXRMM1crencvM0tQUjgwcmQ5SDRYaW5NcnBPTlpUSXVoRGRR?=
 =?utf-8?B?QThXSk85bzduZmRMR3RZZjRQWDI5ZlFoQnZobXVpcmNldUgvM3VnZk9VcW9q?=
 =?utf-8?B?TGhBNUFYMHZsK0hvWXEveURBTmV1UHg4NGhBcWZTVlR6MDJSaFVubGFtdE9P?=
 =?utf-8?B?cWNOL0V2UWFkNXBjQnZiN1V2YnVnVW1WeDEzbkJiN0ZWczJDWkhBNUxRU0hv?=
 =?utf-8?B?UGJxU05XNENPSC9NaFh2TkVXeHR5MzgvSEpTQzBpOWhTUXB2VkZhTUhuN2w4?=
 =?utf-8?B?Z3VNQXB3ZmFFQkg2WVFLSnA3NDJ3Mlc0S0czT3NPMFpscW5LY0kyZ3R4cFMz?=
 =?utf-8?B?bTdlSTYrMkZuQ1BiK05QTTZmeXR0WUVzM3R5TC9MUHh2eG9LcFYwYng2Vjg5?=
 =?utf-8?B?V3hmeGY2bFBTR2dnVC9QbzBJbnU2VHFQUlBiUU5KRkVmTHljMlQxWGpMRnBl?=
 =?utf-8?B?QVBkTUI4YzZ3NGFDM2hoWm9qMUtQK0d0TkhPaVVmTVFmSTRhSzVzRW1TSjVw?=
 =?utf-8?B?Vk8xMXZFdE1IMklFL3R6VjJwL2FOL3pXSDI1TGNNN2VMd0ExNnZtcGVpQzBr?=
 =?utf-8?Q?KTlskv/+P52+RToX3CFiRhokt2Ay3VJQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S253S2NjdjI2VXBNN2VXUXdBSW1QUUEwNEdvbmN1M1B5TWFVRGVvQk8vK3hw?=
 =?utf-8?B?T1lOM0ttbkNlWjNnTWdkSVhxQjdkMExoMDBDTFFRbU9va3F1R2orSkRkUG8r?=
 =?utf-8?B?TzNWalZwem4xSGVubHZwUEUxNGM1bUhZd1d6dko5dUZ4ZUNlUDIvbDhhM0VC?=
 =?utf-8?B?UCtPazVIZGdMd1p6U0RrN1d2V0Z4RXAvT3Rzc0NhdGFMUjE1NjJPblcrMFhF?=
 =?utf-8?B?RWY2eG1lZDExRHF3MEhQQzNvZDFCU3VBSmZJRHV0Ujd3VmQ2Zjl5bzZlOW1K?=
 =?utf-8?B?UjhITWVoS3RmUkRaYWpCWFJ4RFFibHNCT3JOVUVEdHdBM0llbGhXYzhrdm5Y?=
 =?utf-8?B?Tk9VQ29TNmtBdFp2QWlIeG5sZDVIWFFNbWpDckhBZDIya0thMzNQM1lPY1NH?=
 =?utf-8?B?NVYwUm5OUWs0c1Z2amYwaEsvU2xta3JvSFNWVU9LZVhMWnNjVVZtb01hSThh?=
 =?utf-8?B?NEdjRjNTbFZPSEs0emJJT2JpY0djeTFZRU1NTmF2U2JibGV5ZHZROHpvdmk0?=
 =?utf-8?B?eEZ0UVEzMCs0SG5hd2tPcGNvSVUwMG1sOE5vakttRVJ2SzBnNlBObEVLZ1Ux?=
 =?utf-8?B?TkZkWFQ2Mm5qYmg1dWl1VTRKRk9KUkI0KzhxQVpDS3diREZDdUk3WVFhbjgv?=
 =?utf-8?B?Um95YktvWFRLM1RKd2xnaGM4eDZBaU5OVWxZTUxOdHgxSVFLYzljKy9PbmpH?=
 =?utf-8?B?VEpxazVhbW5pK3greDlmMlRXQXNiRW85ejhuQlFZVE10Y0llaGNzaHk3UGN1?=
 =?utf-8?B?UnAzUVVSNVVQa1I0QjlvYUN2ODNtWGs0aHpCeEg0eXVzSEFWTzF1UXRhODJP?=
 =?utf-8?B?R1RxRnhlZnJpUHJTWit6dC9xWksrZnB1Y3c1NVUzS2NKVm9HUnYveUZFZ2x6?=
 =?utf-8?B?eENJM2hVbXpGemw3NmVpT3BUYkMycGtHWXltY3NURDJTWUV4NlNIWWhOMWly?=
 =?utf-8?B?YlNRM0R1d0U0bHZzUUxDdjJyWDgvL2NxRFpUOHdIQWRwcmRiWFdTckltU3Qr?=
 =?utf-8?B?aGRZUkEvNHNEenFlVTlLREVLV2l2RHlFdGZ5eld4dHZVR1V2RjQyWmpDVUZO?=
 =?utf-8?B?N3dueUtwcGp6RzhOQjNqK0ZSeTQ3VytZT0pUN1I4T3FhVWV5MzVkY1VDd1BE?=
 =?utf-8?B?TkEwRit5eTVWVUZTT3o4ZkEvVUt0YjFIK3I4VnAvRkQ1R1BJMzFHMkRiVVk3?=
 =?utf-8?B?TEpObFBybTAyVXRuMnNGMVNsUmdKamwrRGF1VERESGkxa2hVR3RuNEhPa2Fj?=
 =?utf-8?B?RmdRRUJKWGFPL2FDWDRMNFdxVXp6ek85Wkl2ZmIrZXpRTnhHUGdwTmVGNjR5?=
 =?utf-8?B?OGsxZzBIM3B0bjNCK1ZyRmhJd1U3SEtJUjk2dDhJditNUndjZ1YvSTd0Yy9u?=
 =?utf-8?B?NU5iYUVDd2VoRHBEN2VyR2VZZ2ZjN1puRDJzeGtRUFQ2NmlZRVJnSXlzaGcw?=
 =?utf-8?B?OWxlTDdxSm16WW9rWnpOY0hBT29GbFc2MEZSbW4ySUZjT2dCRkRIMDBTK0VS?=
 =?utf-8?B?Q1k2VTdmbW9IeTJ1M3NKbjFFVCtQbTVaMnc2RGlZOEpkc3NSQzB2bGYxenoz?=
 =?utf-8?B?dFFpWkJNRHRMbjBGckNPeThrcWJ0OUNTK2x1SDAzenNwNWpTREFnYnBuYzlK?=
 =?utf-8?B?MTNXVm9sYTQ0U2FOaU54MHhpQklBd1FNVVlPcnI3K2hEdUN1KytlZ25FM3I1?=
 =?utf-8?B?RWZBemZlUEZrSDRhU3NIdzBqb29QbWFacUZnVjJrKzZoN1JYeU40dUtlbHQ0?=
 =?utf-8?B?dzhzNDRSU1lmZThwa0RlT2xLN3F6bmp5U0ZFMmY5d3luSFVydjM5Y25IZ0lE?=
 =?utf-8?B?RTEzak96VFRMdThtUHFPKzRjYmtTZk1kS0lyQTVvcnV5MlkzNHYwZ2xia1N6?=
 =?utf-8?B?MTBhM1RlYlk5cmJNdmZOclJic1hVTVVxc3F4S012VjB4eGFXWWgwc3JyQUVM?=
 =?utf-8?B?VDB2N0RYYlZJNTBuTzdEQ1ovUnFSU2JCNzJSS1BMVnBwNmxSWFJiMWN2MWFI?=
 =?utf-8?B?czhXQ3FQblBoV2RGRTBXa0s0NTd0bnVwcDdXdVdHTWhZREI4R0FiN0FTbzB5?=
 =?utf-8?B?ayt2MTJ2Rlg5QzFUbjNXZ0QzUkQzYkx2VjVvNkdCN0U1UVV4TDhpYjg4VDNY?=
 =?utf-8?B?TExJWll5MlVnNlVnTHVObTNyTld6UkhNSmJ2M00ybkdzOHZsVGNzTmRBcm9x?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e8bfd8-d233-4a99-a585-08de3c40409d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:12:59.4469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LItw5q2cemKLHKWk06hidVTbzTl/0iq8IJq9gcLidWTk2nZ2VZN7xX0r+r0DvvjTZhGtyjRGl/7vAORZ6gTpoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9033
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

On Mon, Dec 15, 2025 at 10:48:59PM +0100, Thomas Hellström wrote:
> On Mon, 2025-12-15 at 13:46 -0800, Matthew Brost wrote:
> > On Mon, Dec 15, 2025 at 11:32:23AM +0100, Thomas Hellström wrote:
> > > On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> > > > If a dma-fence submission has in-fences and pagefault queues are
> > > > running
> > > > work, there is little incentive to kick the pagefault queues off
> > > > the
> > > > hardware until the dma-fence submission is ready to run.
> > > > Therefore,
> > > > wait
> > > > on the in-fences of the dma-fence submission before removing the
> > > > pagefault queues from the hardware.
> > > > 
> > > > v2:
> > > >  - Fix kernel doc (CI)
> > > >  - Don't wait under lock (Thomas)
> > > >  - Make wait interruptable
> > > > 
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec.c            |  9 +++--
> > > >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 44
> > > > +++++++++++++++++++++--
> > > > --
> > > >  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
> > > >  drivers/gpu/drm/xe/xe_sync.c            | 29 ++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_sync.h            |  2 ++
> > > >  5 files changed, 78 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 4d81210e41f5..d462add2d005 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -121,7 +121,7 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > void
> > > > *data, struct drm_file *file)
> > > >  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> > > >  	struct drm_gpuvm_exec vm_exec = {.extra.fn =
> > > > xe_exec_fn};
> > > >  	struct drm_exec *exec = &vm_exec.exec;
> > > > -	u32 i, num_syncs, num_ufence = 0;
> > > > +	u32 i, num_syncs, num_in_sync = 0, num_ufence = 0;
> > > >  	struct xe_validation_ctx ctx;
> > > >  	struct xe_sched_job *job;
> > > >  	struct xe_vm *vm;
> > > > @@ -182,6 +182,9 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > void
> > > > *data, struct drm_file *file)
> > > >  
> > > >  		if (xe_sync_is_ufence(&syncs[num_syncs]))
> > > >  			num_ufence++;
> > > > +
> > > > +		if (!num_in_sync &&
> > > > xe_sync_needs_wait(&syncs[num_syncs]))
> > > > +			num_in_sync++;
> > > >  	}
> > > >  
> > > >  	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> > > > @@ -202,7 +205,9 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > void
> > > > *data, struct drm_file *file)
> > > >  	mode = xe_hw_engine_group_find_exec_mode(q);
> > > >  
> > > >  	if (mode == EXEC_MODE_DMA_FENCE) {
> > > > -		err = xe_hw_engine_group_get_mode(group, mode,
> > > > &previous_mode);
> > > > +		err = xe_hw_engine_group_get_mode(group, mode,
> > > > &previous_mode,
> > > > +						  syncs,
> > > > num_in_sync
> > > > ?
> > > > +						  num_syncs :
> > > > 0);
> > > >  		if (err)
> > > >  			goto err_syncs;
> > > >  	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > index 4d9263a1a208..022fc0c30d38 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > @@ -11,6 +11,7 @@
> > > >  #include "xe_gt.h"
> > > >  #include "xe_gt_stats.h"
> > > >  #include "xe_hw_engine_group.h"
> > > > +#include "xe_sync.h"
> > > >  #include "xe_vm.h"
> > > >  
> > > >  static void
> > > > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > > > work_struct *w)
> > > >  	int err;
> > > >  	enum xe_hw_engine_group_execution_mode previous_mode;
> > > >  
> > > > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > > &previous_mode);
> > > > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > > &previous_mode,
> > > > +					  NULL, 0);
> > > >  	if (err)
> > > >  		return;
> > > >  
> > > > @@ -189,10 +191,12 @@ void
> > > > xe_hw_engine_group_resume_faulting_lr_jobs(struct
> > > > xe_hw_engine_group
> > > > *group
> > > >  /**
> > > >   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the
> > > > faulting LR jobs of this group
> > > >   * @group: The hw engine group
> > > > + * @has_deps: dma-fence job triggering suspend has dependencies
> > > >   *
> > > >   * Return: 0 on success, negative error code on error.
> > > >   */
> > > > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > > xe_hw_engine_group *group)
> > > > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > > xe_hw_engine_group *group,
> > > > +						       bool
> > > > has_deps)
> > > >  {
> > > >  	int err;
> > > >  	struct xe_exec_queue *q;
> > > > @@ -201,11 +205,19 @@ static int
> > > > xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > > xe_hw_engine_group
> > > >  	lockdep_assert_held_write(&group->mode_sem);
> > > >  
> > > >  	list_for_each_entry(q, &group->exec_queue_list,
> > > > hw_engine_group_link) {
> > > > +		bool idle_skip_suspend;
> > > > +
> > > >  		if (!xe_vm_in_fault_mode(q->vm))
> > > >  			continue;
> > > >  
> > > > +		idle_skip_suspend =
> > > > xe_exec_queue_idle_skip_suspend(q);
> > > > +		if (!idle_skip_suspend && has_deps)
> > > > +			return -EAGAIN;
> > > > +
> > > >  		xe_gt_stats_incr(q->gt,
> > > > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > > > -		need_resume |=
> > > > !xe_exec_queue_idle_skip_suspend(q);
> > > > +
> > > > +
> > > > +		need_resume |= !idle_skip_suspend;
> > > >  		q->ops->suspend(q);
> > > >  	}
> > > >  
> > > > @@ -258,7 +270,7 @@ static int
> > > > xe_hw_engine_group_wait_for_dma_fence_jobs(struct
> > > > xe_hw_engine_group
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int switch_mode(struct xe_hw_engine_group *group)
> > > > +static int switch_mode(struct xe_hw_engine_group *group, bool
> > > > has_deps)
> > > >  {
> > > >  	int err = 0;
> > > >  	enum xe_hw_engine_group_execution_mode new_mode;
> > > > @@ -268,7 +280,8 @@ static int switch_mode(struct
> > > > xe_hw_engine_group
> > > > *group)
> > > >  	switch (group->cur_mode) {
> > > >  	case EXEC_MODE_LR:
> > > >  		new_mode = EXEC_MODE_DMA_FENCE;
> > > > -		err =
> > > > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > > > +		err =
> > > > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > > > +								 
> > > > has_deps);
> > > >  		break;
> > > >  	case EXEC_MODE_DMA_FENCE:
> > > >  		new_mode = EXEC_MODE_LR;
> > > > @@ -289,14 +302,18 @@ static int switch_mode(struct
> > > > xe_hw_engine_group *group)
> > > >   * @group: The hw engine group
> > > >   * @new_mode: The new execution mode
> > > >   * @previous_mode: Pointer to the previous mode provided for use
> > > > by
> > > > caller
> > > > + * @syncs: Syncs from exec IOCTL
> > > > + * @num_syncs: Number of syncs from exec IOCTL
> > > >   *
> > > >   * Return: 0 if successful, -EINTR if locking failed.
> > > >   */
> > > >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group
> > > > *group,
> > > >  				enum
> > > > xe_hw_engine_group_execution_mode new_mode,
> > > > -				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode)
> > > > +				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode,
> > > > +				struct xe_sync_entry *syncs, int
> > > > num_syncs)
> > > >  __acquires(&group->mode_sem)
> > > >  {
> > > > +	bool has_deps = !!num_syncs;
> > > >  	int err = down_read_interruptible(&group->mode_sem);
> > > >  
> > > >  	if (err)
> > > > @@ -306,14 +323,27 @@ __acquires(&group->mode_sem)
> > > >  
> > > >  	if (new_mode != group->cur_mode) {
> > > >  		up_read(&group->mode_sem);
> > > > +retry:
> > > >  		err = down_write_killable(&group->mode_sem);
> > > >  		if (err)
> > > >  			return err;
> > > >  
> > > >  		if (new_mode != group->cur_mode) {
> > > > -			err = switch_mode(group);
> > > > +			err = switch_mode(group, has_deps);
> > > >  			if (err) {
> > > >  				up_write(&group->mode_sem);
> > > > +				if (err == -EAGAIN) {
> > > > +					int i;
> > > > +
> > > > +					for (i = 0; i <
> > > > num_syncs;
> > > > ++i) {
> > > > +						err =
> > > > xe_sync_entry_wait(syncs + i);
> > > > +						if (err)
> > > > +							return
> > > > err;
> > > > +					}
> > > > +
> > > > +					has_deps = false;
> > > > +					goto retry;
> > > > +				}
> > > >  				return err;
> > > >  			}
> > > >  		}
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > index 797ee81acbf2..8b17ccd30b70 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > @@ -11,6 +11,7 @@
> > > >  struct drm_device;
> > > >  struct xe_exec_queue;
> > > >  struct xe_gt;
> > > > +struct xe_sync_entry;
> > > >  
> > > >  int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > > >  
> > > > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > > > xe_hw_engine_group *group, struct
> > > >  
> > > >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group
> > > > *group,
> > > >  				enum
> > > > xe_hw_engine_group_execution_mode new_mode,
> > > > -				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode);
> > > > +				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode,
> > > > +				struct xe_sync_entry *syncs, int
> > > > num_syncs);
> > > >  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> > > >  
> > > >  enum xe_hw_engine_group_execution_mode
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > > b/drivers/gpu/drm/xe/xe_sync.c
> > > > index 1fc4fa278b78..d970e11962ff 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > > @@ -228,6 +228,35 @@ int xe_sync_entry_add_deps(struct
> > > > xe_sync_entry
> > > > *sync, struct xe_sched_job *job)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_sync_entry_wait() - Wait on in-sync
> > > > + * @sync: Sync object
> > > > + *
> > > > + * If the sync is in an in-sync, wait on the sync to signal.
> > > > + *
> > > > + * Return: 0 on success, -ERESTARTSYS on failure (interruption)
> > > > + */
> > > > +int xe_sync_entry_wait(struct xe_sync_entry *sync)
> > > > +{
> > > > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > > +		return 0;
> > > > +
> > > > +	return dma_fence_wait(sync->fence, true);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_sync_needs_wait() - Sync needs a wait (input dma-fence not
> > > > signaled)
> > > > + * @sync: Sync object
> > > > + *
> > > > + * Return: True if sync needs a wait, False otherwise
> > > > + */
> > > > +bool xe_sync_needs_wait(struct xe_sync_entry *sync)
> > > > +{
> > > > +
> > > > +	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> > > > +		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync-
> > > > >fence-
> > > > > flags);
> > > 
> > > dma_fence_is_signaled() ?
> > > 
> > 
> > I don't want to signal the fence here, Phillip Stanner merged a
> > dma-fence helper that does this check to drm-misc-next but this
> > change
> > hasn't made it to dma-xe-next yet. I have patch built on top of his
> > series to to convert Xe to use these helpers, when I rebase that
> > patch
> > I'll fixup this code too.
> 
> OK. Just out of interest, why not signal the fence here?
> /Thomas
> 

It’s probably fine to signal the fence. This is just a defensive
leftover from my early days in Xe to avoid signaling the Xe hardware
fence from anywhere other than a single location. This won’t be a
hardware fence though; here, this is an eager check where I don’t think
it’s worth taking the dma-fence spinlock.

Matt 

> 
> > 
> > Matt 
> > 
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > 
> > > > +}
> > > > +
> > > >  void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > > > dma_fence *fence)
> > > >  {
> > > >  	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > > > b/drivers/gpu/drm/xe/xe_sync.h
> > > > index 51f2d803e977..6b949194acff 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > > @@ -29,6 +29,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > > *sync,
> > > >  			   struct xe_sched_job *job);
> > > >  void xe_sync_entry_signal(struct xe_sync_entry *sync,
> > > >  			  struct dma_fence *fence);
> > > > +int xe_sync_entry_wait(struct xe_sync_entry *sync);
> > > > +bool xe_sync_needs_wait(struct xe_sync_entry *sync);
> > > >  void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > > >  struct dma_fence *
> > > >  xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > > 
> 
