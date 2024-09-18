Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EB3CDD556
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 21:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2500A10E641;
	Wed, 18 Sep 2024 21:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVRux8IB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0572210E641
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726694929; x=1758230929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BkC+epHWey3lOhOAq/9T/xIU+N0nU9Z6RrIaZPGn4gY=;
 b=JVRux8IBN+RmFaJGepahL4jK0cjrGc5BzR6fVO46jABlXimXh7wmjkTI
 Lgc6UfaPpEMD0Ky+e7TYmufXVQl8/RqjQZvgBf6a4z+wm8mpwKqZmvR07
 5EqgpNwAgB84mtwXclI7zO4kqbTsdiwMcSvjIkJ9OVe9uIEN/199BZsAM
 t9sgKVnZDy3RiUNYmYWHA2dUP/yNVxitQzq1hWtrrZ7Q+JipPpItS/7tE
 KXVgs81KJPgiT06oS4JTO6qDhf1NYC0qsCf+eCv0u8d0QsM/gDhru+Mgo
 Zk4ZJ8xV7CeCLeIxth9m97lGIRNjvOJ+l6h9Sb+4pF0ha5PE/ltq9Pys0 g==;
X-CSE-ConnectionGUID: 5SmlH6cUSmKy5uk2R4uu/w==
X-CSE-MsgGUID: b8Y2cb1OS3a6m5/xU0IWXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29373242"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29373242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 14:28:49 -0700
X-CSE-ConnectionGUID: 2Y+E+7I9SK+5V79iDbG4yA==
X-CSE-MsgGUID: ijSAiTXsQ8iF7JPyfn2u9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="70009897"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 14:28:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:28:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:28:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 14:28:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 14:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vor1buR8tgxPWz1m7NsB511UTlxNwVj3b7jvaY56u6Oj5Cn0FN4lK4uZMyz2Qa6f3w+3Wq/fHM4j3SpktuG8mpenJI60ZxmJ38ZnPON1OBQpEwETZ0UIp7eIYdPvM2jGjUUIoIHOSHRDUPPooMx9cT9oqlhaIjxBLlvdlDDeFg4En4N13qRiK8TwFe+P90rBsfQbqijg9K4i9bsywlH3gjH4iBgtnJCxDK8j1LnN+kU5pOVuyuOrx55szVg02iuRrTZvVQkLhyQN76GLNZwz5mnyhMmBkCp5MdmAhL25xj+M85KFIeJHj3PMzwGX+HRyukNUJ+43BVJ/5o3z0SSd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6Uc8LeAmtXVbW/m1Sb/wPIIKPGDibZrG2HD/5giphU=;
 b=u1ao8ffW9Hv0KDG91XbiLF2m8ooyQnVQsbdNHm0oXaaOWmAVrsSgkaVuiwypVywnCdTW2etlrhvemvf5Qi2gYk4FoS70P2ZVZcCHN7DMJurV3ggbsxbrV9N+4Gfav6RWiQHFov+3qLRHZ1ckWLtWoPxXgLQNIYIBSmlXH4CvPZzytr1UaOeAgKpf9ulA8R69mFC0Di1cHSU/hjWpV9i/dmSMnjDwDSPUMxe4bJ3fLE+kGBUiLEIAW6nSrB876P6FB5z2N+tgXGMvCUFND9ld10fGUOpbs6zVonrcdDyiP6LzW27rU6BXIhTqkL9qkljU5buxgYIZDQn6J9lnAkfkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 21:28:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 21:28:45 +0000
Date: Wed, 18 Sep 2024 16:28:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <h5iedsjhislof4z5apykjht3n44h3hcgbprn6a6ro3qjixt2al@ufjhic5ws7gs>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <Zuh0aTvBXYrKrRzO@intel.com>
 <20240916203912.GO5091@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240916203912.GO5091@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 4173e70b-68bf-4a24-97c8-08dcd828e076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lrTzgLhJ+vpu8eLHmtsxb/s8fbnFLTU/cQXIi762SqeIOTST+YWAHM8RwsUH?=
 =?us-ascii?Q?y5oisUfksWwjG18I6vMda97aMo9bRuE/8XmT9dc0YJ2DIoO9b/cLBqcvHmAd?=
 =?us-ascii?Q?mviEn1sOwCZ6Q4bBMkcicpGH/0WVCxgm5+g100Z7iS1joN7e/G0w65gnG/fl?=
 =?us-ascii?Q?YbSnmESJdzb1t7EusXthSahGyWgkWtLGs9K0vMXILI4JhQhDMr84/g//DM97?=
 =?us-ascii?Q?SnRff0tmHXZgkxi2ar/lFw/pjZBpZ9h7bRelnNJyLWLeUfqBd2/hwWx9daje?=
 =?us-ascii?Q?qaMkurEfdawKh5BXOsQTbQiuv77EAd97KBQdD5eLGqOZtq9MXVO4506k0KmX?=
 =?us-ascii?Q?rCThSJMCo4siaSeVAdMAoTBgf3cnM1C/+pGUFIT1LaOW7CXXV3sMBm5f9H3/?=
 =?us-ascii?Q?eWNdVOxrFw6eTzWggz5ZsNosXuSMQN3lYGYFzBzUpNauz3BM9ujVJ60o/t3Z?=
 =?us-ascii?Q?YWKsfYfzkxf3m0ZCIVV/PJpkpQr6voNZhMEXcWqB5p0R3AVqne0ncOjrNdj2?=
 =?us-ascii?Q?PqZbrO+WHOb+m6IeIPsllhdKjSDxz6yJNyUMkdRlXnHpcJwoq1wsnzbU4REl?=
 =?us-ascii?Q?BuChqN47fTsXdzL6d8A1o1eZYcu+Ih8fr0do4BWqUZM6HQixrqH1fKulcD8I?=
 =?us-ascii?Q?d/DMxoim+Eu3z4ZvYDTHu+J6WylUYMBiyuX+130QSt/Tt8fSg2X3nSHU4Mnm?=
 =?us-ascii?Q?3WcvIBbCThEf8Y4TKHhsW/NclMvCzjGYAU4mqlw1qlPwDowHMlugO/KZYiQp?=
 =?us-ascii?Q?v/hfagOlpbZlAf4K7NrwNNxuE/E+xrxZ9oawGbaD8cA2f2sagvsg00brte2v?=
 =?us-ascii?Q?mZqky8QgthorerXbyMXqE4Y3HqsmXvvcIwFmKGoApSnTV/3DDJGX2Zo7diCD?=
 =?us-ascii?Q?K+O5tp+SA09kvlLPKQpEzV3SRR/jAjgZm7ttzOmsnQZrW3qn97e+VZH/y78w?=
 =?us-ascii?Q?bk8jhBOLaXPuYQB3D6sMbxgvpbRNtCz77mwLnoAoQSTE/1xPZR91S4WG+w2X?=
 =?us-ascii?Q?NCG9UZrwUqj6RCzHWKXs180w8836A4hXx8x/hEs9OEodzdbPBG8ExJRQuRIP?=
 =?us-ascii?Q?e7T7L7NNrlq3TN4XiT/w+EKa7vuv83csCU/v30sbJl8gN5gi+gG34paRgkaI?=
 =?us-ascii?Q?Szzq5rBRQy7j91Spj6QZq4OyekzvZ6K41XS5YSlw4stQa1p9H3expDShBCMR?=
 =?us-ascii?Q?bQ+qhmyb13jcdDWiQnRNH5n0WP2heSwEdugsOTY0ozYVT+6m4obruoCVxYAC?=
 =?us-ascii?Q?z4Q70mo00uteplmyx3TqddyDUqt/rbND1xk7aDIvSj5kQLGCtyv4YRwPIT1r?=
 =?us-ascii?Q?SYbGklhXhfViq7WjiNZRAAZUjpTlNc3xQ4xbc2yXlUxMbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?325QulcfT7ZbeITqlnhl8KH2562k9N8GrCdZHLbOe3MbwlNG18LYA4BBVQUL?=
 =?us-ascii?Q?m6Yca8PGb1A7W56bJ8+Za+47C0EDIAsBTzVg4H/dj3aFKCrO3l8U7Pscs3+i?=
 =?us-ascii?Q?FUEfepGtmxQSfoL6SIbX4CAPTllvZfQLb5qSSo5C/c4RLghgrXRU41k3sKtO?=
 =?us-ascii?Q?CrBeqoxxpl1gKkH8b1eJVdm8OikwoBGKsZFfM/HIzn6l0tG38mdWlkgjxbn+?=
 =?us-ascii?Q?8Rd3ZHuCUHaeccikhtE2ZSjTn7MRZl3M6HivLJ7JsvFxR/3v5bXOPv7QhDK3?=
 =?us-ascii?Q?Ipss/e7G02rK5e8ZNGV7HmuT7Yo9o33UmSyqPg+rAthFSdZ8rsjFIED7CVPW?=
 =?us-ascii?Q?ndWNxgQGfMalXV5H1BH7cMq57pf+Kg+dscg1eVI0qFh/3uOHfQSNKFJcDR+v?=
 =?us-ascii?Q?eQRf8k5/ffd0V/8tJ1VGVXld4jRtcWQ5Az5dUWM/LtMBuDDxnjKqAPYOSJUc?=
 =?us-ascii?Q?RqsSTe4KgYhSKQY/ttqd1iQ/smMYyhV9aTCaWSsathnbtSuY+B/otGtjg4Nj?=
 =?us-ascii?Q?1ZP4a3s4qpguINYm38ktRrwDoxjXULjhtBcmeKkhVRtgMxWKn4YBxdfDT7yo?=
 =?us-ascii?Q?JePO/dNJydzdsjT8n6Z4u46JGSDQ7gpM2vmTFedMYlAP+DJfFAMwT98Ko0gh?=
 =?us-ascii?Q?1jT6/wlE+q/6o9wuGvFacZz4QWxV+TPin1TmBxChcfATZuWrpT+I9TdBDllv?=
 =?us-ascii?Q?SGNeGpQaU8hXpYb8we5IIsbfB8ac4+V4woCZDZ5kxIRR7vqJKM+0hbxFE49r?=
 =?us-ascii?Q?exAUh+VmQvm16ay1VfI5ZTj6bNIGN9bf9pS4wn6Q5kToD2eSWpDqwq3iRPGO?=
 =?us-ascii?Q?gMbo+4L8RMrI4NhB0htQbhYRqQZKiMBzypW/VOgkyUrYw0kZst4UA+yg59s5?=
 =?us-ascii?Q?1So+idWyrYMkGS+F1kHz5xkgdMEsCVFhDg4Of2WsvqMWXAwKVU18dSZBNCdF?=
 =?us-ascii?Q?+GG/D9pQnggRok4h57JSl8knYR/Rqa+S8EwHXomS9YAK2GsRX3Yab4z4Eqbc?=
 =?us-ascii?Q?CKJ6BGwdA31NTSkAi6P71mBIrKp8HxiT37UbvVRylKj/xXKmisFJWk1z6Pfh?=
 =?us-ascii?Q?rVj4H6esFoICyTwSteMSPlYBh/K1Vy4QJNMPXaCfKFzFhaj/y86IBDz2yLWR?=
 =?us-ascii?Q?dW1E0iySJz7aXD0enNr/u3K74hdVKELlZObTUD5Tf9cB1CNAkLHhqFxEMrAN?=
 =?us-ascii?Q?dcJHZIcjK4Pz3juiL767rGI6t73cXnIQDVzco/kLXgwnyZsR6CfBUIsUhdEp?=
 =?us-ascii?Q?HXa/Qqgf+t8hlQPL/escWNOLqnwiwfFuPViStwmlg2idfDalKc9nOmc/sLxM?=
 =?us-ascii?Q?QPkBwbI5xxXQnGacwIfz8GGJwIbwNOrW4WTVMj8Hn2E5KLRYZCaUWgMMOtYI?=
 =?us-ascii?Q?eSoiePGCWDL234fkTKiVwdgYRaxqc/7xWzbQKO2ol59VMyaAHnw5wraTT8ZL?=
 =?us-ascii?Q?ekGPzzdLfaDVauD4d/eJwqf9V1AqxlGjgIw2kdbREcURQdYVI1dOPEszNcZw?=
 =?us-ascii?Q?L/qq6s8T86KM2KSBw78Wvoy0YZxauRhBVXVTDBAaJbYZcv/yt4B6eq8LgF5J?=
 =?us-ascii?Q?yJYprzsvSH4Wr+zvUYrWcVBb6npnJirfGwDvNAvBiRylXuh2ink7s4f2nN/8?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4173e70b-68bf-4a24-97c8-08dcd828e076
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:28:45.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1RJsE2X7eoHl9ESIQsLUI69e7SqUg8ozfzQlZLppviLYFmDZDcbF9Aw4IDHA4EBqWGPDP2gT70votaWUIvraWR/nGT9JEP/wzYfC+1/Hok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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

On Mon, Sep 16, 2024 at 01:39:12PM GMT, Matt Roper wrote:
>On Mon, Sep 16, 2024 at 02:09:45PM -0400, Rodrigo Vivi wrote:
>> On Fri, Sep 13, 2024 at 09:29:11AM -0700, Matt Roper wrote:
>> > It's quite unusual to read display registers as part of GT
>> > initialization, but use of the display reference timestamp is one
>> > approach to calculating the GT clock frequency on older platforms.
>> > Rename the function that does this readout and move it to display/ to
>> > make it more clear what's actually happening when this route is taken.
>> > Also add an assert that we've probed display before calling this
>> > function since we never expect this to be the route taken on platforms
>> > that lack display.
>>
>> oh! that's ugly.
>> How much of this calculations and clocks are actually a coincidence then?
>>
>> Shouldn't we be using a GT based timestamp then?
>> Or perhaps a MCHBAR one? But why display timestamp would give anything
>> GT related?
>
>We choose whether or not to use this register based on CTC_MODE[0].  The
>two options are either "Crystal Clock Pin Source (default)" or
>"Broadwell Divide Logic."  The description of the latter doesn't really
>mean anything to me and doesn't seem to be explained further anywhere in
>the bspec that I can find, but presumably it means the clock is tied to
>some soc-level clock that also happens to be the same one used as the
>display's reference clock.  In fact I suspect that DSSM[31:29] would
>have worked just as well for this purpose as TIMESTAMP_OVERRIDE[9:0]
>does, but that's still just another display register.  That also likely
>means that if we didn't still care about gen12lp platforms in Xe, we
>could probably avoid reading the register at all.  I.e., everything
>Xe_HP and later has only had a single display reference clock (38.4 MHz)
>and we could probably just hardcode that value if we see the "Broadwell
>Divide Logic" setting.
>
>The use of this register was introduced (in i915) in commit dab91783338b
>("drm/i915: expose command stream timestamp frequency to userspace").
>Adding Lionel to the Cc list just in case he remembers any more details
>about where the "use display register when CTC_MODE[0] says so"
>information was documented at the time.

I'll leave my r-b since this seems better than the current state. But
we should wait this to settle.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
