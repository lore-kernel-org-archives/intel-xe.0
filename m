Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331AFC47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 03:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147F10EDAE;
	Mon, 26 Feb 2024 03:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miXHwRUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854C610EDAE
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 03:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708918324; x=1740454324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mND30rzAEPlkKNS7y2dFfakDxmHQxWUlqsAVltat5F0=;
 b=miXHwRUTIqxxBUejBXLV6X3ui7xpBbKhcGuBdvUq/O4xCL2v1ziyJPXH
 4nXhqe0rDw0gcqVga0SC4SqAOJqiOuJ+bH/L5bVhWQ6XaORYCNE2gt8BP
 MA355DMOgXTOJlq/DzU1/OpxdeJVgFhIm8eeUP7mVnozk8RCDodbdwRcR
 vUna39Mg4bPdkhyTO/pHYVOv4y0ld0TjlPL4thTPXK88NT+q+AJ3GmGLK
 OoZ7k2ytcMREi/6AL9Z6HU+r/krKlQyAR2TOt5SQgcHZRuJnRw0OyxncD
 xIEMiBiqwjKql+/YTyNgd27t9m2/Hvz3t24QlZ1gwhTedwva6QisX+hQ0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20729976"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="20729976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="37317369"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:32:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:32:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:32:02 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:32:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMrlZa6iQjbdYaW7MRJC1dLPYrqSWbKOW4xqUVa9WWkf0pTk92CzDudBJm+LYjIWmNhOA6CFhljLx6QPxqL9FSg7w2boxlfLs+zKj4VB85qywxxu/+lFCnleugGTg2x3CnPH2UjzXf+bzPLwW4IUryI/7H8i9xfQfPha/aYug6Iwek9AWvWO2+4AvMHQP8hA967oW5hj6+X+IU5bMKxo6UAGBi2s7t/rUoaHwPj0QiTM5CfVQ/Y/OmWQnZtw6rh9hnASUw3vJmE1bymROmjCCKaE68AibLYl2SslOniCnu+hXXw1fmF5J6Zc27jXUsGsYlO90TcWEL9ZEpXNWHMnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w0Y8d3ntGO3MNIs2Ic01pjAZnZzGsP0LxlumnMyBso=;
 b=fEzbv9AUb6z42M1e0bMDN9r9IisidiqaWY1c0tBrr7+lYaIzhviAFwhXY8KouYiVrYCpvOMTT7HbATZVmzysXbKTYFYrdsRH6l+F6VoRhAV3D5B8bU7mwcw9YYIsxSn2ka0K+jnBtPeIXKsk7NhJ9ywLAB8MRihAMPz58Dm/Gay2a5iEV+EPBVCvNg3qE5ldeQScT4d5kMcQLpiaNCCINT0oe8eBfJBP1hQoXqAeyKexwZ9k8rS0/lW3oNNQ8N6m1Ed2E1vb/kwT5ZGeT6PQOxM129SLSC0497Fb4iun4n9+Jy9TBC6Rq7U5VvIN202EBvdJX/q88YZnYf2M4s4xVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Mon, 26 Feb
 2024 03:32:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 03:32:00 +0000
Date: Sun, 25 Feb 2024 21:31:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH v2] drm/xe: replace 'grouped target' in Makefile with
 pattern rule
Message-ID: <q25qxtc4giekwmmhinqndc6kwvob5hzjamwmeq2mmlikony6ht@f7olml3nfugc>
References: <20240221095556.1635644-1-dhirschfeld@habana.ai>
 <oq6jinj6fobwbqtoe5mhq3uebcqim7rc6u37tvj27j4oaqjmfk@5wzgbsobqtiz>
 <5h4x7ssbrvxklvpqm5cedhtl44so4inctmytly4ttlv5m5wjys@c2zki3kp4jbv>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5h4x7ssbrvxklvpqm5cedhtl44so4inctmytly4ttlv5m5wjys@c2zki3kp4jbv>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b18b6eb-efc3-469c-dbdd-08dc367b7dd2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaulsgP0t2dpkMX+NzZRell+ceid1UxFNQvbTRMvKUPgWfQvZSoIEUYAfYTPOPUjz+Knzd9DOAzaJqawJ6jO7p0afzHmkkOjD6wrxYzF3Rte/XR7jZyXq1B9Koi1plbj6wcFRMED1FBMWHCYRaNrKQVI/is3WsNejVy5u61ZnNvjkL5W14P1niayfggq2i8EiKugQAZO/T6H6FyzA/Qq8y7SQPm1e8MeQ6T4pvA/TIaRf9U62RXsm+8+iqZoktjc5ln035cteXcNWYVImGDdUcXiFHRrCGBiapUJdJ9fcJVRAC53ATTfVXmJIfsjDMhQigGL3+4NaXW4pl8MMNdlUMCVfY0z2zNbz1b0izeyy9wRUdOMUf2hXEnvu83rue3dD0SwHOHzikdS5SwIj4gC9hiXtB3csaWiv8qJ9MGKakN6W+E2/SEImUlQMI+3TwKHTc2WZDZ1Gu91FvY+QNc9DhAgtoG748yUQ5OT/8n4Ug9imcjhx8UJP2Mhx6nFXvTWdRF3g0iS0KqUfE8qzFkCHAjLSYCSSHSw1GICMsXEbIVhshGAOaYVbhuXXs9wIX8ogw4KY0+zF/CupTVxAKy+BiAp1sKVQq4OP0zHlx/CUeAK+BuvM+js55PIvfqNvM5k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVUmtK2JRTsoivM/4Oyqkfl7DFqC0MZoU7Dz9OR8yVWlkZKroIiMXAAPHSNG?=
 =?us-ascii?Q?gg+fM3MsBTRWuLnPjPLxtw1KnuPRLa/QSiKCKD5/OnB2BC8AsekHvzz5n8ur?=
 =?us-ascii?Q?z082azsJnzX/dN4A2uzpOYirHi2F/0iKKVZE3pWmzGE6tHtshgN4s5l18nPL?=
 =?us-ascii?Q?19GOYzikQlO4Mcwj7PYTtkp5+yeMoZ/meNt5ewqktI96yRqhIFy1oDS57rFd?=
 =?us-ascii?Q?YlFOwrKEwPl3eQkKuKXq2YzOMRhbPbIB2yYV5Da91romzP+/ERVd8IRasdlr?=
 =?us-ascii?Q?E+Qd6Xy8UtVHqbynaps2/V0TZR685DXn3ncmey+xi/wL7121FXYKZbaawwLP?=
 =?us-ascii?Q?n8wise62HZ2XebubriSGAWNCctlqngogQv/DGkrWa19Re/veuZtSKLAgEUjA?=
 =?us-ascii?Q?ZKvbhy2w2rB3vO4AXQmuUkSSiLTHLmgSxX3cO/1BBvYCD0CVCBglnTpxvubI?=
 =?us-ascii?Q?E184sQAXR5rZ6Xhk47jojsom9zLv07ivT8IsUZ7Hnr7erZe6G4nhQ/BVzwWY?=
 =?us-ascii?Q?0V030gL0VLgn+wKsRZVdjo9KL/Z0T7gjq4/8V7NxNClcyL37l4nph7GhsCgn?=
 =?us-ascii?Q?TVGvlVZ4lFABluCR4T1uUrhgEGebV60G+5bZLzamdBIAwsTbdE74Ww9CCtub?=
 =?us-ascii?Q?kUfgH87p4+mllySYkqTm3CCasNx7dNBjD247QdpS9rdiuQHV8WPecwZmkSe6?=
 =?us-ascii?Q?+Gl8wMJs37rgjJfgwV2KgbST55Nl0SrmjdsWPGUsjXcuYoR/kclQAyhnwCII?=
 =?us-ascii?Q?YYEdLAPVSWwlgEMRFo6Zb3udWhcuQNQoM6FrcPTQBxQnVKAzbERfJ8cK2xM3?=
 =?us-ascii?Q?SA/DcG+kK+ZdDchfOAlWDix6EGORQzFoekU5o3dSfFXDev+LhwY7XJeSWBRg?=
 =?us-ascii?Q?4N1wlcGZZc+4AnAD4SFjxjIOdzXdecWMRrubSlWXmwWbc7BAxiMWpapfdZ2Y?=
 =?us-ascii?Q?BTySZpi7wpGakeTUDPizEhJ4F1q5MIUbDReNFjDsjC4oseS8aiHyMOT7JLSL?=
 =?us-ascii?Q?VEErz37no8O6+pZuNLfayZDbTZ0DxyNPllIA0MpYyIEVuY3uQnVy9pzPeZwb?=
 =?us-ascii?Q?2o9In9dlWhtejQfBMCiYyFsXqqE9C2Yh4AzbZX00vadjAzQdAWTP6npqqYXd?=
 =?us-ascii?Q?GsNGrzas4FJ9Gp2p1tEUVzFCiBT1qjFiVIHz8KRMteUEVyOAHF0F5HLoPfs6?=
 =?us-ascii?Q?R8Si8/pYRIdvSG3379j5gIuM78wyRaSwumQ0Mtliwr4OsLZnu7HqLXbmfzBi?=
 =?us-ascii?Q?qyl8zh/TBGqEVm0jHy35+r15i9mykdi587c7tcOzhUBWewJ3dgV7k0jrPcpX?=
 =?us-ascii?Q?lKGzfoCfRgTbffKGzGgGr9q0oCXHWUZFqJlJpebuqiUe+vqfqrSCXymDW19N?=
 =?us-ascii?Q?d5lm2ZECqiqHRmfS6iYOa7Q04IciHXw1dxexyZd/auWCtr1xfZHAPKxEMjrN?=
 =?us-ascii?Q?GOmWh9+tIew2Kqm2X+mXs9smh2UmvXOszwQdWiwtR+WQ9HLzKZUYA2yIIfdU?=
 =?us-ascii?Q?vZmepallNnD/txYOh+JJ+MJf3cZoiQPx/HJJuk63ku+L7BpnlacQ5AXKCPpB?=
 =?us-ascii?Q?V88rY8UoM+6ZdsldCoEk5ntRBpE+WxP8aHGuEKHz2aDBCUr/z/8bRE6z1vOh?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b18b6eb-efc3-469c-dbdd-08dc367b7dd2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:32:00.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOhnb+lQ/wXZ/SKsefUxV3WNgGwDTtiBTAFNu4J9qqr2Ef48sIIHMkS+KV2Jghaw98pxswe7M5PyLOZfusfJSntPgnxxDdp+MIO/RTXoWCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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

On Sun, Feb 25, 2024 at 01:07:08PM +0200, Dafna Hirschfeld wrote:
>On 21.02.2024 23:49, Lucas De Marchi wrote:
>>On Wed, Feb 21, 2024 at 11:55:56AM +0200, Dafna Hirschfeld wrote:
>>>Since 'grouped target' is used only in 'make' 4.3, it should
>>>be avoided. Replace it with 'multi-target pattern rule' which
>>>has the same behavior.
>>>
>>>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>---
>>>v2 changes: instead of removing 'grouped target' we replace it with pattern-rule
>>>here is v1: https://lore.kernel.org/intel-xe/20240219135845.1463992-1-dhirschfeld@habana.ai/
>>>
>>>drivers/gpu/drm/xe/Makefile | 2 +-
>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>index c531210695db..64903841fbd4 100644
>>>--- a/drivers/gpu/drm/xe/Makefile
>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>>>quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>>     cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
>>>
>>>-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>>>+$(obj)/generated/%.c $(obj)/generated/%.h:  $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>>
>>that means we can only ever have generated files for xe_wa_oob and
>>nothing else (or we would have to change this line too.
>>
>>did you see any issue with the line I suggested?
>
>I checked your suggestion:
>"
>%/generated/xe_wa_oob.c %/generated/xe_wa_oob.h: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>"
>which works as well. But the doc says "Always use $(obj) when referring to generated files."
>
>https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#custom-rules
>
>So I think we rather keep it.

humn... but % at the beginning is already globbing it.
Note that the syntax I suggested is the very same used in /Makefile:

	# This exploits the 'multi-target pattern rule' trick.
	# The syncconfig should be executed only once to make all the targets.
	# (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
	#
	# Do not use $(call cmd,...) here. That would suppress prompts from syncconfig,
	# so you cannot notice that Kconfig is waiting for the user input.
	%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
		$(Q)$(kecho) "  SYNC    $@"
		$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig

Alternative would be to use

	$(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h:

... that should also work (although ugly), but since the root Makefile
skips it, I'd just use the very same pattern.

The syntax you used is wrong because then the rule matches any 
generated/*.{c,h}, even if the file has nothing to do with oob WAs.

Lucas De Marchi

>
>thanks,
>Dafna
>
>
>>
>>Lucas De Marchi
>>
>>>	$(call cmd,wa_oob)
>>>
>>>uses_generated_oob := \
>>>-- 
>>>2.34.1
>>>
