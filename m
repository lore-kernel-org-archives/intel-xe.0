Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F4C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 18:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FEB112EDC;
	Tue,  9 Apr 2024 18:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpnLN+hb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EC3112EDC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712688737; x=1744224737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pdeyONY6gh8V1CdTzp/ubxVjGBAYylY/MQvdNrnSjLc=;
 b=ZpnLN+hbbi4hvydL8Q4tCjoc2WpqRE7uxZWh//l4oeIZdmTR1WKN2Yok
 FQJMv6EP/o7LNaeSZKfVouy9EC4yRDIDv+ETwU9mRzdjKZ1n7s7K2r1Gn
 3EwcjPkSHlQdeOdZf27fsBeBl4PdJ1qk/Bvpz3vq8KkfoxUD5/4e6TtLf
 VFeCHx+jYZ4pQODUBD1a8NDM8UGbMqTjwIlK1fqtzu83TjoOY/4wwsCM3
 O/qhJchXz1LvB+sNh0uScvhFxHiWDtXZR+DfCAjIcOHxLZOYSYjNo1pBf
 /SKA9WtKNpuahQoNpVND58FX0xOwsNwJhUupVdI/SZF4XAFI9RMYwRz3d Q==;
X-CSE-ConnectionGUID: dW+hvcclQiqJx1DtetFRjw==
X-CSE-MsgGUID: +7KjwNb5TG+P/W4Feo04ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25465966"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25465966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 11:52:17 -0700
X-CSE-ConnectionGUID: 6rd4JDKPQ2iMKAJ19XW4kg==
X-CSE-MsgGUID: Pneq6uaWRMeyyb7FeYsI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20422797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 11:52:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 11:52:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 11:52:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 11:52:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 11:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSIv6ssT442k4wqFzy6tftX+WRaON73Ce8E0h8Y84SHDrcFhFGWfqAa5raEadxex6OsKOQPrDARnL1B4mqwzlZ8FxyxDTChLwV0JX2y13dP1VgfIcd4RxfkCsc9yJTkLQa8XSi2HZmqLXn3QlQ1kKdXcMFyEL1iQshQ5ffUW8SZ/UrPVmMA30eiWtZhqlH3yEjkQm1orq2H/kiAgsgoNiaumCdThpVV0SzaIDKHpxKkmaraf7Z6rbGEY1PlWitbDl/SEwkEX+xSZMuP7YwBYFWx3EY8OcCmlaoGv+QzAqFtBY+Me2ve79zfN0qQBfCQvuEbj5zjE09I/RvRozvb8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKVGiL3kETg+bCjZklqviIolHMe5GCAAapUyB5pT/c8=;
 b=DZrDKInvNa4qQOklz/mn9aeLAdhq2ac82t3bwoV0seNnEXCnv6CCRzgo7X7C9zWl4eM37oSu6Y8l5O6UcjyaiZK8lecDYhRPm5B3uOP8ZKNkpDbFDRUhMR2QX2Wxi8wQv2VqErd1NJ4UirmC12km03UMsweklwGHG2ewb09E/KW1OqZ51RDj7FWIek7xSBtWQqYzQArG2JW5vFkcjF0NQqhzQtEpYu0t42MVbVaf0nmqz4f9qkW2BhmxWb0VIg6kBuQScC0gU/vbAg2iC0c2r29LNT/zpeSZpnToyY8cDNDW3hEcBUdO2L56tZe7onxGIpHo9h2rEub6ntuJtC0p2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 18:52:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 18:52:12 +0000
Date: Tue, 9 Apr 2024 14:52:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Message-ID: <ZhWOV9puU8o3-qZM@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6622:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQIjzkmjdRvVjkV+8+5K3tsP5zj15D5GXToz+QgS0qmCbhZCHgmsjumNTXxTK7j1nExNxEPzCbKhhtgdTp4mjh+uSbl8PHO0CTyYu3LkBAy6Jm3fK1c0JXkOSbnsKd/bDucBhHrb9SbBME+wK7oiQeuO7yEwbqS/4jjSDVUxD16j529TaHiltOqQY5CmxKKd+/Riy3wEwQ+k8E37TyVBsRLQtYr9tFJCM9jKuwF/PTqAhlTvJpAgX3g6XVYmLFa1bAclY9oQ56LmGhH5zoLTqriwumrW7dH/w0ru6OwlSPWMn7vHZGC/iflU+NbF10FIfr2k6kb4jBaDbeGFPPx+52x8WxooGISUkVW4yhnpmNQsYsjz6CFSBVMuwuPO5ZzvNLjbYHQIikEh8SWluQyMz8YBO4Ywz3+YN6V0k8/mJvY7LSzC1C+DBBmc91sWac3divgvImy5C1f4ekyH4ioEYGDFNjc/596AEntL0+UFAmhgpLpND2tMUFM9C7gYb/bZ4PnJhJwBwaYqivh9hzGKq9G7y4dbqY6MiyDou+kXh16yi/UmMiujoGbHbSxXzpUjLoXpMpm90ZL472DKNxxX1tDrDuSZuusL2+Gkk0cPNQEb0ENRSHpuXtFEAyCumchkbLItgimzPULs0IOeU0K6E/dJ0tl5/EjNCwbBbvuhvtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJ+0hxjeYHN/K93Jzks12nOusWHmjAm6ujScoz2zIBnNqY+CAuJXuPEWGKHN?=
 =?us-ascii?Q?1lzJDoyD90ErFEFSGPme4DIHlno0p18lL3Rg150rQnLguo/tf7VOJHciTrfj?=
 =?us-ascii?Q?1wY/RuteQ0z4er1qdRqTaxWpNZvvb7VuU4BCyrhfoAblhqKs5NLksqrprsAh?=
 =?us-ascii?Q?MdoeKV9lWhBec8TXj5Q4ocGfLHo+9UAXhfVzoBXbzeYXApyP2gh01PGcRR7g?=
 =?us-ascii?Q?RBf7m5u1DXxRzPF4B+B3vnO6zZoz2k8B/BxON+erextCaDRWEaxwjZgkonFU?=
 =?us-ascii?Q?Q36kItvth62M0zxjAXimGi+uJedlHwXkdyDOgIy0Ry2D9vD2KVD+Edh73DNo?=
 =?us-ascii?Q?wDrMC9i7OfVAyed0fvdm2MMfKWFoc6Miq4uIEnOXy6Kx+7kDmeVForjKn+Sh?=
 =?us-ascii?Q?igpSiZA5bMvKo4k9FsOPJFZOUkzMd6r0LBXCubyPzEklbUSsdU1VB+sw4N6z?=
 =?us-ascii?Q?SNkK/4nOb+Yn9RkZB0ETnvoT3cuP+e6ZvfDyfZFOT+IkIRwXjo8Di31iAzy6?=
 =?us-ascii?Q?A1y1teeIYF6NCc+01jPUu10odIl8uppLDvmk4aQBT15ba2SNT6iXWLjTvVU4?=
 =?us-ascii?Q?jp5nFBSUsqMemxrf1zv8ieOHfXtuy19XdgerGDJDSIvYpnuqM6HDKwZtavKZ?=
 =?us-ascii?Q?yddJUJym3HrQ5aK3hG7WeXElXoGszOQhLhQyimcz3xIRa7dbOd4lz0eL67LX?=
 =?us-ascii?Q?Z+4g7KtM9I2H3Yzn1kFOQqXfORU9gqgPKrAZ9YgArVM+hjES1TDEPwUf/KOG?=
 =?us-ascii?Q?E4zQWQiUmfFAoNUO+n7zrp8MP09M/W9KK/58AZ0aswQ/cmVgSCPfOG2+Cn9I?=
 =?us-ascii?Q?bQdZNn0HCFwmaIhDZfzjtfz8VDdIzmKwLz6dWtexlYuraptduWwiIw/eQBrt?=
 =?us-ascii?Q?kF7QSHLIoZ/QGFfFqZBlAW9cAigVaTyyTXM6LKt6tnhcqZtCGNrHSVxkUZnk?=
 =?us-ascii?Q?9ZaciHIJSWj4RfWBx8Cpp/JHzIYJl9ve33pPWlJQHrMb9RFtfIAv9okjXuGV?=
 =?us-ascii?Q?BoGR+mEU5jhBUi2/pCXzZGDPkCGn9TOYDR6Iv/L/iJ2C/U2uTcpyfs9zGdqN?=
 =?us-ascii?Q?F0uBurDK43q+iVBqF6NvrpUQxpjj4JIe+yxbxd4EMmCgFPzdAJ0TlTIaJRiF?=
 =?us-ascii?Q?ghLUyq20TcmR77XspFw6Wn73+jrO4to9nJKEvhuQZxu1CddspOopy2zRNiNX?=
 =?us-ascii?Q?xeDkZiQzWsGY3O7X/IVbXKD7eO/jhCKlB1eMhCLgzAn1BvrHvM/mnRkx+t7d?=
 =?us-ascii?Q?Q43EbRrupw940NsWrkFcKm4XIfiggwiWZArV1OG0xnDxVdsROIMUP1W+bNVD?=
 =?us-ascii?Q?cYRLsRGpt3yR9qynzxwfEZmVSjX7g+7VgZSmZNq8UDKYaTCMEQCRiGwgXX4Z?=
 =?us-ascii?Q?psONohQ6nuPhd0xyg72u8ULJS9YZSsl2oKPw6BUPjbsefWTT2nvlq4PaIkt9?=
 =?us-ascii?Q?h6QRAPrrkLED1+mmBGskfEnWPz8ZPyUXja41/WeDanEa4uWh9nFJOalmeKcu?=
 =?us-ascii?Q?NXOb11ZHy6cCCC35Lma2htOPoavhx0tat1IEvN79WvYZtD6RMcLRSXRIZZpF?=
 =?us-ascii?Q?ZesCGHhwyNw8LauLkyGp3ObywcVoDj/ejODRIe9UwRCWEzOf+ayYVpa7cMQ4?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a19f0b-160e-4824-8cba-08dc58c62ab4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 18:52:12.7543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6G5Am9FqbzjCVA3buN8HDAxCdzvTQQ4+CxTUOOGmL0QrBontR2VVYR7I6W6/CxWFIIJBMScICqhHkhH0daAeOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

On Tue, Apr 09, 2024 at 12:52:34PM -0500, Lucas De Marchi wrote:
> On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
> > Return u64 from xe_hwmon_process_reg, instead of a void return.
> > u64* input pointer not needed with this change.
> > 
> > With this caller can directly assign return value to a variable without
> > need of explicit initialization and pass by reference.
> > 
> > v2:
> > - Fix checkpatch warnings.
> > 
> > v3:
> > - Rebase
> > - Removed unncessary break statements.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> 
> Applied the other patches.  This one I'm putting on hold to think about.
> 
> I'm not sure the approach in that hwmon in general is good with the
> xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
> some pm refs when it doesn't need (to decide if attribute is visible).

I believe this approach is fine.
We do need to earlier get pm refs if we believe that there will be mmio
operations underneath. Better more then less in this case.

> 
> Lucas De Marchi
