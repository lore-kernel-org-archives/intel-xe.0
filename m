Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69314C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 13:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BAD10E7C1;
	Tue, 20 Aug 2024 13:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkZFQ1oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130D410E7C1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724159788; x=1755695788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XniM+fRMkMlWPly5qmTvbtfhVXtvpMQYLY5MYAhIzsE=;
 b=TkZFQ1oiQQluolOyT0vDG25WqKgTj96Xn2FvR03poIUx4ljSbk+fGhWp
 d8B58mz7bgC8bRLib1KAz5QaJPkhEIw/B/4LZgCcbyQR2SU959w5ae5DM
 Gn9VCruy2EG2Fwnpm3vdckDDaMXRyAwQvh4CiplzLv4Kro3RxHsNWsTBD
 Tgpu9AvrozQ1xzWcxoGBf0UoFvH8d1YDJ+j9ZXFXYEg4WHdkVR1nyRw+4
 1tsBrug56TIblzCThq7NIfVJBZhJe2Yq0KYV1VIEffIRCdcYKEaorWwf2
 coUdHJ0WwMoS0MZ/H1JeW0nRW4uTVyTO6m3Zxf2/8UwFm9jD15J8X/Jnt A==;
X-CSE-ConnectionGUID: 5Z/LPHiNTCCMzpqcfYv0uA==
X-CSE-MsgGUID: feCWhGxcQiCbwoUkMeNNDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="44981663"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="44981663"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:16:28 -0700
X-CSE-ConnectionGUID: D17TLOXRT2ywV7wr85chhw==
X-CSE-MsgGUID: n0yfO6BEQsqPcrLyFqbElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60785025"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 06:16:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 06:16:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 06:16:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 06:16:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 06:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIwM7t82e9hz7EapIXfoS4hKNiZ9Nj5LDN9fakGuuZVVbSdMqFtsbQStRzfx6ZltLa1Hb6dV8js+QrgearKHOvNqj/8lBdFp+KtMqvXcqNxtkffziG8kBu9SP2+3qK1hzywABk5TzQUgVyPUfTcE+iR82pbOYoznNWaNXHOBRDDZBgT9wYBy5YE4/kDz3QBz9srRX4jDNMzBVjRBCDmRrdHzLd+wXWlVJm3dV7t3XSMkp+YTBsWhK6zOLF1iiG0mndH5adammeXvBwb9AK1KKGXs7quYRXzCkFiuSkhthdynAk/mtuPDVB/FJcwgs/IsAnB7kS8Vets8Y7iN7+z5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRlK9aQ5knXoI1bAIq2rDhSbVGQxYCIEYXmGA6UYOdk=;
 b=Ss3zKbA5sMjV8yhyUwucVT+Y+idectX+OvzeFjf47pv0TRLBCN7vLtvegui5ULbeyPt+ToLC1J25fjjdMKue9N3g3enLLd456K2rDJNCD6gCGPB+YLW3DcXC04Vyh97G5nUKWCKLKeM96S57P/5b5YUuAq/fyL2FObbzqnemD3zdUiax4oUcnu9m+nUoahLDKXwBIYyUnq0hpiq4bOPEVZQ2mK7FJWPvyxOqUOCWBfIbXQX+SrlsD2qJW4m+sb4CxeMnxYTcMqXebtcwDpZt/ETDLSt1o8j19zFtZB1ZxKTLvV6NJk33Ws1v1ZHOpEzbzqozBGrojaefbhba5B4YXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 13:16:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 13:16:21 +0000
Date: Tue, 20 Aug 2024 08:16:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
Message-ID: <uv43yog24v3ihozlp5hgrmjnyyu3vd7rykjssuv4yskws5nosb@5m3f7cgdkru7>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-2-michal.wajdeczko@intel.com>
 <4simowxl6oki4wr6aefawflhy4giewp3lx2kzaqo7dagjr6ud4@v3svwun32twc>
 <a3651242-898d-48e8-913a-7a273744c0fb@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a3651242-898d-48e8-913a-7a273744c0fb@intel.com>
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: edb56e91-cf91-4ce5-abc3-08dcc11a48f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RAN2KcaMmMDJQEa9Uc2e/SRp55JxvuEUMVCXYEBLdLN0dqgwl0+01glc/4IQ?=
 =?us-ascii?Q?7+ly0kIg/WWI1Q5PH3rF5wqGqWGL2rycRusPZ6nDr5Fbb9u9QRVyCHpadq+U?=
 =?us-ascii?Q?lY5E0zikz0q60NdesXPnzzSjv3mzCiuGXKkuB9MIy+NdnFajUtjYo2G0hjzQ?=
 =?us-ascii?Q?sjXrrbXbCLjIJ3eVo6WSL2pNurvqxlnpJhl14qXPrMFknv8MQVtpsXhA3ZCL?=
 =?us-ascii?Q?N3+rHSistlVRkbcMhypbVgI3gz5wkZmwAbS0xU2D/bMj746y4aAZEbPs59rf?=
 =?us-ascii?Q?4hqOVxrKqZ0qgWQqCEtqG6PWdjTn3aF/MjCjmku2cD7Nf5AmPq8riLKRvaJP?=
 =?us-ascii?Q?fVgQcqei7Rbo9QATbuxx3uMK4vC1yajqRfMgYjhyvu5Z42NUt+YE8iS7JRuv?=
 =?us-ascii?Q?lrKkjlXuoRB+s/eUhZpPbHXMrmAOx25xgHFFvYp7ZryGHhvawFGUIoU3VFGe?=
 =?us-ascii?Q?ytzOq5uQlbKBybU+N/2cButRefnY2rzgDnqQoB6O9m2J6akydsADTXs74mqH?=
 =?us-ascii?Q?IycSNgJNOUiZxUakM8ZkWkOKsNF9RqwA02VRPIKa9lE+/i9aDg2hwJpzQn/q?=
 =?us-ascii?Q?P0EyTrZV3AFO7ksHYnZlZOFZXNf92a3zfox4qi+slyaMsxVCwyXa9cOBIM8X?=
 =?us-ascii?Q?4R9n9xL67HekV82ZwY4BzApJH4oiaHctJABn/TCb+pzPonipvOR2seN+oyNo?=
 =?us-ascii?Q?DlAy+M6kHju51IChO2CyfDuOyHzjLipqIf9AqLqaTGR+MydEZ02Z+0LwCeaD?=
 =?us-ascii?Q?HszYJjfWiryynJoh2W5Ro4iLZxx9OicXxwSnhcrmZblhBfwlITAKcWMDmrLw?=
 =?us-ascii?Q?n71VnBmf0ltBgnJ82BBbA6kb90oUOGcla+B3jrgxEz9lxGJZBVdoEdxAUqrC?=
 =?us-ascii?Q?oDuRBLPdhInxlXPdvlcWEBc2x70sOT/HWYB2krhDXEfxaoVe8z2wcHi/By+w?=
 =?us-ascii?Q?jXz7TGruPX6T8BxO5dnfWtB+YhQuOBBnJ3sgC9K/D+SabfP2QGvrxa4LZVxe?=
 =?us-ascii?Q?dj4xAMybtysUSAoLPvy1HZqx/9wKKy89LQeGafCMwEMupyCkNDlafNtt+gXA?=
 =?us-ascii?Q?S+X8XyIctEokHlru2OETOusyucJIDAjAL6UtlnS1szv9xznvgiWlxAL3OItU?=
 =?us-ascii?Q?BsNeklYOngQofMl8saceEOEw3uolQjb4o6OnC6XggaM7DjHZFHxnkgdZEONf?=
 =?us-ascii?Q?cy2BMJzFz6mM1wUMlzTrZG5+Y/jCU+5Q80++4xau6BZMM2Dt3Ipi+daPUFyv?=
 =?us-ascii?Q?dLSjQQAxI0w1Zt70QFtZUCaymYmzngd3l84yruJly7CqbaO1msfDdTlfHSoc?=
 =?us-ascii?Q?dtYAQcd2SEteBa6kDtrDc3LLGaFcS3TI5P4fllOevoJJag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFn+3DhaQFBNnoulyig8KuD4rWjSzUqXMcNEmIyWCbEVHkPPM/oNCEcgIscZ?=
 =?us-ascii?Q?+bPOBYkcngTZV2Kj3mYAUW5Wx4tHFq0WmnLY9YQiF60fmV4EJvGbBrQA4SZd?=
 =?us-ascii?Q?yOS9Uz20Z4b5uRF/1wt8TGhQRerGpH3gUtZncCkU45Tw8regLdhQavqG7bQt?=
 =?us-ascii?Q?fZBjObR9m3ss2syzzV97ZiC4Q2HeUDWLEmW3TzJeIbESekVQyzRGhzxSTaBS?=
 =?us-ascii?Q?RU8g8/7GVy75eHvcSs5jKE6OYOlp368VNIRoE6uVYRwfYoTMux65TFU3TD/6?=
 =?us-ascii?Q?5rWVTPwrt61/XrRVJoFXo22k9ltjlVyN7X8lE2PGtQdqphH45O/ysnNgeFPQ?=
 =?us-ascii?Q?jWe3abzMdgnmdeqgyu27bEFTWmINvxFfvwdoa0sL8wf5uD89Q6KUly6NLy7A?=
 =?us-ascii?Q?g52etd3NL9PNlGuA53CKFpzbgchxmmoDOeenmGiSiOTERnT7MqhRN+40BM7P?=
 =?us-ascii?Q?LPiMdrGPl7O5OaWR3FcBUoOL+VmePnaLJ4Bx+ufWeEbAzW9p4AN7oeXS3FIi?=
 =?us-ascii?Q?rbP/JGBo7c58C7ZStGjduVfsPvbdjR/WQOKatIoFqB6sl7jjk94xwmZFpqIN?=
 =?us-ascii?Q?by+wNbjWiBXhzwYbgh8YI0mN9VSkjLX2sv2/8DKF1oOWPnFmNbBlLcxHwJE0?=
 =?us-ascii?Q?4Uf8J2431Q4z5jrTIBktJ+5cKt3sINm7NNeLfYQ8JlgVukU6y2xmF9Z5ESsI?=
 =?us-ascii?Q?Y2nytfgO0PhpphduOsoDUXM9Y4Qjb6Eo8r537qGoB9bjkHgqTPY66Y7wTwAU?=
 =?us-ascii?Q?qsaFaKwn8vAMH8Cy7OLGz6oN8fZUC/CNpqYGBND2Z7eyI0yjeWKXypVG75xw?=
 =?us-ascii?Q?V3fe1PB8ogWzboN1n/NIDefwCEDWH2dUQDwSFLHcJHxWUloCwnsDRB4/x0LI?=
 =?us-ascii?Q?H+1QexgiFuFLoeLXnYuB8ZYP43tTLCbopvQk6ot/FXr8V58SJ/BR2JA+ExXV?=
 =?us-ascii?Q?uNZ0h7cgnEhYAHLkQelm8uPebwzfGCrtsOE8v6ms3n6Hec6Pbcd6v6yFOkmc?=
 =?us-ascii?Q?R6VsjLDjErkM42010ov9pqTNeb8iGkKRUvBn8eM8VGs8+HfraE7HQqRKDBiO?=
 =?us-ascii?Q?B7t/I4gDYNeCzePyB2rBGGcTjlKwVSgmJbSVHVZl6V3w0uV4ZoPw3xNHl1WM?=
 =?us-ascii?Q?tXaCuL8FC+xtwkb50atvLUW32R11yk6aWAWjXPq0HUMSlg2Ac0YO/Vd+r5ZP?=
 =?us-ascii?Q?hdgW6yM+XCe93EsT5eQS30W/cciPA9Q+KHNxfJZQ175S4EE4Sv5GMTHnq6C3?=
 =?us-ascii?Q?BgUcndYAg8FcX5XV8F/Fw25CrbhlXk6D6ftVXKa4gxGeGWVuaJg0ajzGD56a?=
 =?us-ascii?Q?3GnTLOCOLscHHPPNRQB6QpeJ6kPIbILghB/uNa5+qF29Qz4lFrqm+EJ7BC0h?=
 =?us-ascii?Q?Q1CKillcmUS0QnHUG2PdCFGLKoERuEIv/fvmg9cnxtjrogIlKzZzRCo/VN6u?=
 =?us-ascii?Q?85qGv0SMQxN0ewceiXUEYzYDw+lT1gICAqYWVNwH7yGJv6gya6VBqk7D+PUz?=
 =?us-ascii?Q?3jXHnAisZVxyvECcu/w8nPhYrDOg7aYN2Qj43ZGwTHRJbO/R3zwt1lt18n5X?=
 =?us-ascii?Q?ZsGlz5aoqwXJyqGMQhFbwFXe8pu35QDCW8QuaJK1llsplRjvPt4P6RZ38Kcl?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edb56e91-cf91-4ce5-abc3-08dcc11a48f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 13:16:21.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0How2OMJWJ97syd0vtDhEY4Xj2uIR+oixJPZ/mGylIl+L0EK/b9x3ZKU89Bvv3dXDQswPK+ei/EeYT1oVH+FX/P/BZGVy3FsUd13Q6LcOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

On Tue, Aug 20, 2024 at 11:38:35AM GMT, Michal Wajdeczko wrote:
>
>
>On 19.08.2024 22:47, Lucas De Marchi wrote:
>> On Fri, Aug 09, 2024 at 06:51:48PM GMT, Michal Wajdeczko wrote:
>>> +static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo,
>>> long timeout)
>>
>> it took a while to make xe use "vram"... now we are back with lmem in
>> several places :(
>>
>
>it's because GuC ABI is using LMEM terminology
>
>if you really want then I can try to rename implementation side to use
>'vram' instead, but question is what to do with debugfs entries that
>reflects GuC ABI almost 1:1, should it also be named with vram ?
>
>gt0/pf/lmem_spare	-> gt0/pf/vram_spare
>gt0/vf1/lmem_quota	-> gt0/vf1/vram_quota

+Rodrigo, +Thomas

Lucas De Marchi
