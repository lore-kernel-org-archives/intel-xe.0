Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B3C53214
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562A10E789;
	Fri, 20 Feb 2026 05:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFqVQVxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3A10E789
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 05:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563890; x=1803099890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mfet14Z+AbZShdjO0aoC+EHnqZjlhYpO1w2hpl5scqU=;
 b=DFqVQVxwzLQ6lUZHFDrq+e0deWYCgcUxDWZ5yjm60HBFnC26pP8CtKFe
 6eLD7kafC3qEK3yrZImLqsp8QIEbNBd3Hqpua+au7w0JSiaGjI4ho1ufY
 GFZbfSnfYnclgx+eIYH9Qz21DP9bWUzf/TotDO/uDDcX7xwBF4ugJC/Fn
 1U/obLzJz/JW1w8PIOItS2D9EzJwW1HpnR35DxCFFOSPxnv0SPGfod6XJ
 E5ekM5gQCt5gE09DQlN8ZFUAYNvLhOSEcWzkuK8ttu2e2sxVfjfxK5rjj
 NWWFmUVGol+T0Eb5JU60QHRojf0mZWgX6Nai2vvxmynzLuhV60QP51MpD g==;
X-CSE-ConnectionGUID: 2MlnxKmPST20uN310uKZ5g==
X-CSE-MsgGUID: +IqjXoTaRnGyiZs7+T4b0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72360593"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72360593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:04:49 -0800
X-CSE-ConnectionGUID: 5XvCCIcyS6+iifYXkA+v5Q==
X-CSE-MsgGUID: u5UH10YcR+2Oi0IzBFZVxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="213347992"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:04:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 21:04:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 21:04:48 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 21:04:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wus5CeenQvtVgHJkLPZP/7Vk4N9H3YFDPep4vnngs9gYlhATQuUi1CAtUMf3TiOQISL6hkeDcLy10GZOQbhl8kCyY8n3ZZNNhPBUCHD1xUdSzDlTnQmfXI0FT/M3ISwVPyO7KzTQJv4FrPmr3joUibKfG45QJPEowlZ5oEAj1w6AbLqRL95BNp7nyMyE/aRH/icGx3HIVeH0bDuinsoSRpT42f6UIPQGq3NF/ZjD8JJgDaoWiXaCQDoF0II711m5of9er9lSiTgv5nrnx7+J5TUVvQ5C5jDPbAawqeSIb/AbTibG5kIPFq+IL/O8qZIB/RpG8S8OdjYELytWexoV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDICwrNjHpz6WCfZMja3jaI1goG+Radcv86JY+KUZ90=;
 b=XnSJd+veDmwLz91heZtntE1FJC0s9Q6hTxYSwInK8cZBjVIVL6n81BO1VdANODlpsEGuDFyacOa9zaEKBhuIy0/coFQ1TSwB3QyosSts7ST9N/jeFGhXqESBcKTtevotKYD+B1VoJISKrCP8pbe0wZtZPwr7tQ4Shk0wUB0EaQL0qNIYNiTmLmHjij9jWYdgdvYrSWMpgBQndcnEhYd/6FgL1JEYZB7+PJweE0uHBCHmwOpFShYjdXdIvcUt93l2c18qTQD6YONyNAzkfFx8UL+oDlYCfQvRwLEQpGTH3L6eENGLUy8QkDpZw1VSZBXmWvwfl774cVY1G6KS6grMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 05:04:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 05:04:45 +0000
Date: Thu, 19 Feb 2026 21:04:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aZfrapNUURrx5J7c@lstrano-desk.jf.intel.com>
References: <20260220043502.1060473-1-varun.gupta@intel.com>
 <20260220043502.1060473-3-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260220043502.1060473-3-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:303:b7::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2f99b7-de40-48be-fe40-08de703d90af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MG3W/4zg9j+uo3Amhs1evaOq3Mz48u8cwgLzdpsPnbJiDeFZAIXTIxkvwn+d?=
 =?us-ascii?Q?yZfQNAJ/DZlZ9tn2DbUfyFIYyJGPTzEoAXiiwrzlQ4OMDPFiL33W4AMNO4WB?=
 =?us-ascii?Q?Ipy17uaQ7QvP0f+H0mL3y7hl7XINq0J263g6Lp/qoPeSzypFbJ8OO+R6Bnqz?=
 =?us-ascii?Q?Wg6Z+OuGdMndXv6tnIbPKvZD6y0xLmAMjO1QxhGJAsikbJ9rDQykmRZ7Kk8u?=
 =?us-ascii?Q?yfvAtT9IfnKx3dGjy9Di/y7KI58tBdDQSlQirOIyBSi0BNNZkG7qKHaxTN/X?=
 =?us-ascii?Q?VgCdCeXw6sL3JwBD9Cfdt6ED5MeiZAIV5V3kbdtDwPlUFZrSB+yXGNn0Qc6C?=
 =?us-ascii?Q?VjZeCTPTIk6sKFyw/2+8zFBlz9mWtSBVneGSOO9h9S7R8by9uh3sT8bXkpkX?=
 =?us-ascii?Q?Kzh1IrUPT8EiNJKvZwjOSXALbGY6vR/WBQH9MUAx3P1hSAxte2my6gN9QY7i?=
 =?us-ascii?Q?PJL3z0NH3L2uIxdfSqw6yoNMmaIIGzBy4p1mXf5Bbqc/0yJCFr3k8Awgzv+z?=
 =?us-ascii?Q?T8dpqKd8sO4YtghqCKZey+R/zlNV3VyrlFe0UAHXSLLuG2AvY6EQJ6+3ZrcD?=
 =?us-ascii?Q?w0TAwnJ31kVh6L1asRL2+vbDggaH0ybjExqHyi3v2or2gpGSfpvb34SAJ+Q+?=
 =?us-ascii?Q?HaIXpPbKVDX2KyaPnhBcQcgAuFDYtQYxdAOS5vLw7FXaLVeFQm/dFWdaBgPi?=
 =?us-ascii?Q?3swNVqMvKWM5xlpdaszolyQrcDrriejyq4gX0GTf6n9p7AV9b+JWeyAYzSsZ?=
 =?us-ascii?Q?8YzdUOpt7+bxaKCLbz1tKAC4Ac0iPgDfHAIJfenY6HszWT9IjlcEAiE3nNjE?=
 =?us-ascii?Q?p5Zs8VPtsNptVC+qRjAlO+4thnOapjolS0AAyQDQ5t5z7yHimBbk5hAsZRlL?=
 =?us-ascii?Q?Y2WwhKqJ9JqqNVsLh3jtmdOEMjH3aVOv5n40uxPt6X005TW6FyrY52ayqfur?=
 =?us-ascii?Q?Zr4ihc+S6TiopvBQOwY4TwhLbB+8/vBkkUlEdbqeyhkCYW6cRhgKOSCV58h4?=
 =?us-ascii?Q?NietmiAPsNQ8w+ZJci46RGNqNNIGh+4dLwW/Drv+d1EgNIDGn+mdYe5HM16Y?=
 =?us-ascii?Q?bWwTZEd2eSKGggvO2QJDDFXgvBc4jUVD5YMR1xkGHHYjzfwPsuF0cNv7O2el?=
 =?us-ascii?Q?RhZcce63+AIMnmgB9uKPM3quCMc44Tq2vYtbDHib0G+qp3Xcux3uAUaQKs7+?=
 =?us-ascii?Q?GoGubzkE5EMnaR4OEX85ihbERPhVLn7HCE3s1wt5Ghlbcn1GYsuNprySVesn?=
 =?us-ascii?Q?M/4+jF7gAkfBG6bvqohkH1ne0LdoFcBi0/wSF+isQm886+lNFUecPo/ojAzI?=
 =?us-ascii?Q?HOT5t4/ANWf7XybGoCbG3MA6VKqn4oV4/j5FwVusZMGAEi/xCAMXE3pt/diY?=
 =?us-ascii?Q?j/uYU06OQatpzH7W/6qktO2vAqfaKzckHJcElkQaoKeO5HJyN4hAst2KLMIy?=
 =?us-ascii?Q?9SdHbd12q023Z8LlmgZ+MyUknnvUCMG7l8rwFB5MxKlNaViiGkJACl7v6WJc?=
 =?us-ascii?Q?f+iGkP1cZCOfy9gQN3ZVwvvMK7EH5fVC8q6r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WE52hVtlHWKiLuEWtAuiecXzbOKigIr+zw2fSxPrE1cTEN+b6P3UxmS4z1DX?=
 =?us-ascii?Q?U444URzjK1Hgzwtt1FnQ2Ge4PSrZaT5+QvYgx/9aXd9W1o23hKPwcj8KzVAz?=
 =?us-ascii?Q?j7nAsAFBqDIm2ZsTKJNi7cRo9Ym9OUZ6/TM1OolJnZdGOXIpPmgCIiEAP+jE?=
 =?us-ascii?Q?8XCuHNJnOHootq2L9/CPIOXBG9fxZSawPdGBENHxI4QTQgbCbIwqkGPdk7AV?=
 =?us-ascii?Q?qEIzygUzmfAvQ9Vc5pGE3f6Jd63X6FFz8FwTkh+Mn2kG1bLVJgYDD2D4oo8z?=
 =?us-ascii?Q?k9pBheygmPH66HoCSOwSFcNLD0ferGSn//5v4wRAot6sb28zMLFJb2BbbFk2?=
 =?us-ascii?Q?p8oq69kZ1ixOl6tmZRf6LwZCzDfcnNMQdULI5nUSvG9Pp0cJkEKZMwxrSz9R?=
 =?us-ascii?Q?00fy7D49nTdNCEpZdaP0wvFjQ1FdKoSf1DAXxDk+es2NTWHEirASu+0MGp7o?=
 =?us-ascii?Q?z1novQw40jhsDRoxKBxjFXw9vM0utSksieR2P1Sgs4f2RUBZfcdAve3o1O5s?=
 =?us-ascii?Q?w2GtxWerIoYta2LsXEFP8mN7rA7mygiGWMaxQOAFsR+3n0invlFbWHMwvbQ8?=
 =?us-ascii?Q?5ohKrIyWFnaY2Ux0D+k6NrRbLbLC5M4Un2nqGYJYSVTygY085zSG6K/jpkIz?=
 =?us-ascii?Q?59u97aoxS6VpfqA7gZTGrcfNrv3AQfw8izENWll6VdYSDQcOVQM8n8awfOuz?=
 =?us-ascii?Q?jsVzpfg0xeCtb/Nr3LLyjt8kk2j3SZxTUcdrujMUMR/PfTLGW8A5Z3gPofYp?=
 =?us-ascii?Q?zFZ9hE3kXdTav5YbsPF0aO+hCr+Ol/yNUrbUqkBf1KZ9kVHhK/ZiXR580jL/?=
 =?us-ascii?Q?lyxFENrWysLHnP2/cvRGYP3tivQzAZEUI5+Od63mhOllwtXARYACg0dgfewr?=
 =?us-ascii?Q?z1Ftd1ElruQ8X33mkPJhfMvHGs1ypOF8RiIWgtwb3wdPJ7hG7/fPmKTM5eQu?=
 =?us-ascii?Q?jo/JvsTLW4Zl5RIZHuU4aXbg3PyQocm0AMgS2H54cqgJzfyziBoR2E9zJmXm?=
 =?us-ascii?Q?DpKPkcsIdYrx9YEL70wizwDoVdqaY9Ju0Zv4mVDGWlbmLI0A+S40i7c5c3Px?=
 =?us-ascii?Q?GceO6wmVbof1NSrVlYU3j+t+qjiUKn64Qdd4zW/HHeSVAW67cB0Uy0h+Zhyo?=
 =?us-ascii?Q?tbsWPl4f9tcEz4mxEB6XJsvEi+qAL3W1CL9N3DS5SDeDdkKfHb6ioH7Eoy4N?=
 =?us-ascii?Q?VikaeHcF8T0cWgEc3unSTBLnW+/rVmy0AA3WWsa9D4y4M2kluieWszUIM8D+?=
 =?us-ascii?Q?ZhlrfzZegASog3jcSLBqnitY7nC8F3YTZ3xU7sPfuw6R5Fb2tTrBqez8QFFG?=
 =?us-ascii?Q?FAkpSegTvLCcLQi9ezxem4b+rMtxOK+q2ZFLW5zb6iWU43Hf7YpBgXuZRSHm?=
 =?us-ascii?Q?h6dchM9kUXneJxS4k2mwefeNvL6Vy7Qaz2HLC9B+bZNXEeFbonnq+K2wdWm/?=
 =?us-ascii?Q?lfwfatdjR5RSNeA7GJcvzxIEFIWvRp60vzC20pfgF4rWMcIkmFvoXbFYduu3?=
 =?us-ascii?Q?z4dQE5ejm4lycSYC6jO8y9j8LKEKjX0qWFRvU5uqPA8KXz6noTpsiHiIQscJ?=
 =?us-ascii?Q?xJGYQ2TB8dWtGBtZOAniMl2ZOI/umF17w5+PbX8XvRbEqoE7zKskUSM2nfOy?=
 =?us-ascii?Q?JGzqJq6Eh5heRYofzz/vEbOY/T7O8A2WdmaB5LwRfheFvC38Nb9lX5BMSK+L?=
 =?us-ascii?Q?BwmMEO/JrQILVUCKJo13zP3Z6yAsOhPXX3z6ZsPC8FaielyjhY06xN2HzuY9?=
 =?us-ascii?Q?Qt24kHFUCIs9K1TORFYaMZ4mcXhTpmY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2f99b7-de40-48be-fe40-08de703d90af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 05:04:45.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjHCZL8WVLgqv7vdIm2QIfOv8dGwO9l7hCDveaSFz6CS2vVDJK/GcgnUMjTRGNPuP7sZmLJvIXJWI82KxCniug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

On Fri, Feb 20, 2026 at 10:05:02AM +0530, Varun Gupta wrote:
> Xe3p hardware prefetches memory ranges and notifies software via an
> additional bit (bit 11) in the page fault descriptor that the fault
> was caused by prefetch.
> 
> Extract the prefetch bit from the fault descriptor and echo it in the
> response (bit 6) only when the page fault handling fails. This allows
> the HW to suppress CAT errors for unsuccessful prefetch faults.
> 
> For prefetch faults that fail, increment stats counter without verbose
> logging to avoid spamming the log. Clear the prefetch bit on successful
> handling so it's not echoed in the response.
> 
> Based on original patches by Brian Welty <brian.welty@intel.com> and
> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> 
> Bspec: 59311
> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> 
> ---
> v4:
>  - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)
> 
> v3:
>  - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt Brost)
>  - Move prefetch check to caller instead of inside print function (Matt Brost)
>  - Remove XE3P_ prefix from prefetch bit defines and add platform comment (Matt Brost)
>  - Show prefetch bit in error messages for debugging (Matt Brost)
>  - Split stats counter into separate patch (Matt Brost)
> 
> v2:
>  - Changed comment wording from "repairs" to "handling" for clarity (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 18 +++++++++++++++---
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++++
>  4 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index a33ea288b907..bb8f71d38611 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
>  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>  #define PFD_FAULT_TYPE		GENMASK(3, 2)
>  #define PFD_VFID		GENMASK(9, 4)
> -#define PFD_RSVD_1		GENMASK(11, 10)
> +#define PFD_RSVD_1		BIT(10)
> +#define PFD_PREFETCH		BIT(11) /* Only valid on Xe3+, reserved on prior platforms */
>  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>  
> @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
>  
>  	u32 dw1;
>  #define PFR_VFID		GENMASK(5, 0)
> -#define PFR_RSVD_1		BIT(6)
> +#define PFR_PREFETCH		BIT(6)  /* Only valid on Xe3+, reserved on prior platforms */
>  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>  #define PFR_ENG_CLASS		GENMASK(15, 13)
>  #define PFR_PDATA		GENMASK(31, 16)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index d48f6ed103bb..0cb68e956af9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -28,6 +28,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_ASID, asid),
>  
>  		FIELD_PREP(PFR_VFID, vfid) |
> +		FIELD_PREP(PFR_PREFETCH, pf->consumer.prefetch) |

You can set this up based on the producer data and error.

I'd like to avoid touching consumer fields in this path, see [1].

I think the logic would be...

u32 prefetch = FIELD_GET(PFD_PREFETCH, pf->producer.msg[2]);
....

FIELD_PREP(PFR_PREFETCH, !err ? 0 : prefetch);

This is a better logical divide as the producer is the one who knows if
it should set the PFR_PREFETCH in the acknowledgement - not the
consumer.

[1] https://patchwork.freedesktop.org/patch/704579/?series=161560&rev=1

>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>  		FIELD_PREP(PFR_PDATA, pdata),
> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> +	pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>  		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 72f589fd2b64..b05860b3607d 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -261,9 +261,21 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_print(&pf);
> -			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> -				   ERR_PTR(err));
> +			if (!pf.consumer.prefetch) {
> +				xe_pagefault_print(&pf);
> +				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> +					   ERR_PTR(err));
> +			} else {
> +				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> +				xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe, prefetch=%d\n",
> +					  ERR_PTR(err), pf.consumer.prefetch);
> +			}
> +		} else {
> +			/*
> +			 * Clear prefetch bit - only needed to suppress CAT errors
> +			 * on unsuccessful handling.
> +			 */
> +			pf.consumer.prefetch = 0;

With above you can drop this logic.

>  		}
>  
>  		pf.producer.ops->ack_fault(&pf, err);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 0e378f41ede6..23a6a986d5b2 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -84,6 +84,12 @@ struct xe_pagefault {
>  		u8 engine_class;
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
> +		/**
> +		 * @consumer.prefetch: fault is caused by HW prefetch.
> +		 * Echo in response to suppress CAT errors on
> +		 * unsuccessful handling.
> +		 */
> +		u8 prefetch;

This will grow this structure from 64 bytes in the page fault queue to
128 which is not desirable.

>  		/** consumer.reserved: reserved bits for future expansion */
>  		u64 reserved;

I also we like to leave this u64 reserved as I plan on using it as
single linked list of pagefaults that come in a storm that all match the
same address [2]. This is reason I'd packed fault type and level into a
single u8 here [3]. Maybe pack prefetch into the upper bits of the
access_type field?

Matt

[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/93669c7f4e00ec13d0a18e28d34dfcb41803b7c9#d0e961d15e218e9be8819f1311674d537b25ebdd_91_109 
[3] https://patchwork.freedesktop.org/patch/704578/?series=161560&rev=1

>  	} consumer;
> -- 
> 2.43.0
> 
