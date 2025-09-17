Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9905CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5656610E582;
	Wed, 17 Sep 2025 19:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKyjgIbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284710E582
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758137947; x=1789673947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FiczMQrZq8kayUIRHGsF0l+SS1JtkXs9LqS1woMc7jM=;
 b=XKyjgIbGIMDTwsGwkM+kfTNT2TvRZ/AksdiVN0Dg7aeg83wyIhBlfXxf
 fhqFmzJiXzMoOEjID4RD75LSvDT65gXc/lsGZhgepN+WHBctvGfz7kohe
 PxYZM5rjarYJA6Wrfo0WEimey+ltKNVichP94EWcT0KYsvAsUP345vq3L
 R/Msj2RwKzSERdnE5SMNhMjw7SzTLQ9m39a9iodFZfOGOg2q4xZdIoEGT
 9KCXqRA4qfo4qoFR12s6huu6vohUKjfD2Ejb7btYGFheoXVrmHQALb8aJ
 DMdDz12raWXPRCb0KGhtOsyGg/x5253CFnfYArc3FlwNZOX/TLsyFyxoy w==;
X-CSE-ConnectionGUID: Lc/lxBJPT+igXjo7QaRktQ==
X-CSE-MsgGUID: g3CQL7CJTz2VcMWRaAZ6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71561467"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71561467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:38:20 -0700
X-CSE-ConnectionGUID: NhBCJzmySWGCRP2u7OWUZw==
X-CSE-MsgGUID: DkHBkG15QaGfDLqBWuT/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175410241"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:38:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:38:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:38:19 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRJGyJgl2PSgxqxoq98TvlFHlDmxuNXF9MLfEUk8cE1s4L8gmrCF28df+Q78//7qCYzHnk05Y2Xs34xoCdV1a47iWvfUUMse4aP3MOBwwHfDVk353jBT5P7U+qGibvv1J6sB/e86LpCAWAA9CTYwkFoIcUyt/57XIzAt0TDzpDEH3WLeuld9Hzx2r/l4XFdSZuwCelX52Ka7L3qbQY9DMd4M45VM89I2aH1AcRKs+oi1EcS7ee4Vd6v5vBHbvRYerZeM8n7pwroaWVwmFP/zz+r3AM/nlZP9EkPD2qQcC8VagrEAsIBCDHhHWmVAKayyawJ25f4l1MB0cun/ZffUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa7Ofo0/GjM1Nog+jF8TIboPYVzBsr0OimjvAppY4Pg=;
 b=iVRoJ3roeoiOhcvUKGKNWBmCekWloSOAc5zA5aiGNfnvsLdQfy4CH2Cp1uUV+lJQjyuJ4Vg953J5/0PivgWHGJfdnRb6Qgn1i+HSTh/HP1md74t7X5jTgVLuaaAZ8+LA2irU4lFrNkggvarfrsSSiT+us3QJogQjap9ub6/hKXyFKdD6SdcaF7959OsGovjucQdv4UngoX3lP1O4ZM6R/475VETyUdHob/zB+ipDpzJBLx73+U+iqZsfqwBz//XWDrOYvBP20HoNO2IbLoaTmWuPlOvFpivHA2WWxW9Sj+QfB80ASM5hEVmZwDgznjH63y5uJzCbwhjJKqrNcFeIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 19:38:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:38:17 +0000
Date: Wed, 17 Sep 2025 14:38:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sysfs: Simplify sysfs registration
Message-ID: <wfzmbfx3mnre7lvzquhpxxbcks37orlqpfdeam4awzpa6d5kx6@wwnysmofevfx>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <20250916170029.3313-3-michal.wajdeczko@intel.com>
 <aMpS02yLhBs5igpM@black.igk.intel.com>
 <be9d95e9-e02c-452f-a547-f0d3a1ae050e@intel.com>
 <aMqS_SRH3f6PAdM2@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMqS_SRH3f6PAdM2@black.igk.intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f640d8-cb2f-4767-f53d-08ddf621bfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K3YQYaFW0UY7FvLPiZuB21jh5jMDcZbJqg84sZP16ebfdCv02JrL0VbenJU1?=
 =?us-ascii?Q?YHIGIVJIJ3f6kc0ajHvNQrRFSFd0HA3fvJWaMoS2FvHAVOZCEa/8Q2Mn/CZ8?=
 =?us-ascii?Q?a/rn0zcWdlCAGRzaTeW21+ewtCzxn6L4TCuvc8/de98+Hr1jdYkb3ks7l47V?=
 =?us-ascii?Q?46w1SwAUvT9ad14GCH9aBfFZkM+lVjybvPW7HOs607eEJZ4gqK7fAaLJ8jCl?=
 =?us-ascii?Q?p+oB5hmz30GzwY5VWtd7R7WEbvBh64JY098WVzCfjj3HZPQdHntJ3nDlyzYH?=
 =?us-ascii?Q?DVlhzz28m/QcL3xBGASOLHtMzS4C7RWpHfHhxmYXW0FRTEtKFvGu4wAV8YMA?=
 =?us-ascii?Q?haU+0AMS19XuWdYqk3Dx5jtV0M3DMoODmL9sYhcTVkh77zlMa9Mh7HfavpW/?=
 =?us-ascii?Q?6kBFpcZHVpptrN3KNWUihULx493nGWA+gdESfZrqEE29H1e3HqgjOj3rp5Ub?=
 =?us-ascii?Q?ftEYyjuXOpOtNsFc0gSTThmVOYGQmdiuD63Mg1pI3oRP40wL6tQEo0gOtcSQ?=
 =?us-ascii?Q?hE74UIOZdn5jVlj/agj4vjMYMyFEqRLSibnMJ3txi7FyUQLkdt1v5cP+Mwxi?=
 =?us-ascii?Q?Q4XsfisFC8SoxsfpwLbFeE9/CG4ZSfYKVon+unTPJvZFZ5rLETxugKHk7rSz?=
 =?us-ascii?Q?kGb3q9L4VCKG6hCwiT4V4542TzmnLERmoX+L5PPOuyBlF38ygvGhub/U38cJ?=
 =?us-ascii?Q?a9sxMJAAQ1LdD2FKLNYAl/64Wk1t7jJoSDl377zRn1O8CfYgxzgurGLa5MX7?=
 =?us-ascii?Q?DnzR6KgImOWBSEyEYblwtqcbatBeNkHQB8wcKPW8p1hmlaVTZ6YbJUaoavwU?=
 =?us-ascii?Q?SlLMqNGqxl1l2JY8cgtRWu2zhLdCNr8CROri9R+WdFNxPLapoCadfRyg3v3T?=
 =?us-ascii?Q?uq0n/WvZctXuaKeDQ25IX0C2Dax+noiEVZJ/28JhokQiebID0+h8U3gUHaZe?=
 =?us-ascii?Q?zzXGZ9rnSXLlCJ5HBu6FNf31zppE2QepTZsutyMyLwZXlbdroK3dB3rZtkXe?=
 =?us-ascii?Q?BCSmEyASkb/wgnnH6U1GWy0h1PFtdHYNFyNjge7mSxc9YAKpmgUKJ3dC+13Q?=
 =?us-ascii?Q?uOuO7j+Huyut7dL4QeLfa/21g7o5ocLwNMP3R0DCnChTd/h73HXrbkMxm11R?=
 =?us-ascii?Q?o8/kj+vSwz0BxuEBLt3rdb4RqOPGwax41IL16scQ80wXmtnwIwL9qEqfnzX/?=
 =?us-ascii?Q?Db9ACg0XzaS7vuHO5nvCTiRdcWZdC4nqjncsDsMSZxu1LbHYYImfIkudEb0C?=
 =?us-ascii?Q?cX86TlP3pOPwcLywmdjUGmQX2qpfFP9oYaDxCpXO08IDVKWHCq0VKIU9JXzi?=
 =?us-ascii?Q?DpnlljVh8lkLmYaTZQzqKldgfVw7GCSIf0vZnthwwq3y30ZYvd6U2o3x/G3R?=
 =?us-ascii?Q?OKGC6w3z0hm2R69E/J6C5GTd6f/IKya1XuiY5ylZiODmh6EwnwzIwP41OZU1?=
 =?us-ascii?Q?VSLRQQqnCQO5Bz8d8jt9e+tUTE88cjs+9iWttyGzYHDLEuQkHzxlHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3EkwbzdZHE2I12TLEqEVMXILENS/TAVE8v2z/x6cjfshsaTqXylultCuThCN?=
 =?us-ascii?Q?d5/1JzL6stYtgxMuHsOWhPvFNuZzjdNqykXPhlp0gvpLNoFxlh5WJ4UECPxV?=
 =?us-ascii?Q?RkFw23LOfRR/juXy5kuFVtWkP2CWHMjGZZaBvHwtb/Q/r5OvKI6OtqLn3fmF?=
 =?us-ascii?Q?VRmu3AS1hJZJt36P+hRNqcP1ZpjmKHnaPMbdyN7VA41G0AfjIcx6GQA4A2f0?=
 =?us-ascii?Q?43Pse8Llb9BRO4KumF7bUnV8H1bgcy6FK+0uLVk/UEizhvslievsz/71wggZ?=
 =?us-ascii?Q?KqhV2NPzw2LNWgOeDFK7B9DiDdqNvGzjTLNVsschNQHXm0/NbaS+uDSL5Deb?=
 =?us-ascii?Q?4b+kcmPW6bD/y11Wne6wjfo6dbYP+MovvQRMv2mQtk1PTVH42nkhvqzblCHU?=
 =?us-ascii?Q?8Iqq6UeJr6eslT018Bix1tP2++Bzazqlx/SJJhbtCPk4XWfZty3+YZhpw9aO?=
 =?us-ascii?Q?1auNTlAW9tT201VK/yfiMetvM8gmPsXPUIwhXY0IyrZIsO5zM7JZdwrRCw0t?=
 =?us-ascii?Q?kqWe5GacefznNHKBfVABvGH7YPx9yau9kCEItwDVMeJctkxwwdN92eiP2jT6?=
 =?us-ascii?Q?p/YUv8e65Zhg3xQ6faVS/LfhvtRC58ZlLmnaF1i7tNeDwvUP3TBgu1Tlgaxa?=
 =?us-ascii?Q?IrJGGe7UsejTyaipDr+V8t95Z9BpA8YmFDaNcuDGqd0b3gafA4xAHggvshXj?=
 =?us-ascii?Q?P5gQRpSfu69+k8fGYDXn3skYE4ZeoBDP9aRX6hrV29bY6N5/o+aq76YkWKgG?=
 =?us-ascii?Q?cGR5yE8bis3iW9a1B0Stl6IhQQyxFj//omTtC5oiqq67kmIfv1PfJ5opsfFN?=
 =?us-ascii?Q?afoWcGASJFR8gQnKaCbHZg41RbD6GmHECk7ocO0M7JSNpCQtxmFqpe0/ZSD4?=
 =?us-ascii?Q?59Ah17uGBs+P6erEykQyUJ9sse2AMho/8JrziCHrbT1mjHsz56gXDfd9HKEj?=
 =?us-ascii?Q?QuLmoiTcWIma9HBBnOnpuOsGjadyeUBTi43B0RVEx8yY0klCk60+QOKB+lP1?=
 =?us-ascii?Q?OtMFbIL2kyWJZQZc8TTPXfzXc67WjUBskjgzr+E3S7We8o0bjQcE4RkORSVz?=
 =?us-ascii?Q?lcdafrrmZt+L9NeSuLcBkhVYJxk1RcZ0Pkwk1OQzk6GhvmOp9hAvMlect4pC?=
 =?us-ascii?Q?nbYayIMk0WdozCqJPeG0i17HKH3nU/AwJjg6yJYUmmNXnkbAgSb9mT+1FEsv?=
 =?us-ascii?Q?0Zy/xGjVCySL82SB1NLB8u2rqX/CSL//Qb7QRWFeCstS6UrFH+3DiDB8YjY3?=
 =?us-ascii?Q?3pCX6BILUr7nrvDB2P4nKFQLQLqwUx+kL1YlsKQV8TXCNEZ70FwvEeOG80gj?=
 =?us-ascii?Q?erZEdiNQnZ3QRjvn+sC+4em4E2WdqSBHeXR/FkQvVd6G+OskAhUeq+OvDs/i?=
 =?us-ascii?Q?ky9ar0Bl1+2tfPO0rWEpbPSaOclST9SW/FbGEsIqWtuf27MvwL/ntqSRUqdz?=
 =?us-ascii?Q?eCkc3ijJQQ4nXYXKyv+edfyfwi0cfZbq+WOdh4ob96tQFBSC9LU/tMJHKo3J?=
 =?us-ascii?Q?MxaX6XJxuBHCZIM/GZSVd1yFrhHqwO42JaoiuAnm2rCbuJy4jkqsrAl0cXUX?=
 =?us-ascii?Q?k8TZMAp+m9ilDz4hg4X7astl2YhD0aMR0z60hEIPP+A2mVrx6QvdEPofzTU9?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f640d8-cb2f-4767-f53d-08ddf621bfcf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:38:17.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAJDidIeJd+u/KIYPcZUvb/l4SqQdiOoG9B7IYBTMoGj9WMkciih7nCd55ua8vv3Tl0SaFkskKBY4bv/6n0yr5SeAfKnGaJy4X4a4SmebiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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

On Wed, Sep 17, 2025 at 12:52:45PM +0200, Raag Jadav wrote:
>On Wed, Sep 17, 2025 at 12:24:24PM +0200, Michal Wajdeczko wrote:
>> On 9/17/2025 8:18 AM, Raag Jadav wrote:
>> > On Tue, Sep 16, 2025 at 07:00:29PM +0200, Michal Wajdeczko wrote:
>> > > Instead of manually maintaining each sysfs file define and use
>> > > attribute groups and register them using device managed function.
>> > > Then use is_visible() to filter-out unsupported attributes.
>> > >
>> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > Cc: Raag Jadav <raag.jadav@intel.com>
>> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > > v2: rebased, reordered
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++----------------
>> > >  1 file changed, 41 insertions(+), 63 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > index 896484c8fbcc..c5151c86a98a 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>> > >
>> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>> > >
>> > > +static struct attribute *vram_attrs[] = {
>> > > +	&dev_attr_vram_d3cold_threshold.attr,
>> > > +	NULL
>> > > +};
>> > > +
>> > > +static const struct attribute_group vram_attr_group = {
>> > > +	.attrs = vram_attrs,
>> > > +};
>> > > +
>> > >  static ssize_t
>> > >  lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>> > >  {
>> > > @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>> > >  }
>> > >  static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>> > >
>> > > -static int late_bind_create_files(struct device *dev)
>> > > +static struct attribute *late_bind_attrs[] = {
>> > > +	&dev_attr_lb_fan_control_version.attr,
>> > > +	&dev_attr_lb_voltage_regulator_version.attr,
>> > > +	NULL
>> > > +};
>> > > +
>> > > +static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>> > > +					 struct attribute *attr, int n)
>> > >  {
>> > > +	struct device *dev = kobj_to_dev(kobj);
>> > >  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> > >  	struct xe_tile *root = xe_device_get_root_tile(xe);
>> > >  	u32 cap = 0;
>> > > @@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
>> > >
>> > >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> > >  			    &cap, NULL);
>> > > -	if (ret) {
>> > > -		if (ret == -ENXIO) {
>> > > -			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
>> > > -			ret = 0;
>> > > -		}
>> > > -		goto out;
>> > > -	}
>> > > -
>> > > -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>> > > -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>> > > -		if (ret)
>> > > -			goto out;
>> > > -	}
>> > > -
>> > > -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> > > -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>> > > -out:
>> >
>> > >  	xe_pm_runtime_put(xe);
>> >
>> > The device is already in D0 while probing so runtime PM is probably
>> > not needed here.
>>
>> true, but this is how it was initially coded and I didn't want to change it now
>>
>> we can either drop it completely or replace with
>>
>> 	xe_pm_runtime_get_noresume(xe);
>> 	xe_pm_runtime_put(xe);
>>
>> do you want this to be done as part of this series or it can be done later as follow-up?
>
>Since there's no functional impact, I don't see any harm in dropping
>it as part of refactoring here. But whatever the maintainers think is
>best.

Let's keep those changes separate so we avoid bundling multiple changes
in one patch. One small patch on top to do that doesn't hurt. Please
send it when you can.

thanks
Lucas De Marchi

>
>Raag
