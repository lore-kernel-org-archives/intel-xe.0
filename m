Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE6FD149F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8D710EBA2;
	Fri, 25 Oct 2024 23:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myhdR4pZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8BC10EBA2
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 23:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729897669; x=1761433669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UdLB5Ph93o2N6ZeoHPypD33eeYoI8c8shGXkA7M+CdA=;
 b=myhdR4pZhkb/NHPBoGBHhwpHOq2QzU0btWCggiQseHs1nTqHVzXY1doa
 W1RPuABE66czRuq53gUwDjvSdpzLoTTKk4YLunGv3GFuTWorhUSSTDmwE
 6rGW7nc36g2LzmbRS4DKmQyIlAPAIi4xBGL5EzOdddkBo4pyBs+xWV0dx
 sybaGvztgvv9NdsLK0lDkksvFGbEvY89YgwplTuG46kfOF94Ss5HXZrjW
 8CnG9USuZj2NHbvATIxdH+aUmoDn+wPhm1QMG9BsqaKA+BBBuinBWvLsJ
 LQb9fVTOSz044aprmSkyXXdhcX3HumE9A43Jr+3Hh6/3RksjFPrh+AVAP w==;
X-CSE-ConnectionGUID: 2/z3vtH7TqaL8ys2uZngyw==
X-CSE-MsgGUID: 14JLqxK+SJKI124rnF5azQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40969495"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="40969495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 16:07:48 -0700
X-CSE-ConnectionGUID: /JlmIwrpS/KD5OyQxSR/9g==
X-CSE-MsgGUID: PwC4cZjlTzShZlkjvRzUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81505663"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 16:07:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 16:07:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 16:07:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 16:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd3+39txgaS5mVQSLRi7mTVdM2UfOtWsiadfhB6MxQ2GI5bGvwqFclsw1dtOenW0MKr5YSjzLEsG68BkSNGo/kxCWbqekG39b05zkhoRRLnaLotbOoSZn2igZUk8D8B4WiVlpopq0NElTNwJfkQGmWxx0ho9DkLM+d5H+yOlAZt2Euvqqshh7lGVD15pUFwgo4KTrsnS58jtn1FE5vw9uwQHMln/7QYyD1kd6D+gePO17wcr8QvfIe+sfz10g8xHzqJGErSl+x6V+fxPZeKGRkryYvve+ltdgQfx/px2VsH03jwoiwoBl4SaN8WCsJagY99LGhFCw8Wjgc66Bd8Dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcNOth2uH0Ad1/mhjX1Egm+eTaLx77VwAcnNYpeUXXw=;
 b=yIxcZ9K2cM/81ySj+QEXgXv9dMmFpicvyHcU9X5dOy4eNrdshyj8rGeOb5n5QyhTrFN+a/bfGnJM1JVlypv46FWuKQAN+ocOVLZlb4wWDnvgsQ+pSC0BuF9aLyck5hufQOvgWGV3SF/4m2QdoBMw4PH+E7O+qHGSjxF5VqgtaH3uwBb9Pe1y9HgH7KzLOj9vtHAmDNWyFv3hMmkU32HsJCF4kcuiWVJdylcxmIdCBPyWmua0cjlQCraqUatNCaOqBb/lpNWboYfbLCkk0kr4OhDA4bhiERGHsxIz1ZWCPqrApSB3O/ED4DWo7WgJTqPmtw/LIQ4pMOPb8vRbhdfWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 23:07:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 23:07:44 +0000
Date: Fri, 25 Oct 2024 18:07:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <John.C.Harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
 <Zxvrri2LSkodxC-g@black.fi.intel.com>
 <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 01791dca-2f01-4fad-676e-08dcf549d54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8CuLpNVfrVcmmMosgyggpTM9kiwTQzc/Fs6WqFS6NL7WlxmQRWUv+Vuc2hZm?=
 =?us-ascii?Q?G8YV+yBegtLhryQY+ItZwwPQ1/kqv1j6i8E9pxjwKwUVjE5xBkyne/lH5mZB?=
 =?us-ascii?Q?xaY3ufbVhzFJygQtnUJybnYVmRMPj4IYsmjpvt7kbho8ZJQJy4hiFrXT362m?=
 =?us-ascii?Q?2cMy0+KV+bQc/qjx+a3KDAUiTTM0KyMQEBtQd94Uz8wzs961seW6jyCb9oJJ?=
 =?us-ascii?Q?EBB0ppzhwXj8TDDG9rXHdVca4Gb+zFsREM/FMJPdxvut06ol8497eSCyQMeT?=
 =?us-ascii?Q?7ccM+5dSU5S2l5ac4fLVwEp8MLN+pGFDGU+QXwhv9E4gGsCA57JF00nv+i/h?=
 =?us-ascii?Q?cDPSM22air23Pz88LN1kmaIM0KUe71/O2GuD5wEMc/EujQ9GB8FeFKcpxGHt?=
 =?us-ascii?Q?TkYFeh4TBEPAIAspmkH6nJV1Eg0/0pYsKgYUVv0zErnYuH7qdkluwfAuzuIv?=
 =?us-ascii?Q?Be3khkovBy93nU3iPfv8DlKXNgIXMg0LpWn/Yj/U9B7WP5Vkv6i/4lCAlHJO?=
 =?us-ascii?Q?9UD14KH4pW+N5JYh/2VhP47qREzJwFyHrGLlXdDbGNJAqUHgUei4USu7OURQ?=
 =?us-ascii?Q?0jlbhKOO9kkwAZd+qebESiy0Ll+znxTSyQG6AjYwp9Ay1bc5OGxDW1PIgd3v?=
 =?us-ascii?Q?+8thd/UFxAvOVcD+XxaJyuLeS1KE5ahGy1lIoF3Uqxce8MxeCPpWfodfyuva?=
 =?us-ascii?Q?KW1tC0/uj918P6Wh8tL8YC+yaL/CEI495kxCRhPutN0XJaOhXmBU3PRS2IkU?=
 =?us-ascii?Q?11B8oTib1CRokZCLYTRIUuEaPyv6JPDJ/3wWzjQLd9p0MMhcCa9rnyuOHTOk?=
 =?us-ascii?Q?FMj2X0W6pOcAMjzcBrnFSEJvNbHGUIu14VVO6tb09X9+dHrpFp4pUuZfU8GB?=
 =?us-ascii?Q?zsaP6ITIdzgoHmkTJ1HtoK8uikxxjawOsWy8pf16g1GSJ7OjbfbeOmvArE29?=
 =?us-ascii?Q?V8O8ozzJxTLVTSc/bLHh+TUjjyms5ZkK0CEhEykBWCUBZsZlv4rmwjuL8Wqw?=
 =?us-ascii?Q?IET+AnnXZ7ZVl44UUvKqwNktMZin9HBTO2sW1/j61Hkd0F3tKm3Ni4aXLRqL?=
 =?us-ascii?Q?pP7xne1aXb/cfq7kNVMcFXgiwBZrKtBVtaeQ05X4fZM2cZlTd3vCxTsG2ygu?=
 =?us-ascii?Q?+SjxZx+hXFfKn3KQ1Ak8j9Gc7baKTOzB7sT6YL0hZzLdtL72XP9pKNrhFnYI?=
 =?us-ascii?Q?HEQFVg2t7qiSXqEv7uX9tPPG1c9zgz58TpYwfaL0F6Mqy7xCjrLSgjLREwzc?=
 =?us-ascii?Q?8aZwulNoFLsoYSGSVo4i1hYxuKeT31C8gQjieygzgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+ZqBhWYqqXaTzON4626XPObNXkRekMz0WPULpcXDiDvouP1RyKNv+Q552ZQ?=
 =?us-ascii?Q?XrYwjiAp1n4Zjj+ckcXbWaX8qD621DmDESxrYYkkn+QVTozzHvJNxck9cFEq?=
 =?us-ascii?Q?pokSlwjUCBdwBM4QBKC7Av0FTDpnmVN6ciHtEYAz8znUkTPF2fRhUveGKVnU?=
 =?us-ascii?Q?+6zGD+laTw8iUAm2VT3vVNQarib/jYgMhJvs6z9XPCkOU7q7eLKXylEvmg8/?=
 =?us-ascii?Q?KBA8ohOtrxUc0opva+5LBrN9ua45LPyjrMs/NTvsMm0l7WYbrknXV1MyV2At?=
 =?us-ascii?Q?iMK85GlVh7Saxte6GO8XDfK5Qj121R2pPjLABeR+CUF/JAek0WjGKbgnxZA4?=
 =?us-ascii?Q?Hr09dxGipP93bWBTHQzhZvwQD7Q/w3MPlZI0zD/wfsvECgS6cjHd+FnkIeQl?=
 =?us-ascii?Q?hAb4mFyQKZ2F22mBpZujX73umzfiqU7EI0lGDcb5kzudbyGbX/6k0ZQJ6q8b?=
 =?us-ascii?Q?KwegZGY/xi0EqbrINYDVkvGVXvib38FOXOOATTV0r2ybIpyolKArNvuHcCoz?=
 =?us-ascii?Q?Mh6m2aJyWYsJvX5hhpMCbYhilm5TGuHzKcyAlIybXDTsI0BYOL6SSJzlP50W?=
 =?us-ascii?Q?GUpxY+zFZ/13XqHtvrHUMp6iGzfLlJqyJuoUWsE72Als6MjIq9yP+ppfWcT8?=
 =?us-ascii?Q?VKEeI/IflmJznJiPjzGFubj3zEVvdLkscXbxuA7a5lw4ozQZAFP23TmuBKps?=
 =?us-ascii?Q?7LuBOzKYoiOhKEo7fJq119UEm6PYtMGIZ84r/4C1frvvuengPpzSQjPGYrYq?=
 =?us-ascii?Q?NtrPFZ03RRoUWwSvSSNMD8G3kGJAi6nvFk4p9CZYWd5wD8b2ATjDbe0I0O18?=
 =?us-ascii?Q?sHEfyTIcbb0WIDHK8IO2F6OA6ISr06niXnkcg7QfxF4VBDB5LN5PfWwweEzH?=
 =?us-ascii?Q?GMtlscsmMoIBjPydpjfAtCwt6QDsyJFV3gecZC6czDvLYKbgsdiLy65ltVlR?=
 =?us-ascii?Q?b5keANbpmwJ5IdJ1fL/wwBNxZZlYxNQTSegIP+U6siRdI6LmpfIqupH+2TeE?=
 =?us-ascii?Q?7XFOusa5JKyOD695AT2r51oDbMoZmDlp+lYX/3YpXg3sv6vSPGD2tBZpoINF?=
 =?us-ascii?Q?UmaSRNLpswCgD6MVDYR7hi35bw8ZKSvOJg1F1h1V9l6XdSf1htbO5YWjTGP5?=
 =?us-ascii?Q?20AqQJQxrzfGNsEtZhNu7Ftu/gXWz9J3aBB9yeSGSGT+WYFMy4U0wmWCVwEa?=
 =?us-ascii?Q?1bgMS6J61azwx1gipammfNpBYze9/xtHZ2vaSz7r73BJQqy5wbOEu1EtEnxj?=
 =?us-ascii?Q?Y8PSV1JJNSP8blrhqD9bQUk1MWkh9VWZSzqxjd1gkmDWkXftyINeLDLwIVPo?=
 =?us-ascii?Q?778GU1Qk2i/SiKYHuhPFs9vPwv77AUQjKwRatoQ34Lg9CMJmGCUF4xY9J9qo?=
 =?us-ascii?Q?FgDdi4W0bVE9UlN+lpXV/GSDwW9AnnZlutBEBIPU8vAvGjgTmIu7n3HPdJp1?=
 =?us-ascii?Q?7+eO2O+nYftOnh3ZSlsQ8vMFvz1JrTiWZR81nMrkgqrFPcKjstkkoSEu8pXG?=
 =?us-ascii?Q?zT9KhcC2qZe4TS8hkO5zakd2LaBJkUWCM7CCrzr1AOQNln/oof7EJa2DxRLO?=
 =?us-ascii?Q?raCD2e0p8RZn10B53wQHG/HS7/eEU8dfJSuVKrsk4Flqd7fwuMd5rpzzjqB/?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01791dca-2f01-4fad-676e-08dcf549d54b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 23:07:44.1346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWrW1nPnpPWfkI1WuwGQmhp4/fn3s5qKd1s0FAnZ6kOHfabM97yEzlZZ8GKUp5/TX7SKeia7zVa2ErqrdDZ63VMXKAjRbW9+PIygF+1D/Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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

+Sujaritha

Rodrigo was already Cc'ed, but please take a look below.

On Fri, Oct 25, 2024 at 01:45:34PM -0700, Matt Roper wrote:
>On Fri, Oct 25, 2024 at 10:04:14PM +0300, Raag Jadav wrote:
>> On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
>> > On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
>> > > Current implementation adds multiple sysfs entries for getting GT
>> > > throttle status and its reasons, which forces the user to read multiple
>> > > entries for evaluating the result. Since output of each entry is based
>> > > on the same underlying hardware register and considering the access type
>> > > of this register is RO/v, the value of this register can change at any
>> > > given point, even between subsequent sysfs reads. This makes current
>> > > implementation fundamentally flawed which can produce inconsistent results.
>> > >
>> > > Rework throttle ABI and introduce throttle_status attribute which will
>> > > provide throttle status through a oneshot register read, making it
>> > > relatively less error prone. The new ABI will provide throttle reasons
>> > > in a string based list based on the respective bits which are set in the
>> > > hardware. Empty output means no bits are set and hence no throttling.
>> >
>> > But the old ABI is already released, and we have platforms with
>> > force_probe lifted already.  Presumably userspace software is already
>> > using the existing interface (otherwise it never would have been allowed
>> > to land upstream), so that means we can't change it in incompatible ways
>> > anymore; we're locked into supporting the current interface forever on
>> > these platforms.
>> >
>> > We can change the ABI for _future_ platforms if it makes sense, but it's
>> > too late to make compatibility-breaking changes for LNL and BMG.
>>
>> It landed upstream pretty recently AFAICT, atleast in xe.
>
>It landed upstream about 10 months ago:
>
>        commit 1c8e9019033728093c04608f44c6e87fec6822e1
>        Author:     Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>        AuthorDate: Fri Dec 8 00:11:52 2023 -0500
>        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
>        CommitDate: Thu Dec 21 11:45:28 2023 -0500
>
>            drm/xe: Add frequency throttle reasons sysfs attributes
>
>and has been part of the 6.8 kernel onward.  So this isn't a case where
>something just recently landed in drm-tip and hasn't made its way into a
>formal kernel.org release yet.
>
>> So maybe worth reconsidering.
>
>It's not really a decision that we get to make.  One of the absolute
>rules of Linux kernel development is that we cannot break
>kernel<->userspace ABI that's being used.  A user must always be able to
>safely upgrade their kernel without updating any other software on the
>system without suffering breakage/regressions (with slight exceptions
>for special security-related cases).  In this case, if you remove the
>existing sysfs APIs and try to replace them with something different,
>then it will immediately break existing tools that were using the old
>interface.  That's simply not allowed by Linux kernel rules.
>
>>
>> > >
>> > > $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
>> > > prochot
>> > > thermal
>> > > ratl
>> > > thermalert
>> > > tdc
>> > > pl4
>> > > pl1
>> > > pl2
>> > >
>> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
>> >
>> > I'm not sure what this ticket is about, but it was already closed
>> > several weeks ago due to no longer reproducing.
>>
>> I'm sure we all have our "it works on my machine" moment :D
>
>The point is that we can't point at a non-active issue as justification
>here.  If the failure reported in that issue is still relevant, the
>ticket should be re-opened and a proper analysis should be posted there.
>But changing the ABI like this wouldn't help anyway since it would just
>guarantee that the test breaks (because none of the interfaces it tries
>to check would exist anymore).  This patch wouldn't actually fix or
>close that ticket.
>
>Besides, the failure in that ticket likely isn't a KMD issue at all,
>just a bug in the test.  By design, these sysfs interfaces represent the
>"right now" status of the hardware.  If you read several sysfs entries
>then the status could change as that's happening.  It's just a flaw in
>the test that it overlooked this and incorrectly assumed the status
>would never change while the test is running.
>
>>
>> > The ABI change here doesn't seem to be directly related to this ticket.
>>
>> We can always create new tickets, and that's not the point.
>> The point is we're stuck with unreliable ABI.
>
>Unreliable how?  We don't let new userspace interfaces into the kernel
>unless there's real (not IGT) userspace software lined up to use them,
>and the userspace developers have already signed off on the design and
>semantics of the interfaces.  Presumably the current users are happy
>with the current semantics and understand that the status provided is
>live rather than sticky.

I was looking at that commit and noticed that it actually doesn't point
to any real userspace user though. Ugh. Kernel doesn't break userspace
interface. That's true, but it's not the same as "the ABI never
changes". It's always risky and a decision not taken lightly because
there's a *potential* for breakage.  However you are not breaking
userspace if the usersapce doesn't exist.  It seems the uapi was mainly
a copy & paste from i915.

So, a couple questions here:

1) are there userspace tools consuming this UAPI?

Rodrigo, I've heard you were integrating it in a top-like app. Would
that be the first user? grepping around I couldn't find anything
actually using these sysfs files with xe. The only references I found
were in

a) https://github.com/intel/compute-runtime

but that is not in the interface with xe AFAICS... it's in the 
os_frequency_imp_prelim.cpp

b) https://github.com/geopm/geopm

not very familiar with that, but it's possible it's actually used,
although I don't know if it's just an i915 interface or not.


2) Unreliable how?  Just as Matt asked, if it's unreliable you need to
provide a proper justification for it. From the commit message:

	Current implementation adds multiple sysfs entries for getting GT
	throttle status and its reasons, which forces the user to read multiple
	entries for evaluating the result. Since output of each entry is based
	on the same underlying hardware register and considering the access type
	of this register is RO/v, the value of this register can change at any
	given point, even between subsequent sysfs reads. This makes current
	implementation fundamentally flawed which can produce inconsistent results.

so what? the error would be in the user thinking that he could read
multiple sysfs files atomically. What if user is interested in just 1
of them?

It seems like adding a new file that guarantees this atomicity, is
documented as such and *points to an actual userspace consumer*
would be much better, with no potential for breakage. If then we find
out there are no users of the old interface, we may think about
deprecating/removing it.

Lucas De Marchi

>
>Sometimes we realize down the road that we did overlook something
>important in an interface.  It's unfortunate when that happens, but the
>path forward then is that we create a new, alternate API on the side and
>let existing userspace migrate over or not as it sees fit (e.g., stuff
>like the DRM "addfb2" ioctl being added as a more expressive alternative
>to "addfb" usage).  We still need to support the old interface though;
>we can generally only sunset it for future platforms where there's no
>pre-existing software already using the old interface.
>
>
>Matt
>
>>
>> Side note: The logs in the ticket may help connect the dots with commit message.
>>
>> Raag
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
