Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D335AC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 06:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38F10E58F;
	Wed, 21 Aug 2024 06:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5ZLSLMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C1210E58F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724223309; x=1755759309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TOkCOBGfpSp/LjGcR9RjG6FCm/yPdhLBlZWQ4k3eZpI=;
 b=e5ZLSLMG48afll5XA6bg0zvm+hGToCxNhnlK6b46J/u+t2QUUuu7oxbp
 1KvPFqiS5UUxSyedB6fFJMbTR3V26YBkyOZaUYmzDER/JTUwbNz6za506
 NA1FaDL27uqfyJcLlME2SPfGtMnq+XNlXXZBNZiw7tKnXrYjLyD7jhWzg
 zj8i9RMQWI8LwXn01QLVO/4O61ldYaQaB2jp4zMU5h8fwtvWH4C+nNOfY
 RLowfaIN5csAJna+Djvk6qiVaxDZo6gLwL8IL2ppjHoA8vvABoI7uqN5l
 D2imLFTpAhw4AocqLQPdFoZv/0UjAIehdN58ym/WXiwbTZlLGP9bwHdWL w==;
X-CSE-ConnectionGUID: 56aNjHNsSlmZeAl4ROSbLA==
X-CSE-MsgGUID: Dd6kxJ57QRGIA9kdEvZofA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22704776"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22704776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 23:55:09 -0700
X-CSE-ConnectionGUID: kJ3QFnjLS4WP7jdJJ54OqA==
X-CSE-MsgGUID: xhCL6tfrQwytJIgOXbjIPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61760440"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 23:55:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 23:55:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 23:55:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 23:55:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 23:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrqaJFJhDDpCZ7cuFkWh6cx/Q8VMvDWgEtFeQhzhhH7/sfWktprCVkjc09+X54oqJ0874LOxNpklwxhe0copCnWcpZecNHDZQluX+VmUMCTbY2JgUCzWwQgE2D4yN43VNslH8YMBWkIpnA5aYIeFkXQ8HuhvfFb3nCSv0kcFaecjOC3TKFwRAIeYQi9fyIMoUsP/hKx8/Qpk5pHuM3v1mBBjFiPGnAy4Ek96ZB/zwzhhKZ3LcUtKLKq6Xf1CMmMofpcXs9lWgUF9BmO4uRxFTt+F7Tr4cwMSpil0iUum53QjfM78E30so1EsnqWRNkJggLBj4aI2uPZv+uUvjlLGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRaia3Objh40Q2CqS08RICrnjDPJJH4ff4E+wc0/wD8=;
 b=ZPtsSTZhKSE4R2NPe3+nrP6cvTHiKp7gJ4tr1Qxl5r5869WIOfigBuFQ+qSzW6n0SESGfLbxfG1c8hX/h4U/8xGKBp63SgeCSqqYqbHU3wZDglR6as28e0F1tcZAxY9qBBOiAbNPyUgCfxEpjV73cNa5o06NamuF3EoX7QsgFN7T//zoekfkoxWd5dgHvLtP38B+06kiJDps/4Jkc+NTIsV/sYGDCLm+PK5XlWLGDoUwd/0rDeDBJJAutFqlzTlsUte5w2kcokfp89yMCkYolIZ8VhTH5Y5iIqdj2E3NhJ0f4nrJDpCw2gbW6E/VzUt0kjflYmaxzSJE41Qvp5OcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Wed, 21 Aug
 2024 06:55:05 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 06:55:04 +0000
Message-ID: <31644fc1-d66b-4cb9-a3cd-3f57076cd4e1@intel.com>
Date: Wed, 21 Aug 2024 12:24:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-3-riana.tauro@intel.com>
 <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
 <bd7dfd17-0052-4176-8977-5b2b3bacbfad@intel.com>
 <b57ef7fc-999e-4622-bdef-5cf6c1ca3391@intel.com>
 <2281f0bf-6b84-426f-8484-2f93d31f166b@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2281f0bf-6b84-426f-8484-2f93d31f166b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a6f236-7051-41eb-70ea-08dcc1ae2f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hlNWFFWHN4RU5WdzRFT2Nrc1pvRkZEa3lHQnNMT25LWjU0TTgwL0ZJV1cr?=
 =?utf-8?B?TDlCOURaM0hvQVFlQ0VIbVk0RXBKcnI0MDRpbHRuUzltQXpvZWNEUHVEMUlh?=
 =?utf-8?B?UlRmRmdvS0V0c2tPaDZpRUFIZnV4YUltem0zMk1VVWMvakpWcTdrRW55MWpK?=
 =?utf-8?B?cGoweWYrbVlaeHdpTm5lZGZHZ0NIVUxGRDlZNEFVTm5KdG1SQ05iaVVRVzFw?=
 =?utf-8?B?TzNta2o2WGYwQVZReGdybTJjSkJwL1h6QkMwaVdVbFlwREhtUFBkQlFObWJF?=
 =?utf-8?B?VXVCMktFMVpYOUxPNjNxc0h4QUMrRkEzcGdjQ2xIeEVBWWNaaEJQTlVESmhT?=
 =?utf-8?B?ZlhybkY0R29pVFB3TkJ2NnpwTDY0MG1kZ3NVYXZtVWdEbmdETEMvV3VUaGhF?=
 =?utf-8?B?MnJvUFpkb3ZiM2lnVzk2cEtpSjg0ZGRHeWYvaysvSjlyWTZYYXN2RnVCQUVQ?=
 =?utf-8?B?TitwTzQyTFFkdHpiQWZVZSswZnlxckx2bGYrbDBHSkZkVkh5ODVpYkJMazBm?=
 =?utf-8?B?aGlScnZJVllKK1dmVUJCTmRveXJqWnBGZy9MNG1lOFluYnJaTXZqZnVvdWg4?=
 =?utf-8?B?NmJta203NDVXMlJjTHRMWVhlVjFpNXdPeVJuZVJWMlR4c01OVTJ3cXo3b0dD?=
 =?utf-8?B?TmxjV2FSQVpIc2JCOXRIZ2Q1aTg3MmU0U0tqNGcvdndwRElIYUlyRndrQldj?=
 =?utf-8?B?Y0lFS1U3L1EvcGRtNFZpOXJvOU05T01URkhSRFZmQ3BJMjNZcVYrTllUVzJv?=
 =?utf-8?B?VU5TQldBNHFjcjdCQ0RLMEYxZHU1dWxYMXQ0bGV3OEZmU1lUcHNmU1gzcjFz?=
 =?utf-8?B?R1B3OVNHb3huMVVvbWMvWURTTWlkK0tIMHV3VWY0T05ZekVkdW1VYk9WZU5I?=
 =?utf-8?B?SWcraUFOejZRUG1JSGo0K2JPZGNWSGdqVDY4VWFKVTJYbmlzMUtrV0Q3Ymdi?=
 =?utf-8?B?Q1N5aDNYNEFMbWM0Uko1M0dXNDg5UXZhVmpqYmhTaEtFT3NWK3Z5UnNBbGQ5?=
 =?utf-8?B?WS9qRUNSWVdnOEFuQnpRZi95aWlMaTFUWFVBTzBKTkVWdW5lVWhuOU0rMWc3?=
 =?utf-8?B?RGcxMHNPZVdRa0pJak1qaUJLYjBkYmFsckg2R05vNXVSK3J4dnZ4NEVsdll5?=
 =?utf-8?B?aGRpVFlZSVNNcjdCNTEySXhHVGNOWUlrNjRCdFNJajZZSW4zWUkzRy9PVWpJ?=
 =?utf-8?B?elJWcEllVDhvSGFTUCtvbVJKa1hqWWtPa0JQNGxraWs4UzBZOFFwTXpxckk4?=
 =?utf-8?B?TWlMRjNpTE1TNjRBcUlIZGdSSDJOck1Cck9GNDRHYjZGT0Y0ZkNOdFVvdW1m?=
 =?utf-8?B?SmNqQzllckZsTmJjejdvTmppMTRRVm5tT3J3SENXamNDQ1lWVmNySTBtVnBO?=
 =?utf-8?B?bGpURGRUZkNWOEhqVCs4VCtVZkl4ZlRmTjVyOVhXOE5uWUlxQ3ZJc0hRdkUz?=
 =?utf-8?B?VFhuWnpmb2xITVB4M3IzZEo1ZG4vMVFZRVR6Mm5rRTdTSWM0RksweUF2LzhQ?=
 =?utf-8?B?M1RSZlhTamczYVJFN1dVYlhwS1pqVEhSdW5EWXF4ZDdid1VlMTVzdUJyWHNo?=
 =?utf-8?B?R2dJY0pGa05idCtWYmlRd0RhS3RCYm0xUXdJNEhkTFBOVzNxbHBnQ0x3dCtE?=
 =?utf-8?B?YWZMUXp0VDVSSzRTMXM3NGNzOThEM3ZCcnJpVE02NzgyZUh0QmY1OVZYTmRr?=
 =?utf-8?B?OEZNc3E3T1NwMTdFdkVaSGpKeHVmRkpVTzVEeDd1ZERZYTFFSE9DaVFhS0FG?=
 =?utf-8?Q?DUmOIaG2P4nC6C8bmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGdmcVg2NGVuT21McFl5SXRsMUJBbi9HdjBuNEFoNjdEaXpaaDJqczRKR0RL?=
 =?utf-8?B?TWhXbWVVclMwWFdLYXcwUWRsR1BBM0pRWW5BS04waTVGTzB3YnpWcUl6a2pJ?=
 =?utf-8?B?SDVrTWhZd3NneXp0bGVrK1dmZ0Z6RmZ2SENOaVVaczBMWTNFK2gwcHVrYnFE?=
 =?utf-8?B?d1J1SFdWOThtVVRlVmJ5SnQyZDhBNnEvQzZFNlNTbThqbmlGaVZvZzM3WjVW?=
 =?utf-8?B?NTl5RjRxRmZrMUdjUjJwQXlkSzg0VTFWZWRFTnJJQktXcVpKcFp2b251bkJl?=
 =?utf-8?B?cXQyb01Kbnkxa09oc1BxOVBqVUdvSk9lVFR6T01Cb0dQaFU3RDMzcFNCNnI1?=
 =?utf-8?B?bjdPNFJPSy9udGZtY1N3YzdpeE0yNEQvT0x4bk1HaFUvdXdCMjJZZVk5bGx6?=
 =?utf-8?B?MER3Z3ZxTnk3U2pxSXNGUUl6VTQ1djd4aFhTaytzZFpJQzdtSmFmQlBOei9h?=
 =?utf-8?B?eTh0ckFoMXZuVmJvQ1R0SmZ6Z29ZL0ZLR25YSHU2aXZiVi83ZTRTNmFkMHBh?=
 =?utf-8?B?OXFERzRmWFVGd3VrWVZ2RXV4KzRGdlVhemlqbDBvRUU2bWg0azE4ZlBzcEpJ?=
 =?utf-8?B?NVU4N25wWmlxSnMrcVpoRUQwRGVTQVpFQ2Y0cWJBZzg1dUtrZnlGQTBLdHdt?=
 =?utf-8?B?V3NtT1RNV0xkK1VjcVM1eEpqSGFMZktOMGoxVEY1WXJ6V2NuVHIxVzI3bUJH?=
 =?utf-8?B?RG43Vyt6bm84T2lpYWtaak9ZZzFYUU5SUzhQUStsL0dDZmdFK04ySzhJRHFH?=
 =?utf-8?B?ellYanNib0NtZkJhSVNJUTYrS016dXBjT1ZNSUl2TWtld2pGcEpJTnA1ZXBD?=
 =?utf-8?B?MGFjVFpjdDFMNWlaQUFkMmRPMnMraFNwNTR2Z2MvQUFldWNkc2trdzdKNENo?=
 =?utf-8?B?YldySDJzYzZMekJXUll1alJtYmNnWm5rQUZORUsrMmxaV1hUQ1U0Mlk0Rmt6?=
 =?utf-8?B?b1phbDFCTXBjQW5QUmFzY0lVVm5jR1R4UkYzRmtpL0l6SWpKc05BcG9KNkpD?=
 =?utf-8?B?MGZlanRCMExSajZhR1JJVmtaZFlTSEQ1ZzhEZzFveHMzRktKUkZJZzNhdm9h?=
 =?utf-8?B?cGxoc0NOY2o5Qk5kM0I0VHJEcHNKYmJzU0ZTSkdaRC8zdEc2UnE5OCsvVVhv?=
 =?utf-8?B?bDZuMnZxenhaaDU1dnNsR1l5Tkxmay9qZGd3Y2I2aEx6VS9zbGhQOWpqM2hh?=
 =?utf-8?B?NDArdFY5OHUyYnB5TEliNjlML0tXU3dPNkM0UXh2K1Q1dElLTGk3UUI5bHlr?=
 =?utf-8?B?b2wraG9DUVZFakZiRVlCbmpwMXFoRXk4QjVPalBheUVtcmFkVGJCZUZ2clRz?=
 =?utf-8?B?b00zMEVHaUpCWkdaNjV3Z3RXc3JpQUF3d3NRS0lzT2dRVU9vQVgxYkYwblBB?=
 =?utf-8?B?QzM0S0NrR3Q1aW5hZTQwQmlWT0w5R2w3YXZYdjBMT1E5OW8xSFlXaEtzWitt?=
 =?utf-8?B?M2puWDRLTnRZQjlFclNnckw5WEZ5a1NoSkxmUkZ4T0R5MDRMUXh3R3laRnNX?=
 =?utf-8?B?QVpXUjVFdk0wZG9JbjlaWVB3NTJ0QWEvT1pNb2VzczV2ZWhVZURSQ0dYT01W?=
 =?utf-8?B?d1MwSS9DWmpOMkpVL1JleVV5N2NtZkJFa0E1eTR6NUdKRGY3WTBibWk3ejJO?=
 =?utf-8?B?YmhiSjh3cGs5b1QzN01KcDFiOWNMcllqbk5TcFRvU0NlVmJrSVRPTkRZbitX?=
 =?utf-8?B?TTIxai9PTWR0K09kNHJzanJxcHlFb2Iwd1RrN1ErcEwrdDUrOVVGSm9iSHJ2?=
 =?utf-8?B?QUc3cTFHa09qTVNyL3M5a3RDamVORjUrRi9aVTMvTkVKRHQ4NjhHWVFyU0hS?=
 =?utf-8?B?WXdjcm5qaitYZmFCeVo4REpROW9BMkF1UjRjNWxxU1krRElCNXFucGgxN1gr?=
 =?utf-8?B?c0dlR1JVNzZyZGQxdmpnRlpuaHVtR3psdDVlUTRzRGNFbFRpVStML1AxYWlN?=
 =?utf-8?B?WXhDWFc0dDZlRVVOL1FGaGFwNlZ3Qm9DOHFxWTVJNkFWUThGVFNCanBvSkti?=
 =?utf-8?B?NmJWWFAvMWRhR2dRUFlpT0RNb2hTZUowbE5yZ0QzRnljd1VUc2RESmE3RWhm?=
 =?utf-8?B?MDc4bHBsaDhTNlN1bWRjK1lYTWtCemZUYWhVR0JnY3c2T3VWNGJHbjU5Yysx?=
 =?utf-8?B?aXlvTS8rV21jOE96VzVCV2FlZnhCUVRBTjkrVWc4b25MYlF6OG1QeDUxd0JK?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a6f236-7051-41eb-70ea-08dcc1ae2f8a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 06:55:04.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH867+iXhZEXxhW+9gDLHbbwcrQWULU8GsQuBXhBZPF+Tv5zCnXzbwRZd/aMYXwPwEsC/ShxVsCFZbv0e5qw0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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



On 20-08-2024 16:04, Riana Tauro wrote:
> 
> Hi Badal
> 
> On 8/6/2024 5:29 PM, Nilawar, Badal wrote:
>>
>>
>> On 01-08-2024 18:46, Riana Tauro wrote:
>>>
>>>
>>> On 8/1/2024 3:33 PM, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 01-08-2024 15:23, Riana Tauro wrote:
>>>>> Coarse Powergating is a power saving technique where Render and Media
>>>>> can be power-gated independently irrespective of the rest of the GT.
>>>>>
>>>>> For debug purposes, it is useful to expose the powergating 
>>>>> information.
>>>>>
>>>>> v2: move to debugfs
>>>>>      add details to commit message
>>>>>      add per-slice status for media
>>>>>      define reg bits in descending order (Matt Roper)
>>>>>
>>>>> v3: fix return statement
>>>>>      fix kernel-doc
>>>>>      use loop for media slices
>>>>>      use helper function for status (Michal)
>>>>>
>>>>> v4: add pg prefix
>>>>>      do not wake GT if in C6 (Badal)
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>>>>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 
>>>>> ++++++++++++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>>>>   4 files changed, 114 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index 3b87f95f9ecf..279d862c306a 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -337,6 +337,14 @@
>>>>>   #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>>>>   #define FORCEWAKE_RENDER            XE_REG(0xa278)
>>>>> +
>>>>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0)
>>>>> +#define   MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4)
>>>>> +#define   MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3)
>>>>> +#define   MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2)
>>>>> +#define   RENDER_AWAKE_STATUS            REG_BIT(1)
>>>>> +#define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>>>> +
>>>>>   #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>>>>   #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>>>   #define FORCEWAKE_GSC                XE_REG(0xa618)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>>> index 5e7fd937917a..47e3a1ca2394 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>>> @@ -15,6 +15,7 @@
>>>>>   #include "xe_ggtt.h"
>>>>>   #include "xe_gt.h"
>>>>>   #include "xe_gt_mcr.h"
>>>>> +#include "xe_gt_idle.h"
>>>>>   #include "xe_gt_sriov_pf_debugfs.h"
>>>>>   #include "xe_gt_sriov_vf_debugfs.h"
>>>>>   #include "xe_gt_topology.h"
>>>>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>       return 0;
>>>>>   }
>>>>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>>>> In suspend resume path I am seeing PG disabled and enabled. Will it 
>>>> cause any race while this debugfs entry is being exercised?
>>>
>>> I checked the suspend cases and the enable_pg is called before the 
>>> print. 
>> Ok.
>> But there might be a case where we check the idle_status and see
>>>   C6 but before dumping it might be in C0, reporting wrong status
>> Yes this can happen. The commit message indicates that the intention 
>> is to view the PG status regardless of the GT status. 
> 
> The commit message was only to give a brief of what CPG means.
Ok, My point was CPG make sense only when GT is alive.
>> Therefore, it doesn’t make sense to force wake the GT when it is in C6.
> Agreed. yeah the changes are added in the rev. Wanted to let you know
> the above scenario regarding the race condition.
Ok.
>> However, if you believe we should always wake the GT regardless of its 
>> state to check the PG status feel free to do that change and rephrase 
>> the commit message accordingly.
>>
>> Regards,
>> Badal
>>>
>>>>> +    ret = xe_gt_idle_pg_print(gt, p);
>>>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       xe_pm_runtime_get(gt_to_xe(gt));
>>>>> @@ -277,6 +289,7 @@ static const struct drm_info_list 
>>>>> debugfs_list[] = {
>>>>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = 
>>>>> topology},
>>>>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = 
>>>>> steering},
>>>>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data = 
>>>>> powergate_info},
>>>>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show, 
>>>>> .data = register_save_restore},
>>>>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data = 
>>>>> workarounds},
>>>>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> index 7188542aea43..2ab0eaafa7d7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>>>       return gt_to_xe(gt);
>>>>>   }
>>>>> +static inline const char *str_up_down(bool v)
>>>>> +{
>>>>> +    return v ? "up" : "down";
>>>>> +}
>>>>> +
>>>>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state 
>>>>> state)
>>>>>   {
>>>>>       switch (state) {
>>>>> @@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>>   }
>>>>> +/**
>>>>> + * xe_gt_idle_pg_print - Xe powergating info
>>>>> + * @gt: GT object
>>>>> + * @p: drm_printer.
>>>>> + *
>>>>> + * This function prints the powergating information
>>>>> + *
>>>>> + * Return: 0 on success, negative error code otherwise
>>>>> + */
>>>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>>>> +{
>>>>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>>> +    enum xe_gt_idle_state state;
>>>>> +    u32 pg_enabled, pg_status = 0;
>>>>> +    u32 vcs_mask, vecs_mask;
>>>>> +    int err, n;
>>>>> +    /*
>>>>> +     * Media Slices
>>>>> +     *
>>>>> +     * Slice 0: VCS0, VCS1, VECS0
>>>>> +     * Slice 1: VCS2, VCS3, VECS1
>>>>> +     * Slice 2: VCS4, VCS5, VECS2
>>>>> +     * Slice 3: VCS6, VCS7, VECS3
>>>>> +     */
>>>>> +    static const struct {
>>>>> +        u64 engines;
>>>>> +        u32 status_bit;
>>>>> +    } media_slices[] = {
>>>>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>>>>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>>>>> +
>>>>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>>>>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>>>>> +
>>>>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>>>>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>>>>> +
>>>>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>>>>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>>>>> +    };
>>>>> +
>>>>> +    if (xe->info.platform == XE_PVC) {
>>>>> +        drm_printf(p, "Power Gating not supported\n");
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    state = gtidle->idle_status(gtidle_to_pc(gtidle));
>>>>> +    pg_enabled = gtidle->powergate_enable;
>>>>> +
>>>>> +    /* Do not wake the GT to read powergating status */
>>>>> +    if (state != GT_IDLE_C6) {
>>>> How about if (pg_enabled && state != GT_IDLE_C6) ?
>>> Always enabled so would be unnecessary check
>> If gt_resume fails the PG will not be reenabled.
> 
> If gt resume fails, the device will be in a bad state.
Ok. Not exactly. One posibility could be uc specific things failed but 
MMIO accesses are still working. But anyway you are reading fresh value 
of pg enable below.
>>>>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> +        if (err)
>> I still think we should do force_wake_put here.
>> Check the discussion here. 
>> https://patchwork.freedesktop.org/patch/596760/?series=134121&rev=4
> This patch was not merged with the suggested changes.
> https://patchwork.freedesktop.org/patch/596933/?series=134437&rev=1 
> still seems to be under discussion.
> 
> Will fix this once the approach is decided in another patch.
Make sense.
>>>>> +            return err;
>>>>> +
>>>>> +        pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>>>> Is this needed?
>>> can remove this
> Isn't it better to read this, the previous value would be saved
> before the write.
Ok.

Regards,
Badal
> 
> Thanks
> Riana Tauro
>> Ok
>>
>> Regards,
>> Badal
>>>
>>> Thanks,
>>> Riana
>>>>
>>>> Regards,
>>>> Badal
>>>>> +        pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>>>>> +
>>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>> +    }
>>>>> +
>>>>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>>>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>>>>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>>>>> +
>>>>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>>>>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>>>>> +    }
>>>>> +
>>>>> +    vcs_mask = xe_hw_engine_mask_per_class(gt, 
>>>>> XE_ENGINE_CLASS_VIDEO_DECODE);
>>>>> +    vecs_mask = xe_hw_engine_mask_per_class(gt, 
>>>>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>>>> +
>>>>> +    /* Print media CPG status only if media is present */
>>>>> +    if (vcs_mask || vecs_mask) {
>>>>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>>>>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>>>>> +
>>>>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>>>>> +            if (gt->info.engine_mask & media_slices[n].engines)
>>>>> +                drm_printf(p, "Media Slice%d Power Gate Status: 
>>>>> %s\n", n,
>>>>> +                       str_up_down(pg_status & 
>>>>> media_slices[n].status_bit));
>>>>> +    }
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static ssize_t name_show(struct device *dev,
>>>>>                struct device_attribute *attr, char *buff)
>>>>>   {
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>>>>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>>> index 554447b5d46d..4455a6501cb0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>>> @@ -8,6 +8,7 @@
>>>>>   #include "xe_gt_idle_types.h"
>>>>> +struct drm_printer;
>>>>>   struct xe_gt;
>>>>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>>>>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>>>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>>>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>>>>   #endif /* _XE_GT_IDLE_H_ */
