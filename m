Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F712CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB0710E0F6;
	Mon,  6 Oct 2025 21:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj3oRDLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675C10E0F6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759786750; x=1791322750;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OURJmsJN4VPv4w2whdqTKAQCdo6qUiQmJ0YFnVW+BP0=;
 b=nj3oRDLItt0jCHVZYhiavrqR7QKnV1EZ2REg5EcaQdAtM59wEGwnLFEX
 Klq6DLBZLJoNf89EiAf2Vr1ZysBM4CfWWElfjusbySM4XIqpRt7wsRyPB
 gZiSdGBOxeTCjII+O2O0XTZEMHMh36kL66SzDyQ2i13UslvSv7792ITMY
 bGAOAw+kNIJezICKURlgsNHy+QGUjWs6YSrN24u38eOIkEcbauYTzHero
 oxBcOmxsqDmM3TzYAuVbfRTpfOjWbVSHiQtFPlA8tNwI7Q4N8MU21UGA+
 g7zSzZcDTGDt6HkkxQ/loT7ksy/HYaSIHFhatYufGomIBCoovhFE9lWb0 Q==;
X-CSE-ConnectionGUID: QBs9IXyHTzyKYW1qScKyDg==
X-CSE-MsgGUID: jWaZAAkyT6ixFRVIIz2L+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="49521758"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="49521758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:39:10 -0700
X-CSE-ConnectionGUID: tkFqlQIhTNOAIECu6+5iTQ==
X-CSE-MsgGUID: +Yu37XnUTAmAAlEQSLLc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="203720702"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:39:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:39:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:39:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkjFTZ5XpvdcdNi/pNe/pwqf7MnGhs2JtJPh/ljc/QGYpgTAavgRaiesXAHXecjlb2HMU7ahfhyIbLPpmSVKmuT3lNeQWl7/7isE1+Y+FfcZFtBlD8kgRkGXnS4PGUUlvdLMD8yGtor7sj1KvrXjnBD1kyKeev3a6rqUfNAiWrMWhDthuxRQpuPJA9xU2qWrH6JYW4LN9pIoNgDHYt+E4/0EGfszBqiXQ0JlMvSQiTjN9vt49w+LThVvRyfm3tjJMJxQWXXKVsv883ea2arv3WubmdGzdN6/mAq5efdgeqUXiH2U2V1w+mAJfoTMWhZ7ywONk+TrTOiYD9bQ97FQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbSe/ymkSq1sbQqdgtB2fspGlLaP9szDvoxmvfEi9Pc=;
 b=Bo/TJx0AJJukcB+4M7ce6aHUaDY2sQeXxbf7a8Hc2J7e0vX7ImaVbC4/mT+9WCJfitDnmdap5FEZM8mxXIlkyBzdr5wJOvsuxYZ/Q/qDjvDvlMG6Ux4aki8COqJPOzdOEgUMo90kVc5KU1rh8qmBSbq3FL6Xui+0CtDwkARAvg4Mo7ubAt0XE4Ug6FQyUVT+eFc3wYkJnBsv7DbMu8icWx05xQsg/R0eDRtWn2aQp/43mLeFKscEcxXb+wcuUsAED2w+Hf0icbNbHmFPCEgdCuZMDbqmRj0fhMMDaW+k+eJ31mIYPLwWiE9I8jtId6ixvLPYDyZLo/csHHfXCJbgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:39:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:39:02 +0000
Date: Mon, 6 Oct 2025 14:38:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <rodrigo.vivi@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>, 
 <jani.nikula@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v5 5/8] drm/xe: Implement xe_work_period_worker
Message-ID: <aOQ281Zks3cyCpkx@lstrano-desk.jf.intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
 <20251006142034.674435-6-aakash.deep.sarkar@intel.com>
 <aOQwzYTSwpMR6VW+@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOQwzYTSwpMR6VW+@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF7A0031045:EE_
X-MS-Office365-Filtering-Correlation-Id: 59279ea0-df2a-4312-8607-08de0520c433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2tQam5xNzZ5K3A3enFNY1dEUEhpdnk2SUNmendmZlhGTHdFelpheXR4WVdq?=
 =?utf-8?B?a3ovTzNucVVkN1FFbElvVWd3NEo4cUJkbVNwSjV5bFVtSUpmL1U0YVFXTVdu?=
 =?utf-8?B?WlIvOTc2RVNvUlFjeFM3Q2NMVVZnd2pueXRyVkt1RVBwYlFYV0JESUFILytW?=
 =?utf-8?B?UjJaN1N3UEo3OTNNSUYxOGJ6VTgvakRhYTFsUzN6UGZ1cTNDNTJ4QkVvZ0Q3?=
 =?utf-8?B?a0tiQjhSUnJmdWVXcEI2UFJTSzRMOWN3cW9rRnRvcExjVkVnQVFWemdYK1lW?=
 =?utf-8?B?K0ZUUk13dG5LUno1S1BNZTBYMlQzZkV1Njg5WTJGK0IzSkprcXBZOVMzWGNK?=
 =?utf-8?B?NUt5Tk1GRytYejFLeVJ0STdORHdMWlMyam9vTHp1WFZodDhqSEdJMzBOOEhj?=
 =?utf-8?B?YkVqTUdrS0VPcm9WNmFKY0pGYVhHaTIrb2tYUDRXbHNnV200c0dqdG1aTVNY?=
 =?utf-8?B?clFvTW56ci81ZVRyNG5mdTc2eTZCNHhiVFZxWEc4QzlsU3lrcktIYVRwS25l?=
 =?utf-8?B?QUdHbjZPREhwRWpWRVE4NERVbTRySVUrN2pFanROc1JVMmJWaWZKTlBzUlpM?=
 =?utf-8?B?K2pTaTVWWEJJVnkxTTI3a04wd3hwRjk1NGdXY2JSRDNTT2hHM3crTjdNdFRI?=
 =?utf-8?B?M1kzcVp0ZGwzV0JrWm5iMExzYkluNjRBdThMaXlnUVVMdERtRlZnYTMvSmVY?=
 =?utf-8?B?QXNwaThhRldENDZkdXJ4YnBoaHl0dkxpZWx3aXNSMXZuVVpBSm9JZWtqaEky?=
 =?utf-8?B?eWJrcTNZQmpOeEQ3WkZZcS80SEY0dzl3SmFlNzhUNStKNVlGZFBKVGs0VXho?=
 =?utf-8?B?bTRJTkxBTWt0WkNkY1NsUm5FZ2hzN2dEcmUrRGxVaVN6UmlaWTZFVVJzUWxX?=
 =?utf-8?B?VG5YVWhzK3NBeDQ2VysxZUVIUnBTVEl3UVpYSW9jeVQ4VnpiQlNEZkh2a2ZP?=
 =?utf-8?B?NXBWQ0IyUlRDYjczRENHMjdJeloyZkRvS0hyYjVNQ0s3aUxWMVZhQ045aTQ3?=
 =?utf-8?B?ZTZVZXVzOUJqU0NreUFTVFo0bUlQQjB0SFQvdktQWno3a2dQK2ljbTFvdmY2?=
 =?utf-8?B?dGtPampMVzY2V1JpcnhQREc5NWNZZEY5enl0ck9KSDlvVFk2c2dWMm8wRFZR?=
 =?utf-8?B?dUhjWk5QbzhpTUp4dE1FZzJvS1Rwdld3RngyWmo3VmZUR3laYjFmR0R2cVRV?=
 =?utf-8?B?RnVNTUVBMW9Zc29GdUVNdWxsaFRkTElOM01DbnNrMFJuTTRIZ1IrYnlrYWk3?=
 =?utf-8?B?OHpSVS9jRTcrb291VGdXUzlDMWN6dHU3RldHMzh4ZXdXOGwyMWRQWTB3Rzd3?=
 =?utf-8?B?ZGgraTZVTkhRSzRGZG1tZlA3UW5LRlI4aDZ6VElYS2tpdURQK2w4ZjBkRnJJ?=
 =?utf-8?B?MmFwcU5iY3BwZklmL2M4akExQSt1eVFNbXk2MnhZcGdsTm9KODZJT3dwbUMr?=
 =?utf-8?B?dkhtWmJENjZSZVFocklJMnBTbnFWSVp2bGszWjVvSGdyUUtzbVl6S0FBNTha?=
 =?utf-8?B?eng0UUo4VldwOWZ3a2YvcVpTak5wKzJ0ZlFXb0MzL2FWQ0N2emVmSUdjdDdk?=
 =?utf-8?B?Sk5ucFNuYWRyV2tYM1JRSkdoZ21sNEJJc3hPdmNYWDExUldxVm8rZUhReHl2?=
 =?utf-8?B?SmRnMUR2S2V1OEErRG1jSWFDQUFBZG5mNFRpd2VJWWY4QitBSEdWSUZGN2xT?=
 =?utf-8?B?Vjg0bnYxVzR1TXRKRS9KRm1qV0VBa2I5bFdXd1QxTTFYMFBHWm1NTW9XK05V?=
 =?utf-8?B?am8yalJxbVduMEduMTdJbDdSWkNkWEs4QUR3WlB3cXNpSzZLZE5tdlhYRVpn?=
 =?utf-8?B?bHN2NVJCell4OVJIaVMrZE15RFlFVy9SOEZlWWhJWFBrSFdXLzZPSkUzNjJN?=
 =?utf-8?B?eS92NXdrOWFtWFdNaWc0RzZ0dlNRQXE4VENzUy9FMUNLUHdNMlNPU1ZIeFE3?=
 =?utf-8?Q?QagkPoRqscPre6ZDVd9J0Imeb+JViMfM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2FaK2RRd3pNblpmakNGWHBmYzkvRGJJSXBoWWNvR01MU3JLMk51S2NRNWVE?=
 =?utf-8?B?SnY0VjBtbEZQU1Y5RmVSS1JwSXVhZVd1NVY3VVJ6Rk1iRE5xRWVIQ2tmeklK?=
 =?utf-8?B?Q1EycXVrYmhIRW1PS29wSVZIbzlZa2Nxd0JHMm1PekV3RVpRVFdGWWVxQ0dE?=
 =?utf-8?B?dVFmSktTUFFTQnFtbWtUV3YyRlk2Vk9wZHZYZ29acnl0NVc4dnk4OGtZMXNr?=
 =?utf-8?B?a2tFOXhKWmlMaE9ja1c0QkpGaVNqSHdISU9JSmw2RVdNd25WbUtlLytLa3A0?=
 =?utf-8?B?OC9yNk4rNS9pdE1MVTN5MXF0cjBkZDd6T0c2SU9acjJKYmZOT3BUUzZGWjF1?=
 =?utf-8?B?L3dKckpUWlFmMVJ3U2toRFFUNHFkbVRVQTk1dHIvdzI3T2EvTzNqVHRCVVN3?=
 =?utf-8?B?OW1NemQ5WXVyWFRzOWV0bmxBaFZhVXVHRFNKV0M1aGFIU093VjlFM1J1UXhV?=
 =?utf-8?B?cDhDYmxOZTl1b1h5QUpGM1BrUVFIUTg0OVJQVzlmUS9GakVyemxJc3g0d0k2?=
 =?utf-8?B?V1p0V20xc2xjYVh5bnZOd01GaDQ5Z1FMRkNCRVZGVUt2OC9PNnpQcDNxSWlK?=
 =?utf-8?B?ZVJ1Sk52Z1FNb0dMcEJFMS9yL1RsWEVudGsvby9MRHNpM0hSWkZBNDBlemtU?=
 =?utf-8?B?R0UyUlN5VkNTTzA3bFl5SzdZZ2RaZUg1K3UzTUM5bXFkNjU5OWdtU0RRTHdr?=
 =?utf-8?B?Z0lmS2gycjZmOW0vV05BcGVvclJSeCs5WUorMGJSZG85UzVQM0RBMDI5anJx?=
 =?utf-8?B?cGVCUjlHcjF6UlJLUmlzZDdCa2hMUEVyVUJPR0FueGFORGJiMk1kNDJBWUlZ?=
 =?utf-8?B?bFBIcDVaNHR5eVU5QTZkcnc5VkJ0Y0w3WTAxVXVIQUpzenNxZWN3UGZvZmZx?=
 =?utf-8?B?RjlGZ3paaStkcFNGbTRnZUdHanlvbzAyQUhpL05kNXRiOVV4Sm5PTU03Q0c4?=
 =?utf-8?B?d3J3V2E5MXRhdzdQOElwY1Vna3ZJVHQxVG5ZdW5GcHNkVTBWeFZ4Q2s5VlZQ?=
 =?utf-8?B?STZOWVZjeG52UndnV1lTaUVEdDFhaWM5ZmpFZTN4OTluelRuY283T1Mxa28w?=
 =?utf-8?B?YmRaek1TNlM1VTlGbDcyQTdNVndZTkVoUVBiLzRkZ0E5MmMwSFZINklYcG1L?=
 =?utf-8?B?RU90bUc1UHJxeFU4U3JaVXVtaHRwaGs4YkphT0NmMyt3S1JwYWVWekhTUGlW?=
 =?utf-8?B?MS83bFV1OTBFZ1BLeHBCLzBaVCtudlB5L3hicmlVYmtpNVg0Slk2UHk3L25a?=
 =?utf-8?B?L0VPUkZGMXhCdHdoU1N3eGxTVVRVMld6bld4MmlVU0V6ckUzcC9pOHFPMTd2?=
 =?utf-8?B?WkdBNW5rNkNUS0lGUU96c0UvVWpxaHRPeG45UTVtckVUY3RjdFNLeGpzYTZs?=
 =?utf-8?B?N2FVZ3dTUG1mL3dTelJJVVRhVmEwN2d6M01UaWhFbTEwQ1NKcGFUSUZJQjhi?=
 =?utf-8?B?ZGthbm42RzZ5ZXo3NWJSaXUyOCtBejVZeld0SXJYMmRqOFdZcWt4Zks0OEla?=
 =?utf-8?B?VHlwK2J4N3B1Y21JYTk2VldFaUxaZWpoYnJ4NzFmTm5CSjRRYm9pOWN1K2I2?=
 =?utf-8?B?VWM3Y2FQa0Z0UWRwMEsyZ3pLZHg3SW5DZHdTM2tyVnp2ZU5SQ1ZrOXpmdkZF?=
 =?utf-8?B?a3VCSTJKbE5Kazk3YUVnVVJnQVhZdnVqTm94cVEyMUZ1L0pMZnhBa1lrNE1E?=
 =?utf-8?B?N3NsWkxjQnQ1cFRiMHZ3MXdhMk1FYXZlL0M0azhMVzlNU3JzRHhjQTBxVitw?=
 =?utf-8?B?WTQ4VEVYbUVsSkZHM21lUW1LdXk2QjR6REcybTZmSkRBVlorTTVEQkUwT1lw?=
 =?utf-8?B?Mk9KWVVrbzlzWTh0UkVsK08zYkJPSjRRSTgwZzZDTU52YVNiV3V4Wm1pUWd0?=
 =?utf-8?B?V0htWFBGVGZFSzYxMFh6Z0w1cVN1SXdGM0FESFQ3ajdvc2RReVZZaXl4SUIy?=
 =?utf-8?B?Vjk5c041ZDB2dGRsRWVGSVFhdXFOQnMwaHYyTGZYK0MzVGZxVmdOYjVZZWpU?=
 =?utf-8?B?a0hpNzhNcXlnbHdmMFdpL1dwZHhYSTMzZnBjN3l5bHNlekx1WmxiZVkwT2d1?=
 =?utf-8?B?TjhXb1RraW5ubWdoZUE2L2oybTU3S25PMnVxTlhjZk9RTm5yNHVCeXJqUGF1?=
 =?utf-8?B?eUtNMGk2eHpmUzNGMEZYVVZJSjRmWmFsSXVpR1pGQnFmQ1o0SHRzL1QxUHZs?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59279ea0-df2a-4312-8607-08de0520c433
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:39:02.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNDA/RCNFXZI9LghivAA0FZFKNZffIn5HDNmRK/INQ5gw8EtYZSIsLlVwC5dj47Gu8v7XFQl+r2peg0NnwT+Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
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

On Mon, Oct 06, 2025 at 02:12:45PM -0700, Matthew Brost wrote:
> On Mon, Oct 06, 2025 at 02:20:26PM +0000, Aakash Deep Sarkar wrote:
> > The work of collecting the GPU run time for a given
> > xe_user and emitting its event, is done by the
> > xe_work_period_worker kworker. At the time of creation
> > of a new xe_user, we simultaneously start a delayed
> > kworker thread. The delay of execution is set to be
> > 500 ms. After the completion of the work, the kworker
> > schedules itself for the next execution. This is done
> > as long as the reference to the xe_user pointer is
> > valid.
> > 
> > During each execution cycle the xe_work_period_worker
> > iterates over all the xe files in the xe_user::filelist
> > and accumulate their corresponding GPU runtime into the
> > xe_user::active_duration_ns; while also updating each of
> > the xe_file::active_duration_ns. The total runtime for
> > this uid in the current sampling period is the delta
> > between the previous xe_user::active_duration_ns and
> > the current xe_user::active_duration_ns.
> > 
> > We also record the current timestamp at the end of each
> > invocation to xe_work_period_worker function in the
> > xe_user::last_timestamp_ns. The sampling period for this
> > uid is the delta between the previous timestamp and the
> > current timestamp.
> > 
> > Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c |  11 +--
> >  drivers/gpu/drm/xe/xe_pm.c     |   5 ++
> >  drivers/gpu/drm/xe/xe_user.c   | 127 +++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_user.h   |  19 ++++-
> >  4 files changed, 150 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 5a084fd39876..54ac71d1265d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -140,11 +140,12 @@ static void xe_file_destroy(struct kref *ref)
> >  	xe_drm_client_put(xef->client);
> >  	kfree(xef->process_name);
> >  
> > -	mutex_lock(&xef->user->filelist_lock);
> > -	list_del(&xef->user_link);
> > -	mutex_unlock(&xef->user->filelist_lock);
> > -
> > -	xe_user_put(xef->user);
> > +	if (xef->user) {
> > +		mutex_lock(&xef->user->lock);
> > +		list_del(&xef->user_link);
> > +		xe_user_put(xef->user);

You also have a potential lock inversion in the current code.

There appears to be a possible chain of:

- user->lock -> xe->work_period.users if xe_user_put() is the final put.

However, cancel_delayed_work_sync() is called under
xe->work_period.users below, and xe_work_period_worker() takes
user->lock, which is the inverse order.

I don’t think it’s actually possible to trigger the inversion due to the
reference counting, but it’s still quite concerning.

It would be best to avoid calling xe_user_put() while holding
xef->user->lock.

Also, if you can’t come up with a better reference counting or xarray
scheme for xef->user, I’d suggest adding a
might_lock(&xe->work_period.users) to xe_user_put() so lockdep
immediately knows what xe_user_put() can do on the final put.

Matt

> > +		mutex_unlock(&xef->user->lock);
> > +	}
> >  	kfree(xef);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index b7e3094f8acf..c7add2616189 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -26,6 +26,7 @@
> >  #include "xe_pxp.h"
> >  #include "xe_sriov_vf_ccs.h"
> >  #include "xe_trace.h"
> > +#include "xe_user.h"
> >  #include "xe_vm.h"
> >  #include "xe_wa.h"
> >  
> > @@ -598,6 +599,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_suspend(xe);
> >  
> > +	xe_user_cancel_workers(xe);
> > +
> >  	xe_rpm_lockmap_release(xe);
> >  	xe_pm_write_callback_task(xe, NULL);
> >  	return 0;
> > @@ -650,6 +653,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  
> >  	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> >  
> > +	xe_user_resume_workers(xe);
> > +
> >  	xe_irq_resume(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> > diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> > index cb3de75aa497..fb54d2659642 100644
> > --- a/drivers/gpu/drm/xe/xe_user.c
> > +++ b/drivers/gpu/drm/xe/xe_user.c
> > @@ -5,8 +5,15 @@
> >  
> >  #include <drm/drm_drv.h>
> >  
> > +#include "xe_assert.h"
> > +#include "xe_device_types.h"
> > +#include "xe_exec_queue.h"
> > +#include "xe_pm.h"
> >  #include "xe_user.h"
> >  
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/gpu_work_period.h>
> > +
> >  
> >  /**
> >   * DOC: Xe User
> > @@ -50,7 +57,82 @@
> >   */
> >  
> >  
> > +static inline void schedule_next_work(struct xe_device *xe, unsigned int id)
> > +{
> > +	struct xe_user *user;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> > +	user = xa_load(&xe->work_period.users, id);
> > +	if (user && xe_user_get_unless_zero(user))
> > +		schedule_delayed_work(&user->delay_work,
> > +				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));
> > +	mutex_unlock(&xe->work_period.lock);
> > +}
> > +
> > +static void xe_work_period_worker(struct work_struct *work)
> > +{
> > +	struct xe_user *user = container_of(work, struct xe_user, delay_work.work);
> > +	struct xe_device *xe = user->xe;
> > +	struct xe_file *xef;
> > +	struct xe_exec_queue *q;
> > +
> > +	/*
> > +	 * The GPU work period event requires the following parameters
> > +	 *
> > +	 * gpuid:           GPU index in case the platform has more than one GPU
> > +	 * uid:             user id of the app
> > +	 * start_time:      start time for the sampling period in nanosecs
> > +	 * end_time:        end time for the sampling period in nanosecs
> > +	 * active_duration: Total runtime in nanosecs for this uid in
> > +	 *                  the current sampling period.
> > +	 */
> > +	u32 gpuid = 0, uid = user->uid, id = user->id;
> > +	u64 start_time, end_time, active_duration;
> > +	u64 last_active_duration, last_timestamp;
> > +	unsigned long i;
> > +
> > +	mutex_lock(&user->lock);
> > +
> > +	// Save the last recorded active duration and timestamp
> > +	last_active_duration = user->active_duration_ns;
> > +	last_timestamp = user->last_timestamp_ns;
> > +
> > +	if (xe_pm_runtime_get_if_active(xe)) {
> > +
> > +		list_for_each_entry(xef, &user->filelist, user_link) {
> > +
> > +			wait_var_event(&xef->exec_queue.pending_removal,
> > +			!atomic_read(&xef->exec_queue.pending_removal));
> > +
> > +			/* Accumulate all the exec queues from this file */
> > +			mutex_lock(&xef->exec_queue.lock);
> > +			xa_for_each(&xef->exec_queue.xa, i, q) {
> > +				xe_exec_queue_get(q);
> > +				mutex_unlock(&xef->exec_queue.lock);
> > +
> > +				xe_exec_queue_update_run_ticks(q);
> > +
> > +				mutex_lock(&xef->exec_queue.lock);
> > +				xe_exec_queue_put(q);
> > +			}
> > +			mutex_unlock(&xef->exec_queue.lock);
> > +			user->active_duration_ns += xef->active_duration_ns;
> > +		}
> > +
> > +		xe_pm_runtime_put(xe);
> > +
> > +		start_time = last_timestamp + 1;
> > +		end_time = ktime_get_raw_ns();
> > +		active_duration = user->active_duration_ns - last_active_duration;
> > +		trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> > +		user->last_timestamp_ns = end_time;
> > +		xe_user_put(user);
> > +	}
> > +
> > +	mutex_unlock(&user->lock);
> >  
> > +	schedule_next_work(xe, id);
> > +}
> >  
> >  /**
> >   * xe_user_alloc() - Allocate xe user
> > @@ -71,9 +153,9 @@ static struct xe_user *xe_user_alloc(void)
> >  		return NULL;
> >  
> >  	kref_init(&user->refcount);
> > -	mutex_init(&user->filelist_lock);
> > +	mutex_init(&user->lock);
> >  	INIT_LIST_HEAD(&user->filelist);
> > -	INIT_WORK(&user->work, work_period_worker);
> > +	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
> >  	return user;
> >  }
> >  
> > @@ -153,12 +235,49 @@ int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
> >  
> >  		user->id = idx;
> >  		drm_dev_get(&xe->drm);
> > +
> > +		xe_user_get(user);
> > +		if (!schedule_delayed_work(&user->delay_work,
> > +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> > +			xe_user_put(user);
> >  	}
> >  
> > -	mutex_lock(&user->filelist_lock);
> > +	mutex_lock(&user->lock);
> >  	list_add(&xef->user_link, &user->filelist);
> > -	mutex_unlock(&user->filelist_lock);
> > +	mutex_unlock(&user->lock);
> >  	xef->user = user;
> >  
> >  	return 0;
> >  }
> > +
> > +void xe_user_cancel_workers(struct xe_device *xe)
> > +{
> > +	struct xe_user *user = NULL;
> > +	unsigned long i = 0;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> > +	xa_for_each(&xe->work_period.users, i, user) {
> > +		if (user && xe_user_get_unless_zero(user)) {
> > +			cancel_delayed_work_sync(&user->delay_work);
> > +			xe_user_put(user);
> 
> 
> Here’s where this looks problematic:
> 
> - Calling cancel_delayed_work_sync while holding a lock creates a locking
>   chain between work_period.lock and every lock acquired in
>   &user->delay_work, which is a pretty risky thing to do.
> 
> - __xe_user_free acquires xe->work_period.lock, so if xe_user_put is the 
>   final reference drop, it could lead to a deadlock.
> 
> At a minimum, you need to release xe->work_period.lock inside the if
> statement. Ideally, you should reconsider the entire locking strategy.
> 
> Matt
> 
> > +		}
> > +	}
> > +	mutex_unlock(&xe->work_period.lock);
> > +}
> > +
> > +void xe_user_resume_workers(struct xe_device *xe)
> > +{
> > +	struct xe_user *user = NULL;
> > +	unsigned long i = 0;
> > +
> > +	mutex_lock(&xe->work_period.lock);
> > +	xa_for_each(&xe->work_period.users, i, user) {
> > +		if (user && xe_user_get_unless_zero(user)) {
> > +			if (!schedule_delayed_work(&user->delay_work,
> > +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> > +				xe_user_put(user);
> > +		}
> > +	}
> > +	mutex_unlock(&xe->work_period.lock);
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> > index 341200c55509..55016ba189f1 100644
> > --- a/drivers/gpu/drm/xe/xe_user.h
> > +++ b/drivers/gpu/drm/xe/xe_user.h
> > @@ -9,6 +9,8 @@
> >  #include "xe_device.h"
> >  
> >  
> > +#define XE_WORK_PERIOD_INTERVAL 500
> > +
> >  /**
> >   * struct xe_user - xe user structure
> >   *
> > @@ -28,9 +30,9 @@ struct xe_user {
> >  	struct xe_device *xe;
> >  
> >  	/**
> > -	 * @filelist_lock: lock protecting the filelist
> > +	 * @filelist_lock: lock protecting this structure
> >  	 */
> > -	struct mutex filelist_lock;
> > +	struct mutex lock;
> >  
> >  	/**
> >  	 * @filelist: list of xe files belonging to this xe user
> > @@ -41,7 +43,7 @@ struct xe_user {
> >  	 * @work: work to emit the gpu work period event for this
> >  	 * xe user
> >  	 */
> > -	struct work_struct work;
> > +	struct delayed_work delay_work;
> >  
> >  	/**
> >  	 * @id: index of this user into the xe device::users xarray
> > @@ -68,6 +70,17 @@ struct xe_user {
> >  
> >  int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
> >  
> > +void xe_user_cancel_workers(struct xe_device *xe);
> > +
> > +void xe_user_resume_workers(struct xe_device *xe);
> > +
> > +static inline struct xe_user *
> > +xe_user_get_unless_zero(struct xe_user *user)
> > +{
> > +	if (kref_get_unless_zero(&user->refcount))
> > +		return user;
> > +	return NULL;
> > +}
> >  
> >  static inline struct xe_user *
> >  xe_user_get(struct xe_user *user)
> > -- 
> > 2.49.0
> > 
