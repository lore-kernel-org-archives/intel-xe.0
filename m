Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD17CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 13:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0A610E209;
	Fri, 24 Oct 2025 13:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR3vgIBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFE510E209
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761314243; x=1792850243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IkG+4VSylnxsjjSfCkXwOTuZOz7dLrNxagnd7+q6k3U=;
 b=mR3vgIBQhqvoznOjTdVeMi4SYMC4nLE6A8lry0T8Be6SZRjioBYxZMNI
 TYY0Ai5ELQXRF4JZ/VzIjXLfVQjpVZ0cHwsZexl/CuHJijbhnwd8feBQa
 UCVB5v7TPwAARt+3eWlJAll+ekl+Lw4Pgm2pk6D0vJhNejEalQ9YBhHr0
 IrWV0QnUBhAAWN2NyeA07JupqPqACiScun0vhibF8CN68lMkZv0yYCJif
 Zs30H8reCB8x4z7f2riTRNMf6W0VZyeDSHQisF0mpWnf2bGOu9fiD3TCg
 BRKwDrHcymnojVRPlKcsIE6Hr1i01u0x3JWSn9k8M21bjcqsZy3Rc9L9U w==;
X-CSE-ConnectionGUID: 2gC8nZkYS2mkm3us+E41KA==
X-CSE-MsgGUID: uUwwj6HcQgOXmx4HsriJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67360890"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="67360890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:57:23 -0700
X-CSE-ConnectionGUID: VIKpaxvqRyqqYSki0clp9A==
X-CSE-MsgGUID: v+oocuWFTSeEYzi4KVxHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="189680801"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:57:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 06:57:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 06:57:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 06:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aewmnm/Q3maratLecUYMQvFCWW0wRW4lWVzHGs+x1bsz2+H3tJxnYUqtvB/jQJ9Tb77cVutS4Cu1PZNnipuQNqVsSgk/TtAe0UEyuleUQIzc7Sq3DE/THMgApAQWC/tvvjiEDfrOgQlqKPFKYMvNPAnHZ7mfQPbdZU+KQZv3+Rf5svwNZw4waXsgiys86RvwCp7dS6g/+k2Fu14BpIThFFYZ7PJvrhxgwFCZfg1eliYYwL0kvOmAgSz/QC5Qla51bs9XxRv5H/X4DZiHCJQpPSN453iZo4o50CCJwUyGFn1voJ2xy2t3wGl+MPLIh4RRBwV+kMJVqUjYzFPX9ej9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsikCzo/UoB0QgUjCFZxWUWnqm/Fh07evfwQhn9Cros=;
 b=gkb4HQL59MSJr1hXE6OkSq/Ok8Tt4Necpls7YuKc7sUtZL71qmSBt/SgSb2EIHKNhvWrMWK4O7icwn216SlRnIU2iZdfdBbu0w9CfLBqe6Dw72jCxWgI9iFPo8qi7q1jslLz74JvwBAJky38ma1fBvTQBnIfXQaXgceCM3bJKGwN/A/qQ9Uj0UQ75u/HaC8XdkbcbXO8YRCwkcIMvLzAMukJq6ORi6qgJBfFZANu7pKuboQaMXeoKqK7xReNElGW41i3472IZ+FRQOX4MCQPl2nXaLcsSpQZ+bWzDLR1/LXKjRzb1yh4Pm1kU/D/S8l6qxR0UDre33AqRph6SJ34HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:57:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:57:19 +0000
Date: Fri, 24 Oct 2025 09:57:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v8 1/3] drm/xe/migrate: Use AVX instructions to prevent
 partial writes during VF migration CCS batch buffer updates
Message-ID: <aPuFuykBdiwM41Z2@intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
 <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 974493db-b084-407f-a855-08de13053f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+FbWT7K7eRDwBZjft0QVF+yKJJbehsEVkd8S6Utk2ASUVYchu1ie5ILoNI?=
 =?iso-8859-1?Q?cvHekonCql9moW6BSLcU0g1gHtFbSOanbPbCr+dbNV7Jg4MIYj2hTqpTxc?=
 =?iso-8859-1?Q?3br3PWl587+wfJHLoZp2jbaAZBAvdTOA+qsPYB1rustuDDggIjwIiKJUpU?=
 =?iso-8859-1?Q?K7GAt1kvZP/o2Trt8cht8tOrH7Oz06kA4q5PruwIC7WIgLI89ynPMf67dp?=
 =?iso-8859-1?Q?ri3H9GLtKtJzhAUHnNhS1xTcT2e7oSmLgZ77haj2Nh/QjFOS6i/EI5Q5PM?=
 =?iso-8859-1?Q?yHAI7HDx9tKV7u2VYHsJXYfXWcrBFhop6lZfwR7CChEdvdcVWE0UaqUaxW?=
 =?iso-8859-1?Q?uaUnvuV/htM2zCx0S9BRZajBTWR4MrUikOTmR9ydemVH4vuypi7kGd4l+f?=
 =?iso-8859-1?Q?W+nq/z7ONKT6pauBkwW2HjmEHbciMeM0jksVihV9+NGtAmPQV5t7Oe1tMr?=
 =?iso-8859-1?Q?K0Uqfe1waoI4o5eejd8E+QQFGY6ibqc4DgbrhsKv71e34TrfGR/5SkK39H?=
 =?iso-8859-1?Q?4ZSyLDP3EJrOY0Q7aeuq+Nw0Cu4otmYLRukTK9z0Af1FSjCvHtmT7OBZ3T?=
 =?iso-8859-1?Q?gyRLNr2xyCJcDkhejNWqyUhg361N07LwBSrp5zNjQj1+3qRfudNcyjQjRn?=
 =?iso-8859-1?Q?cFeU1v9fFIRiEPYxJvQW/E8deqexC/S5S5TFfUky5l9RyvdLqJWnMZixsR?=
 =?iso-8859-1?Q?mqSd/NSorb9hUGWnhunX6eSqaExdUvCWF9iJ+MSGp6KD0PwoxN0m2GNOr5?=
 =?iso-8859-1?Q?r2dS5/dqPB/pHpXL1IgG6ZY0DECLL+x4H5HhCsSK58QU9RXd5xUddrY+ly?=
 =?iso-8859-1?Q?vi70pCa8+DRb+cEExae1VzTwXivTRuqgwOPrNzK66X02kCq0/4q3Gh9hUR?=
 =?iso-8859-1?Q?4Fi1g/e3MtB7/KUSezhB6Ym27S4tK3VNxNshDns5WQdhp/PagSWTmAdWd0?=
 =?iso-8859-1?Q?7pKEa+3F4DEyHnztB1xzdSZu8nP8SFoiobBsGiFq7uLzRNpvbL8j7t5h8X?=
 =?iso-8859-1?Q?rc0GKXv44VIckWGmMaVGIMGv0dly4jhENsDOYYnel9exTlSa32J4eY86vH?=
 =?iso-8859-1?Q?WqMFj7Ms07rr3ueexrf18HxJRx6gXv/rMteX/vDVLs5F1wW6j/BNv+7f3T?=
 =?iso-8859-1?Q?FFt0uVxtUDJH+XPzU7+rvOSQI/8e+wn38ddI/nRnXpgDQc0zmN1qQl/5qE?=
 =?iso-8859-1?Q?tGFTiLKWSehk8mnqKel4l4VadH08lIuqIV/FiI+Y2XQmVgKVDDB7pODYSr?=
 =?iso-8859-1?Q?4Bzk3Qpp8f8IcZH6JjNqn8/aDkOtKhIrX5vQqdOTvbw6WjKJWXBOXtn9Py?=
 =?iso-8859-1?Q?HWGxLv7sD0KBqtBqGYf+suK1EzpiyqySMcfiS6py+1zkYMRSiRG4EW+EzU?=
 =?iso-8859-1?Q?ReQNDXOafprcKs1fB6N8BzBV8xgjiQTlB9bJgFrvt5m+hD5nBnn/irLV6q?=
 =?iso-8859-1?Q?9OxoGevPAWDr7RmxlGj9TfGhRW9eXZTj7OdcBibg9T5kH3Rd2rGSYPSxJH?=
 =?iso-8859-1?Q?188bBlpZpkhClGaCqCwiBm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SqnKssb8HN9etQL5M/bi5g6WMV0T8EFvEXBtOqQITfyyk9FRoVSOwqExDW?=
 =?iso-8859-1?Q?Nyd2oFSIXz0wXcmNIby0P1anivqTfqKc79iWTaiQG1WtCCnukocbRibziC?=
 =?iso-8859-1?Q?s22lGPyZvlN4oYfrWTB7BV8uoyuVsnbHfJDvcUZ4UMFTNl52R2qqyy4pRe?=
 =?iso-8859-1?Q?v/JFHCJStSjxaDZKeOTvaS6zYrSoum0X2MYCLb7/O7dTKmZzKmmmwjyDNK?=
 =?iso-8859-1?Q?fQfASRlMffqLwuLst8nr/3NxUg/XiPKLrBTBOMXlbDQtnDa5Hqp0yu5Gfp?=
 =?iso-8859-1?Q?MmfXJKlvPxfz2t4F7gstt4+JQVpbHQ2J9n0EPavopLQiCaOcxWv6mySGEz?=
 =?iso-8859-1?Q?eioVr/EtbXAidD20aX1eDGXrYWER5qoB8m3n+yob8+HA0fCmx6TUe44wrz?=
 =?iso-8859-1?Q?+ZZ7HJtGdMJgMUKkMpMw6m6Llr+p4OK7eADmYYF//F9udQT2qZ8DgAowZy?=
 =?iso-8859-1?Q?KZyZGxnIA8YmEMSqHlSwRUvgf3gmGYCk7TVECq6ip7qWF9iuNxVAQmUs3V?=
 =?iso-8859-1?Q?EAO8ewXnzblYrWKmRAmvQ6RQ9zGfEOQ5sp9rJEqLsvvXOIafYLshRL5byA?=
 =?iso-8859-1?Q?Dj2Hbn9w2jB94ItHzMSG/5d4jfJcIoXa+8F9R1ouA+6ZIzTyjLZ/DtS+mq?=
 =?iso-8859-1?Q?WmafxwcEMPoEauD53zbl7pd9q89S3dWgzub9qvIM1nxMEFnpVYZHRMeX71?=
 =?iso-8859-1?Q?dLNcVgLLMQftELVMWWNDJN2tBd8bZwV7d52MzpgqX/9YOvT2GmmVU4ixco?=
 =?iso-8859-1?Q?Ouewo0DNxmdCgqVy00SSKpelqwo2jjx2VkDC4oh14PK/l5a2n6ba+4PHxM?=
 =?iso-8859-1?Q?yoLO0m12cCAb4L4ki4i+Pc+lxs+LsevTrNBZ2Kdn5WxhI8PBUhOKsh8slg?=
 =?iso-8859-1?Q?0ZDfty3b2YKs5ID19d+3PGlVIab2FnmkteJ3+AYFuhBvFju7lS7K7wweDP?=
 =?iso-8859-1?Q?eMPcm0eQ2KHIGaYhHv4BsPaClrg4g7WspsQPWk7nEJOr8C1tmTJwHXjhLp?=
 =?iso-8859-1?Q?dk/Dfmmkg2Sdk46ZLVJm3Et2nwvGJqgLlxPE6dlxWs74ceKD1x/lOxuW80?=
 =?iso-8859-1?Q?5ywv28BdbAFF7tUUWfShY3vbzXkvwauL2UNFjTn0sdehT/AaaKxo8TAvDE?=
 =?iso-8859-1?Q?zBZIaOtEwMyvmXRgxA474oK4Ptib9hAUrpAeOt3/o0qDqRUXsIY1yIo2Dw?=
 =?iso-8859-1?Q?ONqWkN+PJ4WLDzASJiDVXLaushR3grDGCXnwbL2r2wLUKSnMI5X1fzt/y1?=
 =?iso-8859-1?Q?g0Yzlqhr0FuI7ur2RQlayrkdUdKif134cL04fl0+aE8KT6QlLSZPbRRp4A?=
 =?iso-8859-1?Q?+7nd7XCjDLbIarmCFChPGOUv4ifYui3nEp715NX8wN1JY1+UagJuOAY9Mf?=
 =?iso-8859-1?Q?lIsJ1iYaaIZa1w5OKg04IajJUZqSNR1pb9LifLd3aNpyuEn7D0HDViUV6d?=
 =?iso-8859-1?Q?jXuPUXZX68nbIbVzmc4eESnETo115znqlCK+N0wnY53CPsxT1ll1R61a6F?=
 =?iso-8859-1?Q?mPlj17+B6ZB7K0xd7puUCcOyjsZ63Jcg+ADH0t1qQzYPdNdw65boOjcTPc?=
 =?iso-8859-1?Q?tEL0ForoWyUVtnxXacuv0s5/rSPTZ2E1v6MOJLVU4XHvWf2uFIP1rdOHdE?=
 =?iso-8859-1?Q?s1P3wJt46Jq46P7Xtev0sEFYVbhhBAsCpP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 974493db-b084-407f-a855-08de13053f59
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:57:19.4060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFOi3VLxyE4Pk4/aNEqDzOoEZKklj2bYobVUDnZL3KEF/D/K6E3UiHCSHSXmkyhR3oRxyoL5tUFCy6duopTH3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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

On Fri, Oct 24, 2025 at 07:05:24PM +0530, Satyanarayana K V P wrote:

Hi Satya,

First of all, thank you for the updates.

Second, the subject is way to big.

This should be enough and under 75 cols:

drm/xe: Use AVX instructions to prevent partial writes during VF pause

more below:

> VF KMD registers two specialized contexts with the GUC for migration
> operations. Save context contain copy commands and PTEs to transfer CCS
> metadata from GPU pools to system memory and restore context contain copy
> commands and PTEs to transfer CCS metadata from system memory back to CCS
> pools. GUC submits these contexts to HW during VF migration.
> 
> Each context uses a large batch buffer allocated via sub-allocator,
> pre-filled with MI_NOOPs and terminated with MI_BATCH_BUFFER_END. During
> BO lifecycle management, segments are dynamically allocated from this
> buffer and populated with PTEs and copy commands for active BOs, then reset
> to MI_NOOPs when BOs are destroyed.
> 
> The CCS copy operation requires a 5-dword command sequence to be written
> to the batch buffer. During VF migration save/restore operations, if the
> vCPU gets preempted or halted while this command sequence is being
> programmed, partial writes can occur. These partial writes create
> incomplete GPU instructions in the batch buffer, which trigger page faults
> when the GUC submits the batch buffer to hardware for CCS metadata
> operations.

Perhaps we could summarize the thing here and move details to the comment
near the assembly. The important part in the commit message is to have
the 'why'. Some of the details of the commands like MI_NOOP fill and all
could be in the comment near the ASM.

> 
> Standard memory operations like memcpy() are preemptible, meaning the CPU
> scheduler can interrupt execution midway through writing the command
> sequence, leaving the batch buffer in an inconsistent state with partially
> written GPU instructions.
> 
> Replace standard memory operations with x86 AVX instructions that provide
> atomic, non-preemptible writes as AVX instructions cannot be preempted
> during execution, ensuring complete command sequences are written
> atomically to the batch buffer.
> 
> Expand EMIT_COPY_CCS_DW from 5 dwords to 8 dwords to align with 256-bit
> VMOVDQU operations. Update emit_flush_invalidate() to use VMOVDQU
> operating with 128-bit chunks. By ensuring GPU instruction headers
> (3-dword and 5-dword sequences) are written atomically, we prevent partial
> updates that could compromise migration stability.
> 
> This approach guarantees that batch buffer updates are completed entirely
> or not at all, eliminating the page fault scenarios during VF migration
> operations regardless of vCPU scheduling behavior.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> ---
> V7 -> V8:
> - Updated commit title and message.
> 
> V6 -> V7:
> - Added description explaining why to use assembly instructions for
> atomicity.
> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> - Include <asm/cpufeature.h> though checkpatch complains. With
> <linux/cpufeature.h> KUnit is throwing errors.
> 
> V5 -> V6:
> - Fixed review comments (Rodrigo)
> 
> V4 -> V5:
> - Fixed review comments. (Matt B)
> 
> V3 -> V4:
> - Fixed review comments. (Wajdeczko)
> - Fix issues reported by patchworks.
> 
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 114 ++++++++++++++++++++++++++------
>  1 file changed, 93 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 921c9c1ea41f..005dc26a0393 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
> +#include <asm/cpufeature.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -33,6 +35,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -657,18 +660,70 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * VF KMD registers two special LRCs with the GuC to handle save/restore
> + * operations for CCS metadata on IGPU. GUC executes these LRCAs during
> + * VF state/restore operations.
> + *
> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> + * VF state save/restore operations. Since these operations can occur
> + * asynchronously at any time, we must ensure GPU instructions in the batch
> + * buffer are written atomically to prevent corruption from incomplete writes.
> + *
> + * To guarantee atomic instruction writes, we use x86 SIMD instructions

Here you still mention 'atomic' since we already know this is not 'atomic'.

Let a summarized explanation in the commit message and put more here.

I'm sorry for being picky here, but I want to ensure that the information
around this code is clear so we don't keep having to explain this over
and over in the future.

> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> + * sections. This prevents vCPU preemption during instruction generation,
> + * ensuring complete GPU commands are written to the batch buffer.
> + */
> +
> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> +{
> +	xe_assert(xe, !IS_DGFX(xe));
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +#ifdef CONFIG_X86
> +	kernel_fpu_begin();
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +	kernel_fpu_end();
> +#endif
> +}
> +
> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> +{
> +	u32 instr_size = size * BITS_PER_BYTE;
> +
> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> +
> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> +	} else {
> +		memcpy(dst, src, size);
> +	}
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -686,15 +741,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>  
> +	/*
> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> +	 * save/restore while this sequence is being issued, partial writes may trigger
> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> +	 * write the sequence atomically.
> +	 */
> +	emit_atomic(gt, cs, dw, sizeof(dw));
> +	cs += EMIT_COPY_CCS_DW;
>  	bb->len = cs - bb->cs;
>  }
>  
> @@ -1061,18 +1124,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * emit_atomic() to write the sequence atomically.
> + */
> +#define EMIT_FLUSH_INVALIDATE_DW 4
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>  {
>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> +
> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	dw[j++] = lower_32_bits(addr);
> +	dw[j++] = upper_32_bits(addr);
> +	dw[j++] = MI_NOOP;
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(addr);
> -	dw[i++] = upper_32_bits(addr);
> -	dw[i++] = MI_NOOP;
> -	dw[i++] = MI_NOOP;
> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>  
> -	return i;
> +	return i + j;
>  }
>  
>  /**
> @@ -1117,7 +1189,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	/* Calculate Batch buffer size */
>  	batch_size = 0;
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
>  
> @@ -1158,7 +1230,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	 * sizes here again before copy command is emitted.
>  	 */
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u32 flush_flags = 0;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> @@ -1181,11 +1253,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0
> 
