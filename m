Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384D1C02193
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 01:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D624910E023;
	Wed,  5 Feb 2025 01:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyPDAh40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF489BAE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 01:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738717673; x=1770253673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v+IfLxlklBXw4n1ni3tptXy/c1UHQ+trx7uKBQX4EU4=;
 b=WyPDAh40RCDTilm68WINtvn0K6mNcDWCIh+cBYURvnOQnpY0UHUm9eOj
 i1/Rx3m7gi4lpD4NGY+dRUC6XbvA1U9Eyeor3ZwES4K6vrvLIUdTpYLXq
 dhc/iTi0TZwIrdN0YTjZEJSseNpq07hq6yzi559TUxj0XFkFXJxr3Hb4z
 UiCOspu+5yMB0cuoLwoUiBFwZDlfykF8mc78qd3HGO36Mu6/n1SQOMVp5
 yeg1ZvGDLsZStFhIhk3T/QrD7BPle0HsUGHIB6gyOa4NcJDZ+/S707B0e
 +RlbHXeu/J/pjEmQoWapdDu1RhPVngCsjePwkl7Et3g8lLBWZAE9WB0Yu A==;
X-CSE-ConnectionGUID: b0ENHvfJSZaWNGPPvwItvw==
X-CSE-MsgGUID: PXeeEUnDSXKPf7Ud7xbJ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49921567"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="49921567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 17:07:52 -0800
X-CSE-ConnectionGUID: m+/AoWiDRdiZClWMWatw1g==
X-CSE-MsgGUID: S1YdzbxfSi+Ao9SPkeE7qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111632067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 17:07:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 17:07:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 17:07:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 17:07:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2uwMUnM/9YINBo9KOlX2IVdrdShYD84MoSlxGhwcdmMbUyg0fVb8gNyIgzLArlYZF1tL9lW4EzjmDznqYVfeBaQuSgEMFD2ZJUjqGd6vrLEV6RisHbEDTkzY71J873WorVfCJSu2Ky/mjl7yJ/dYSsWNVe7skg+DK7pDY87QtA+ikDUsJGC2EYPfw2GfhrghNtS4YI9Su9RMjdzI9F7haZ7BujCGjsqkZzAwGZhHyKE0KvsAkQjX90rTzzm/suuxFm2+CS2IKF6b7CBQTAGThkHuzxIasJRTyuDgzg8HGE/L5XYVSzmEF7D45MpNtsyqhdpLXgEJBeiF7m9mL/MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9TSZGj7sdQmSaSe5uBkh3d1720UAR4zVnxqGlXm0d0=;
 b=K2RQsjYyMDKGHMl4OUv01HlsCZdVLCtFsKcEgeqwLffO1xUGSRfZ6dHdTabJdQg2u754bhngd2Y8sFRV/TpJfv9T2xi11M9EAI/CAz8ouTEgyp08LH6L3Gh5D/3Brc3hyEmH7KnzPdVlDbpFPx/pN2Q9dh1q/LX44kofnXMnJo2GsXbIKoTfeu9aD4xavfv3HGdsSr59w7AO7dwEJbcqtjh/tci2DrUTQ/yrkqKL9XeEn9Un8nFt7qSAMYOa18dUyoiTCWWhThyLnSkECBBZMTTNDq6jnMYaLu4i1/nHIkAW8IwbjVv47VoKsAPrwrU4/V8jRpDHsNsIgKUU7tR5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 01:07:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 01:07:35 +0000
Date: Tue, 4 Feb 2025 19:07:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/pmu: Add event tracking
Message-ID: <6eklz7qtraoy7tjiqo5ds5lbj47snnqfqt2fssuue2xq3qfjbb@6iamlumoifm3>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
 <20250204180905.1347210-2-vinay.belgaumkar@intel.com>
 <tbg7365xok7b6px5rnvvnkuklln7zhbzr7ahmkmdpdpw54yoko@i7fsjxiefpul>
 <8039a334-62b1-467c-bf6a-824cbae578b8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8039a334-62b1-467c-bf6a-824cbae578b8@intel.com>
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cc7829-8b64-4ebf-9078-08dd458179c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TO6LRPhOO7jvCKd8jZlgd3lagQdY1eZthCD96bamYO3rRjfJPihEi6pvnO?=
 =?iso-8859-1?Q?670TnnqIqdqx/z2Xt1WATEOwzDL7npxDn+ewSa+C3OCD/eZametMTDMat9?=
 =?iso-8859-1?Q?7MQRecRIVs0zwBmBmsRmWrwN2CP1FryRqrq++FnPTF462sYtADq9VxHjsW?=
 =?iso-8859-1?Q?YEtpKClVwDGpWIwbTzxRKB0laCBjTuC57+IhmedZDPamX1gbFZzmEfnAlD?=
 =?iso-8859-1?Q?bznCANaD+kT7a0tvKEq9sj2JfyQvP6FmfuMCZ39ayHvd9y3r+J8oVrr8s6?=
 =?iso-8859-1?Q?AjAQS5Ny/sdq/NNqPlWrD3DAvWqM44qIqMbZPXq9C9vySCw9/vahcHAGlj?=
 =?iso-8859-1?Q?eWwS36eCAsTD/Vx+d63V8IRpYM150Xvc8raDmPt/Oz9DX9wEAiwD+MUNf+?=
 =?iso-8859-1?Q?NwEfReA98EI7umQyoYHzv4ZfyABlhbmMSBwixrZc7WvAEJOwgdmPvQ1oCx?=
 =?iso-8859-1?Q?jmXgsbBcgFrYkDDhpMgSgpsqJpolQfa9BIcdBeP9jLRAugPdkyNR0Cz8Jn?=
 =?iso-8859-1?Q?xfP4WiAY61GhJCizOmqFmQxkdASBWXl/1L9og4+I/PL6qw8lbsmVoMQDeR?=
 =?iso-8859-1?Q?RMBvKkS48uks+lRW5YYdbO4iTxpApHBTcla462SN7yAqfBO97IZe51PgVd?=
 =?iso-8859-1?Q?xpp7pmnbn+fPbjZzyWDD1jzHNc2bBEZnTJXnsRpgpJ0LYmrXUM2nx8LuaS?=
 =?iso-8859-1?Q?WEzLbbCboiKM3FXI5WQOXPrsIYUZjRMqsgniaKU1Pu0nO6rQCl1r36WAtZ?=
 =?iso-8859-1?Q?XNAwjr/WnQ5jf6HremnhjMz62ZTC2iGl+08+hjPTmRRAxzj4jYjgiqAGi+?=
 =?iso-8859-1?Q?Y/nZA2foht6rZX57RgTUPLsUaVUrJAHU+uZwa+q11Kjm5pqvKF75Bjnfx9?=
 =?iso-8859-1?Q?P0fOWHkZB0HOe1Xa3WZs7oYJuupekmhbip+B/JfHxZZyn586zgXLnZnjqc?=
 =?iso-8859-1?Q?Twuw3o9IdTYeVBdf2sRWDVE28jhbtb3s1hcabUnCRlUqm7GOP0h8C+6iWq?=
 =?iso-8859-1?Q?F9w6lY1KGbKXem4cG0TWMeBtdld+FP95sfP49uMTGGvrizCAdc4P3tV3op?=
 =?iso-8859-1?Q?iX4/HcJCOnNRhWQxN7UQCATIH4YtrLhPxpKhVESpVPO+6Niqbz9XlHAlj2?=
 =?iso-8859-1?Q?dvOHlokqr4OotYMQtXIBT94tmnCacZt3lXhHyTpAOm+8bdZfkNALhuopV+?=
 =?iso-8859-1?Q?pycpzZ2M3zKRqW9orpKrjDkHwVa2nVZzxkuuW2je85rNoCa/DJXXHJ9b1c?=
 =?iso-8859-1?Q?H014khiJdpk2MmiA6AUf+EcPnXEJ+aVHhZNl6T4Tq2dJSWY6By+BraumIy?=
 =?iso-8859-1?Q?ViN/HgCFE2xAnxo14SjwoIvsBCiW4p6pr01rrpg4lT/SNr11VFFJIkciy8?=
 =?iso-8859-1?Q?ITyNK/ODl70fqv9slugyLYYmM4wvuVJ5EgRKerGyOVfhRTQSP74DsxLAa6?=
 =?iso-8859-1?Q?STvbMeobBeFw2n1O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2jFATFVTObTkfTkMvK/l+NnOhTOziiq0KnXjMfjBjCdwjVTbbDVqYHaKTq?=
 =?iso-8859-1?Q?um4oZj2sDvHsakrPhNvVAh8ii4aaqtDOYj54qSRYu12mI9knoSFOT/Mu8v?=
 =?iso-8859-1?Q?O/rIe6aKlLpUN9mvGw9lqvfImm8j6Le6LbOCylWkmVig45JxsXwXjIJsBv?=
 =?iso-8859-1?Q?KirEvLPE0jEbrvek8jJlM1PU4ehjgdIWQY9dGgsMKpxUF3DmcCyKNzhELl?=
 =?iso-8859-1?Q?omDpghMJ0jvMirb7ebaMABjcTDQuRU8CE6yotRzLY9O+pJOz8QTGxLd4rg?=
 =?iso-8859-1?Q?Ub/Kv9N1y3HpOwLM8a3+wB+IG2o/mdZZ57V5HqcYdsX4RJ9/j9guNuMO3b?=
 =?iso-8859-1?Q?9NQ4fX+MYu6omFD9fB/O9378FcO5NMvpns8jUwG5oB1kxb7eR1nZn18a0W?=
 =?iso-8859-1?Q?xm49WjR4Mpms3iQ7Fh3RQbBRZtn4rTHpeXBnacOmD+d3ZuWgHzUgxtxz2X?=
 =?iso-8859-1?Q?AsWuyO27PdNebdG27eK5H2zGslkVfiYuCWA7iQTnnS+2rrwd5aJ6EwIIAn?=
 =?iso-8859-1?Q?FQjLdaY6VAnXYdtUSskvSbbaWOuwaax7V4R+j3cxlhzpCv6fiqErPF1fG2?=
 =?iso-8859-1?Q?33R7CYMOrXGUU9Cv+gm6fAmGxRgnkFhE3Ddq4kwUcmCFTo/oeylgW14E57?=
 =?iso-8859-1?Q?2iSP3m/b6jepFJ6MS1NlUcho/iuH9FNgmGSKfk2+OWxwGnzlYFJfp2XCbI?=
 =?iso-8859-1?Q?Xe3TjFEwBw8f9pEg1pzAss5R4ykw0CVKQ/ILBgAUDSM+jnnakNiQCSc0Xg?=
 =?iso-8859-1?Q?FRF3kjtp6I/oHFtIxQLa+lx6+RrfKHbGwsZY3iy9deyotwPDo7aadxwo/9?=
 =?iso-8859-1?Q?PzofJcOtB4liSDHdQQR3orj5s01z8J5Wv48kA7EKfQkI/MPOZBXuhde1WA?=
 =?iso-8859-1?Q?TQ6yMR9d6NiYLPCtx5DxN4QCOql4SnYys8UbCjVIdTa8uSfIdvS1SibW1d?=
 =?iso-8859-1?Q?gctAu26aSDCoC3m3QJI81mKoLhYR7T+V1WQZ6MqSHt+kDZPmg+K4YRBqjL?=
 =?iso-8859-1?Q?q+2tP6660JC76pijfxoaVMcLfH+x3GfOdQ+RV1jswXARAJJl1/RuOSjafC?=
 =?iso-8859-1?Q?AIVqaC4iKxaC4J0hgEjgaDHu21cvRptnXvSipaQKUwfN/8VVlUb1DCt9JE?=
 =?iso-8859-1?Q?jKrZ7etfvvIKJeL7ydsoHN/m7VGXUsy+NFEMpy0aVODoEV3Rw+9q4YS0Nw?=
 =?iso-8859-1?Q?tAieUzH9pgeB8BXNSVvmakc414H/+goB9zoPqeJRZbV1VY18Tw8G6uHgZs?=
 =?iso-8859-1?Q?uH3YhysaA9EHEoCilsPVzBgb3ddP0jiarMPMIHwUlKwpmmUlfIFceNjF2v?=
 =?iso-8859-1?Q?j5k4f2FAp+2+pxaYJsZy5ogOMxL7ZS4Of3EVcgsH7rAaLA3xOZkrBnKFxk?=
 =?iso-8859-1?Q?BlWpWpxQFoP3l2E1DtXZ62wtlSMdxIPPyzDLuRxQu+46jPGd+1A7q4Wgs/?=
 =?iso-8859-1?Q?F/ADM3IZxSqKmHfbA7lWOBMoLQeuDQncQwqpV+JNswR+6RNkEkR/HWTH21?=
 =?iso-8859-1?Q?zNKtaaifYMvlan/tYLdZaPSAc60aQb1A/seF2MmCyQfPBMYUPc38hnm/iP?=
 =?iso-8859-1?Q?1wisMkx68GBzhLvidDpzt2VD4dzVUy9G+O8bpbRzDfSWzzCiuK12pR7gjw?=
 =?iso-8859-1?Q?XORYqDLzh2TIdqObSzRlIADMb/luk+Zef3eAt7X4ymIqLEW9Fb5Cvwaw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cc7829-8b64-4ebf-9078-08dd458179c1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 01:07:35.4462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2016WGw5roYSUY3SveM24ZtadmUmjn96c+MmEpF8EiwPiaNSWnRIxy1KE0zTFP3u3x6UYy6s8/E2ZD4ckOkjsBrfOJma4XTnbb8bIz0l+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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

On Tue, Feb 04, 2025 at 03:20:08PM -0800, Belgaumkar, Vinay wrote:
>
>On 2/4/2025 2:30 PM, Lucas De Marchi wrote:
>>On Tue, Feb 04, 2025 at 10:09:04AM -0800, Vinay Belgaumkar wrote:
>>>Keep track of which events are enabled and number of instances
>>>as preparation for the PMU frequency events. Also add locks where
>>>we update these structures.
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Cc: Riana Tauro <riana.tauro@intel.com>
>>>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pmu.c       | 44 ++++++++++++++++++++++++++++++-
>>>drivers/gpu/drm/xe/xe_pmu_types.h | 14 ++++++++++
>>>2 files changed, 57 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index 3910a82328ee..10603e7c3eff 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -8,6 +8,7 @@
>>>
>>>#include "xe_device.h"
>>>#include "xe_gt_idle.h"
>>>+#include "xe_macros.h"
>>>#include "xe_pm.h"
>>>#include "xe_pmu.h"
>>>
>>>@@ -38,6 +39,11 @@
>>>#define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>>>#define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>>>
>>>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>>>+{
>>>+    return container_of(event->pmu, struct xe_pmu, base);
>>>+}
>>>+
>>>static unsigned int config_to_event_id(u64 config)
>>>{
>>>    return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>>>@@ -156,6 +162,21 @@ static void xe_pmu_event_read(struct 
>>>perf_event *event)
>>>
>>>static void xe_pmu_enable(struct perf_event *event)
>>>{
>>>+    struct xe_pmu *pmu = event_to_pmu(event);
>>>+    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>+    const unsigned int event_bit = 
>>>config_to_event_id(event->attr.config);
>>>+    unsigned long flags;
>>>+
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+
>>>+    XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>>
>>^ not compatible with raw_spin_lock... if the warn triggers you are
>>likely to bring the machine down. it's also called event_id, not
>>event_bit.
>>Please do not copy and paste from i915. It's not a good reference.
>Not meant to be a copy paste, wanted to add protection to ensure the 

I'm talking about the place warnings are added and the names.

event_bit() for example. It's not even being used as a bit since you
are doing enable_count[event_bit]. In this file it's referred as id,
not bit. Also a field called **enable** that is the OR of e1->config,
e2->config, e3->config is very odd and brought here from i915.

The missing lock on read, the missing lock on add_sample_mult(), that
function name, the conversion from nsec to usec to store the value. This
all come from i915 and I don't want to have the same mistakes in xe. It
will be hard to fix i915 and remove the hack we added in
topic/core-for-CI.

So, looking at i915 to figure out the HW registers and HW interface
should be ok. For perf or userspace interface, I'd like to avoid.

For events currently being sampled, perf core calls those events
"active".

$ git grep -l perf_pmu_register  | xargs git grep active_lis
arch/x86/events/intel/uncore.c: list_for_each_entry(event, &box->active_list, active_entry) {
arch/x86/events/intel/uncore.c: INIT_LIST_HEAD(&box->active_list);
arch/x86/events/intel/uncore.c:         list_add_tail(&event->active_entry, &box->active_list);
arch/x86/events/intel/uncore.c:                 list_add(&box->active_list, &allocated);
arch/x86/events/intel/uncore.c: list_for_each_entry_safe(box, tmp, &allocated, active_list) {
arch/x86/events/intel/uncore.c:         list_del_init(&box->active_list);
arch/x86/events/intel/uncore.c: list_for_each_entry_safe(box, tmp, &allocated, active_list) {
arch/x86/events/intel/uncore.c:         list_del_init(&box->active_list);
arch/x86/events/rapl.c: struct list_head        active_list;
arch/x86/events/rapl.c: list_for_each_entry(event, &rapl_pmu->active_list, active_entry)
arch/x86/events/rapl.c: list_add_tail(&event->active_entry, &rapl_pmu->active_list);
arch/x86/events/rapl.c:         INIT_LIST_HEAD(&rapl_pmu->active_list);
drivers/powercap/intel_rapl_common.c:   list_add_tail(&event->active_entry, &data->active_list);
drivers/powercap/intel_rapl_common.c:   list_for_each_entry(event, &data->active_list, active_entry)
drivers/powercap/intel_rapl_common.c:   INIT_LIST_HEAD(&data->active_list);

When trying to use common approach/names/etc I very much prefer using as
reference the ones in kernel/events/core.c or rapl or others in
arch/x86/events/

>bit index doesn't go out of bounds. The config-0:11 bits should match 
>the array size. Maybe check should be before spin_lock().

for the pmu_enable (that is called on the start() callback) it's not
clear to me the context. If there's already a raw_spin_lock taken, then
we should add this warn elsewhere. Probably the event init, that
validades the event being added.

Lucas De Marchi

>>
>>>+ XE_WARN_ON(pmu->enable_count[event_bit] == ~0);
>Same here, should be before the spin_lock() in case it is not compatible.
>>>
>>>+
>>>+    /* Save the event config */
>>>+    pmu->enable |= event->attr.config;
>>
>>what does "enable" have to do with config?
>We need this info while toggling/using the internal timer for 
>frequency stats (next patch).
>>
>>we can't simply OR any event config since there are more things than the
>>event_id. Suppose userspace did this:
>>
>>proc1:
>>perf_event_open(gt-c6, gt=3)
>>
>>    pmu->enable = 3 << 60 | GT_C6_ID
>>
>>proc2:
>>perf_event_open(freq, gt=1)
>>
>>    pmu->enable =  1 << 60 | FREQ_ID
>>
>>now when you close the fd in proc2, your pmu->enable field will have a
>>gt == 2.
>
>Hmm, true. We need a per GT event bitmask along with the count.
>
>Thanks,
>
>Vinay.
>
>>
>>
>>it's not clear at all why you need to save the config. I will try to
>>figure out from next patch.
>>
>>>+    pmu->enable_count[event_bit]++;
>>>+
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>    /*
>>>     * Store the current counter value so we can report the 
>>>correct delta
>>>     * for all listeners. Even when the event was already enabled 
>>>and has
>>>@@ -176,15 +197,34 @@ static void xe_pmu_event_start(struct 
>>>perf_event *event, int flags)
>>>    event->hw.state = 0;
>>>}
>>>
>>>+static void xe_pmu_disable(struct perf_event *event)
>>>+{
>>>+    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>+    unsigned long flags;
>>>+    unsigned int event_bit = config_to_event_id(event->attr.config);
>>>+
>>>+    XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+
>>>+    if (--pmu->enable_count[event_bit] == 0)
>>>+        pmu->enable &=  ~event->attr.config;
>>>+
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>+}
>>>+
>>>static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>{
>>>    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>
>>>-    if (pmu->registered)
>>>+    if (pmu->registered) {
>>>        if (flags & PERF_EF_UPDATE)
>>>            xe_pmu_event_update(event);
>>>
>>>+        xe_pmu_disable(event);
>>>+    }
>>>+
>>>    event->hw.state = PERF_HES_STOPPED;
>>>}
>>>
>>>@@ -334,6 +374,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>>    if (IS_SRIOV_VF(xe))
>>>        return 0;
>>>
>>>+    raw_spin_lock_init(&pmu->lock);
>>>+
>>>    name = kasprintf(GFP_KERNEL, "xe_%s",
>>>             dev_name(xe->drm.dev));
>>>    if (!name)
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>>b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>index f5ba4d56622c..b15858d4d4a9 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>@@ -10,6 +10,8 @@
>>>#include <linux/spinlock_types.h>
>>>
>>>#define XE_PMU_MAX_GT 2
>>>+/* Event config is defined as 0:11 */
>>>+#define XE_PMU_MAX_EVENT_TYPES 12
>>>
>>>/**
>>> * struct xe_pmu - PMU related data per Xe device
>>>@@ -34,6 +36,18 @@ struct xe_pmu {
>>>     * @supported_events: Bitmap of supported events, indexed by 
>>>event id
>>>     */
>>>    u64 supported_events;
>>>+    /**
>>>+     * @lock: Lock protecting enable mask and sampling
>>>+     */
>>>+    raw_spinlock_t lock;
>>>+    /**
>>>+     * @enable: Store requested PMU event config.
>>>+     */
>>>+    u64 enable;
>>>+    /**
>>>+     * @enable_count: Reference counts for the enabled events.
>>>+     */
>>>+    unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
>>>};
>>>
>>>#endif
>>>-- 
>>>2.38.1
>>>
