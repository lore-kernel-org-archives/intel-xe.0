Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D1DC55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 09:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28E10E004;
	Mon,  3 Aug 2026 09:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwcOB89j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F0510E004
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785747806; x=1817283806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MXo+nTvjTsLONQdBTTyfVrKLJsekSNxTK9VZXQUihzA=;
 b=NwcOB89j2BsySIZXn+zLPsbS3tiGv7PXA56OUtKWmK8A84QOetOHy4d9
 gzFifiRAn2kiup5A8IAWmce5TXiXQbptONF2enNpUB7c0FQCvBWYLRqKa
 Jaieie+WHwe51F6Fy8A4cQl4Ike7CKejLTLAXhmsLwXnEhskgEUvkAeYo
 GDZA1NDv4P2sHmYPX8FUUqVETVB5THs/o+M6kQMOuI+tjiyUg2zEkr/Xa
 AqmuYuCtOz29YC+7hFQ0JEyeabX1gkby5IKou2ze2T6Yrl0DV15JG08F0
 HidmUGOmKSNfZOYXJhXj/qMxRyB7cdpg7yMlOFKLgInG24n26TsQdvBvt A==;
X-CSE-ConnectionGUID: NnZO3DDtTI+lbbLr+5xbyg==
X-CSE-MsgGUID: c8b6Nl5qRS+HyC2PWvrwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86482306"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86482306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:03:25 -0700
X-CSE-ConnectionGUID: blCOYoIiSRiJbjW5nhBKMQ==
X-CSE-MsgGUID: 0BzO7g9RQrKVY5709Wxj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291096701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:03:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 02:03:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 02:03:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 02:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWZZTpJ4fWHHhzW9rKQ1BhB3BAoK4FYrZkUkWOdWU9rVz59JqSbJ5Pjk2/h89NuNpG/wOv9mZRXZB4ve8IHZfOr29qBo9/DNyyW9bukKM48dScuA0XvOlKd29PsqvOLFTEYhQSW/RaNmoAMfIwxLgwOt3A21VERbbYNvElDBw2WWiOjBoRBv2UUVQab+EMuFZlftmfHYgq71X4WZbvfTKFdvLvwsgQzr2nvp/haSAEWrno/OmAoYQX2EUpmsMlX6R59GYeZ2ebGVDxSomOIUkELoT34Ygdwkry2zf0BZS1NwCE90j1LsjUZelKSU4OX5MCYF8GfZ+xkojXm7LqPTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GDveeh31EQUb+mIR40t8v6rcF/xxUHd3j9ageSraW4=;
 b=H5L0o+VJJiW8Fv0Xvyx6XPmlL7yNdtdANnYmOYqTzaSYI0nc4cSVooKvy6yn6OPvmDj47wMhAAFZaqLpEGn0wSoz8wKHXszPBSSR0DHs81C1IGrntleiIvr0NC36R8DqNCfjqGCed2GqdrSeeBcydr2FX6DYXwh/Zht1mQLjMjpikWYEhcLaNM+wTp7hZhcfL5xotct1be/yE5yODcxQ++n5LoGxvkbpQYFqoeQIqkQ2C2TkABDlrZGqUEoYzdbkZ68Wc6BWJAldkfFGhEvfuI9LERwA6drimTI97wLOdWD0lRtnBQhTRX6+hGMwDVanTXv2Z2NYqji+ZE4zq6bA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:03:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 09:03:15 +0000
Message-ID: <3f8aeb27-ab03-424b-a320-45ad137944dd@intel.com>
Date: Mon, 3 Aug 2026 11:03:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <riana.tauro@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260803080823.1166925-1-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260803080823.1166925-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0103.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: ef40fdd9-b70b-4c2f-ded9-08def13e0db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OiuIOS+ca4cZWNLcFsoQHF7qs9Ph1umsv6A9j2O3kZVgg0t/rzc1Xe8vE4bI/4b5unImqnKlCYfyujgl6K04KhzJN1nIq2bcVlUr+J+WlGmwnJbVXsFjEeBOE1w3TefDtJ3c0Zj+J/Tyt6xZv4Q1EO0ot09GmqeVaUtv04ZUtzUWyH8a6cRAKONQq06fSbKdI1KFKAbRRc1M487FYFI5Eti0TjpjI0nCVLMBv3KP9PCnnA0SdSeS1DFOu018zs0m/Lh+wd/u1gX5bBAuYoBEA244NEFmmIcCIfBQfCxMJC2ow8MPWP2o24z75QL7BBufdwTeuy9X0hH8dUrwna7CQjcwFFYKzFAXaIqNQERIsusoGZ1TPIjgKcSC2UfNsjVfaynRqwV6pUo5/wzDc2+3Fk+lIkbglX9DVq/vLFbJgPDtya8rLsnV0SnUT5aH6rPcWjsO3qpx4bdL52NVjpQWJi+w6gDUiRxt9ObxWz7q8F4+47LYgwUNUceGFc28cLYMdJFY52uT0QS5wFirmBy7NS2l2Ud0ggAWqj4r3/uBsq+Fp6FGoxJngVJMSdYkgmKydIsPMM3kQXH7BxHh/GjxBCRiV5EbE6CISk+i3Kjal3I5LW23uBkAOSJJKF2Tm4FBQ9SJ3YAUaRB1iqnce0rIfQxC11QFJAnZLBuGOwQzsA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Z4aGlsOVBTaGxibU5vbm85eGJtOUpjUzVyRHVnU0tTWnVhU1VlV0lBR3Q4?=
 =?utf-8?B?RjFtaWtLQ2d3ZWpYS0o1Y3NuNWhOTkxFdDhjcmYya2c5ckVvNGtWSjlQSFY0?=
 =?utf-8?B?ZzRvVVA3SDBidTczM1pBUGY3WUpnZW5uMmpWMTNyRnhDWWx3aHV1RGx4TUYx?=
 =?utf-8?B?SnF0eDRXZzZLY1VGTGx6MG5zTjYzbVJ1QXB5QjNDenZKNzViYUx4NlN0NUxD?=
 =?utf-8?B?WVNIaE16YlVtb0V4cjdHMHppbThtUnJkUDBQUU5zV21PNHpHZm5NNmkvc0Vo?=
 =?utf-8?B?Uzl3eThoa0FkOXkxUTlpRzVYU2VNT2JrWmFHcmpqWFB6aGRQY2hYblpIcnE3?=
 =?utf-8?B?NGNINDNjakp1TWJ1S29LVTJIRWl6RXhXMnlHWjlxWWhmYk91N1RxTkpRazNP?=
 =?utf-8?B?MkNPYTltM1NSWkVPWElVWkxiTXVZUU5mVCtVcmVtUUNTTndPc2NLQ3JaYkoy?=
 =?utf-8?B?OXN0V01zelVtSWVIdlNYSlhES3NsR0gwWXpXOGpIZmtGeE5mL0tWUCtDS1JH?=
 =?utf-8?B?L3Yvb3A0RlFscVRISk1SQTRWcDQxZzZ2azNrVG9nbEFscEM3UXR2V1R0OGdU?=
 =?utf-8?B?S3g1MDNlTU1BZEpBTFg4bDNkRDNVcVNjSG92Q0x3TzM5N05EUW9KNjBxcDZs?=
 =?utf-8?B?MGJtcTkvRHZWbU1NaldHK1FmL1M0M2srR2lhcStEMEdzcjZlQjJCczlhbGs1?=
 =?utf-8?B?Rng4cERVUldFa092RXo3Y09oUXkzZnVZVVFxWENRQ2xuN3pzV01sZUthcEs4?=
 =?utf-8?B?dm9UMUZ1eXl1aGppT25iMEFNZXRRL0pqQ3JwWkR0OG9IOVFidlJkSU1rNmZi?=
 =?utf-8?B?bWxhREp5OU4xWkZlOFRkODVSRDJyTnhBUUNwUTNwRVh5UzFBekRDMFhHaEgr?=
 =?utf-8?B?aUo2cUFzNlJ6blUxUGo4VWJabFNSakVVeXBSbnM2ZVppQW8xOTBYbDJ2ZElt?=
 =?utf-8?B?bjZ5NzdDVVI4TTBtS3MrNmpTTnBoRDdxNkZUbzVScTd2L1k1RU9aeE1GaXNQ?=
 =?utf-8?B?S0tmaUUvZlNrRnV4WVN4UzVpaytvMEhGMk9IdDd4M0xML2JRVkltU0ZKQ2VN?=
 =?utf-8?B?WTNxN2tCUDFpcTlaaUxKVEtoc0xBS2ZpYlB2SUxGQ1VDZ0tGVy9CRUcvS08x?=
 =?utf-8?B?T1VpTjNVUi9kUnYvdHJWcm5vN2d1c2RBZEtvSVlZdWFFVGtQOWVHQiswZytj?=
 =?utf-8?B?VStuUVluUDBPcm5rODBTVTdLSCs5S0lSWmpCQmp1bFgvc0c5aW9RNGorZjRw?=
 =?utf-8?B?cS9BVEZPTGhtK21ZVUhzQTNOb3QveWtyeWVlRHBnam9JUW5YV2xQbVJ0eUxx?=
 =?utf-8?B?ZnEzd0JoYk4wblNvMDhqZC9YdUdEMXpzU3RvVjlRZEdYdSs4UXkxWnJzcXQz?=
 =?utf-8?B?S2wwTXFOUUJ3WCtQU253UDZBbzI5OEZmOVgyeUdoT1FEdVNva28xaFJGRS9i?=
 =?utf-8?B?eGRPR1VGRCtZSU9lOUNNMkthYnA3QWR5MEJoa3ZndnNHcy9BRng0TnBib1Aw?=
 =?utf-8?B?dzhTV1A4eXdld2lXdkhmKzZRWGZrSUQrTDBpVTFuNEZ0V1BZZ2RQRjcwQXlS?=
 =?utf-8?B?eCtGWHJUajhsdW8rRWFSdzdycUtvSnhSWUNuR2dlTjRQWWt2RDF1eDIyRFFQ?=
 =?utf-8?B?QU1iLyt3TEdaSkpmc2R0UUdBd3l4bmsrUkdLNEE0NUZiNjBnaVBNUG9rWW02?=
 =?utf-8?B?K3lFZTJYcHpldjd4eU9lRHFTbXZmNlJmbmdlRkkzSEtmSVNhVzZObllXODJB?=
 =?utf-8?B?ZC9vSmxxUXQza2tHVWYzOXlzSVRuK2NHY0dnQ0oybW4wSmhiQXN5VGVsUVM3?=
 =?utf-8?B?ZncwbExwUGhWSDJ6UlB2WVdSejdjbzhubGw5Y3BvQjdFdjF0bzBiN3lNd3pn?=
 =?utf-8?B?WUlCUXhHOGc4VG1uRi83dzBCVC9hQWlpbGxPNE5sSkF1SlRWRmc1QUplSDJ3?=
 =?utf-8?B?d0ViS2pqcFhZUjU5ejNwc2FIUFdpVit6aW02bUhtMlhtNzFWN0c1Ly8zcExV?=
 =?utf-8?B?dHNHcHdtcWxTT0lEbDVjWExkYWtoZjMwMXdLaXpTZVpaWTB2SjV2dWpZMzVG?=
 =?utf-8?B?M1NML3RQWmhjMENWMGJJcG03YkIydm5EaUVTSjQyUldqeWlVTGtrWEFJMUtL?=
 =?utf-8?B?OTRoNlNpZFR1ZjRIaURJbS9MRSt6cFkySGxBTEExb0cvZDh1SlJ4MEVGbUNE?=
 =?utf-8?B?b2pmd1dnRzVZZUs3cUsyVVBzcG5kbVdjS1BhM3pQWEZKMkZqa0lVVE1kdlc1?=
 =?utf-8?B?TGlsQnJLL1JuWHFuWGk1NGV4amVEd0ZQbys4U2RIN3lzZGRVZHI3Wm9zVHFt?=
 =?utf-8?B?VFd1UzR0UUpqR015eHZ6a0JDY2RqaEhodDBvYU5PWGRCSWFiT2YrUWM3Y0Nl?=
 =?utf-8?Q?vniipS60osdztGsY=3D?=
X-Exchange-RoutingPolicyChecked: bJnnkgpLh/b03ngqpIB6HoEJF2UMgRZS3nC2LT0aMI/bo7ZABUhr8ZV5CD7eWnLfa8xh0/f8KgLKnykr03L+Wv5ZHv8SYsApkje0ITI3xFx2Zo7xwcikS6MFTlyIbfH0eYBDltFgQfsIQjUCKLvMNifRz+bBaafJ0DRTyF2bHY3oimfpTSTBBZzl0az5n9lNDFq3k8JKX4tEYbB/XYqngFfQ4vJXGRYDwvGztNoAJ06z5fZtn4cCsWtnhFGbs5gQFUw+MaQiLjNGJ0mQHvB99O+b1BcWE73nWu54oV5xwgJbr5nEZmqoKO+QF7Tz1PQQB0nSHl3A/W/SIRBIYpqOZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef40fdd9-b70b-4c2f-ded9-08def13e0db3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:03:15.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH/YnjYZ2bGqeLYzgGWnLu3DmP3iA61ivGITomixCu15aAJk++qgLniMVI1nySC7cj017sExv7cZY8fxIfwERph9QhNevPUgtHKMnlnJ+U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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



On 8/3/2026 10:08 AM, Raag Jadav wrote:
> has_drm_ras flag is meant to facilitate drm_ras feature. Move it to the
> correct layer where it belogs.

typo: belongs

> 
> Fixes: 63dfab5786ca ("drm/xe/xe_ras: Add drm_ras feature flag")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 3 +++
>  drivers/gpu/drm/xe/xe_ras.c     | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 4afa2ad98300..a23cfb49361b 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -233,6 +233,9 @@ int xe_drm_ras_init(struct xe_device *xe)
>  	struct drm_ras_node *node;
>  	int err;
>  
> +	if (!xe->info.has_drm_ras)
> +		return 0;
> +
>  	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
>  	if (!node)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 28123f08e513..f7af4da8172c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -816,9 +816,6 @@ void xe_ras_init(struct xe_device *xe)
>  {
>  	int ret;
>  
> -	if (!xe->info.has_drm_ras)
> -		return;
> -
>  	xe_drm_ras_init(xe);

btw, shouldn't we handle xe_drm_ras_init() errors here?

hmm, and it looks that xe_ras_init() ignores all errors,
which is kind of against the "all-or-nothing" driver rule

(but this is not as something to fix in this patch)

>  
>  	if (!xe->info.has_sysctrl)

