Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972DEE57CE
	for <intel-xe@archiver.kernel.org>; Wed, 31 Dec 2025 01:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09CA10E0F7;
	Wed, 31 Dec 2025 01:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1TwLIPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6910E0F7
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Dec 2025 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767145894; x=1798681894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ta5Uv6VTISgv+S7tAmndXS6rF3QO1N4jNFyYQP1Ms4g=;
 b=V1TwLIPPlDQPIJDzARAj4bHmEL7v8Llnx6UnKIlL0ypV3IjGeGa9nzV8
 ePGUWPh2u2ffrmct9rCV9U7sSbaW2wa2AHbR2n8xspGbsSfFd0oO2/A99
 QSEkBYLN03+rgxE3R6xpxHXp4k7Ilm+eOG/ZWwsRzMzOOPQth6iKMyhfu
 pVozaXX7quGEkjDI2ZRYzAys1KmaLYcTBmKEAJaGmctria3Z6N6cdC28w
 wK7BgiuFVIZmGYZb9JcE/R1L8+0dyiE7J5AUivcO0Ll86ZFCplnYCLoaR
 GoeITe8p/8IncEQ2+qjtqh8x/rWJ0H49NGBLa5tpE70kHNZf7WDAjaGUP A==;
X-CSE-ConnectionGUID: p+xIs7E8RjiHHf2AVQ8KiQ==
X-CSE-MsgGUID: N1rGMb7mQ1K31ZkOKb75aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="71307861"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="71307861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 17:51:33 -0800
X-CSE-ConnectionGUID: 7gPjzqelQiqStrbNC9vR5w==
X-CSE-MsgGUID: 91J5FvSZRCyIeDLQW9XVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="200546482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 17:51:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 17:51:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 17:51:32 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 17:51:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgCzoDMyQsqW3kk05cq7Qi2WwkRE7IHC5VQou7IBPpYGJCoV/ExJ0c2DQIqh43G8K3Ho8cJfPixzMIJybA38ybrnrkaelPG1ZxRxRc8pT+QiTUBdOSyryg9A8I6hcKLlRd3VV7hIbCk8f5NuUa6ZITQJhsDbPYoo6dAgATOOHp0IiIG2de9ss1vebMSg/sBc6J0ScC3kSH81IgiqhqHkb6YS+ZcioLCBq3hAzbkRmklpO0aiHFB6irX4/Z9kkQfcYd11ccTTR3jClh7HgZZau2B1oqNnc5+ei9DIzZkyMUtO+EPOX/JYub6CndzTHWVkxgGiCZvDG7rBtTKfTKks8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++m70QLbtKUteK2Kf4znyxKjg451lkWKKkHi+kHIDJk=;
 b=wl41JHvjSU6XGjNYKKLnbh+W/ahPcqdNxg4Mxxz7dDjYadmo+DmU47Sf/F7PuaBi6rbfHUs+c8a2Ynyg/K6FoP2xWuRNUVUNmqq/uZf60gJtHxj3b5RbxPZA0n0qAb00w1EsciqO60q/bZm7ZmUTjPRa3wjnZk1GQVCmlbigW2hCwFWW7tHjAA1A0e9xlWRgjg5ymRRJqdLwcpfyA9l9RebWQDPSHZCLob0cXCRos88THEIvk3ciLu/swmjz2N7PUOWYPWvfhUuEOhMkGQNlAaBnOP9por4BEXXYQJX6RfSNcGOtU5vnXtOuGyQBi8oYoz4IWa88W7D2l+lKMzw9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 01:51:28 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 01:51:28 +0000
Date: Tue, 30 Dec 2025 17:51:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v6 15/17] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aVSBneeXYMPn7FJZ@nvishwa1-desk>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
 <aUW-SeH7NnRoN0AM@intel.com> <aUXTSR3snBJBTrO5@nvishwa1-desk>
 <20251219225333.GQ4164497@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219225333.GQ4164497@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: d70f4c2c-171e-4f7e-2bcc-08de480f1d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JQME7/giMfbVQefaNjMqcCG+PCEOqaE2wPBlWJLRBY3TumU8hElOseRv0qnU?=
 =?us-ascii?Q?Qns4W3E9rmT7KmxkLRPUKkvWod7p6bucRRpbhRaLigQC1UcZwZFyGe2cC2Bx?=
 =?us-ascii?Q?cFOoP/K3AR8abHUQIuj7vDwHzs9T5/ew7tZPVbCHDPUVdx4cJvNVpbw5UZUX?=
 =?us-ascii?Q?xnEH2K+4cMajMYLcFXrD1jAOqWCQZrPRwDkNJWaR/y4KFrV4k5XAcX344YOg?=
 =?us-ascii?Q?8ZulLNpVbJc3b2TBrTs852YTGBoM7cZYHaGxP7ZeEjuekrYtMOgphLQo8g85?=
 =?us-ascii?Q?7gUhEcsQXGO6cVtugCOTABCOWj/lUzlNBjt8x3siQKuL8Gf2Iqgb/IXslMTe?=
 =?us-ascii?Q?AuFwpDv84eK8ryq6aeCu989p5M9tEYBQZlcFWoN6ZcwvGhHSDvoUFCaa3rKM?=
 =?us-ascii?Q?XlI8YcyKHDt9KPyzMIvZNUd7jtC54l37JAOs9noCUzvMHDPPEe1ucviuZZL9?=
 =?us-ascii?Q?NE8K/UXPpPcw6HjMTK9S2jim8m52TzTp36KqGSfs7WjpeeG2KEnoBUNm5HxD?=
 =?us-ascii?Q?WX1a5miTV8wQQk8A61b6tBsImHN6zEdPV+CyIFQU22cd63+zi1ZQC3X06nbn?=
 =?us-ascii?Q?5KM0o6ZqRCns/j3pqoNjSOEYKhHYIoSvg8Ws9sqrOa2uebpnXQ5/J1uGyK8I?=
 =?us-ascii?Q?bQPX4HmFfFG5UEdfu/1q5jiA30K+vgusQMGWaGgJxEJrQCZcJ5CHSiN4dDn2?=
 =?us-ascii?Q?mLTZ7CDOHx+Dk53CK80g5+ZGGabc5C7dz+hUWeK4aoxQMrMfz3MO2WAblBsr?=
 =?us-ascii?Q?PjgGkW5bxOHKknRqKq2RLTaxtwWITmy2PSGlneW89Ip86xAPLDP+cNn9Jsf0?=
 =?us-ascii?Q?2VPa4+6/zwLFRLz1DNhsvw3v8brFEBk+Qb3WrCi9apJgl7SwmzgOHCokWWpd?=
 =?us-ascii?Q?OeOWUv0qHdaD6H9J0oLk1nDaEjwHbFxbRHfWGeSnYwd8qkOTGyzh1v0TaSsS?=
 =?us-ascii?Q?c7wJr3+pAwIRK+cuYO7Rumn2fnusUmE8vobec/w36xipZcNVlMWZ3vxC7PHZ?=
 =?us-ascii?Q?E2j6jpIsCNdaZjClTK4ZbBc6b4YDGG1nERPdtoFMSFYrXzIt0bmgsXK22plm?=
 =?us-ascii?Q?Tf0zaNBVE5eU6tqX4T8o+dbA7QUQlkdIarBJCjNuOFmGZRxyBJsCO2TEdk3L?=
 =?us-ascii?Q?QozF3g7FkijnTmsiOlNqk8OwkhPjhgTGCVJxty3sE3LkRuJeZw+aO9tvEJak?=
 =?us-ascii?Q?FpotXJHAngQoRllqs1lZLbd59GeLhoLyP7cdHJfzCOr/O1sXnwtlz8XaYlVz?=
 =?us-ascii?Q?uPKZ6yBxQk9pmiLE328f8631ZwLuVZWr9J2girb1TzZP7d106th4Hd87+zDl?=
 =?us-ascii?Q?7hgvQT/St7TMw4jfJf8hJ2j2SRWAO5IQmU/EcdBipEkjLalIl/G5qT33o041?=
 =?us-ascii?Q?Cxg5mcf11C6M4kTz+BOWrMaWjV/hDepTNgYkNsIf8Y2eoTJQiHxVgei6f700?=
 =?us-ascii?Q?vckKd1w6PnZVGyIU1G1SMuClqVGcEWJm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kgiW1FAxo9K1P0Jby8BpHcW9aYpY5s7tvPmQ8kRGj9BP1KluItqcq897Y/T?=
 =?us-ascii?Q?lGbTM8dpvzJSePPGW/S2nH6BRkfnGZ1fbQb2OOlo6exYEjI+C/BBHfDK1a1j?=
 =?us-ascii?Q?qGSt7yjP3cRpaLV3Wl5cHFUvpOJmBE/m4vrVlJbN9K3LtReNwLMszKaMbWaV?=
 =?us-ascii?Q?lTv8ejZ+ocv6hO7XCexVm8HFEUku1Qa1yvDq55fc7+qoe9BQrXpZaYazrl9V?=
 =?us-ascii?Q?CFmbSDJ2lWLGc6YoVmwvH7grEsdRGqxEUgCjgv2+Uo+CoMhCWJb5Uq7qPznD?=
 =?us-ascii?Q?FinidJm1xK/QWDk2ppW9ADEKsRXmg8m7J2irwLEPvbc+y+aS4LkkaiZfK3Gi?=
 =?us-ascii?Q?HSVVAAQ0WYMcNLGpSR7jz1l7lpCMzvTju+wpPxBhqjfcf+7IzJIf3nIkz69p?=
 =?us-ascii?Q?CxxqF+x70wI/vDv8PNBS7rNVuHon4TQPjxQimjts1vIod1axNmBi7SG/xU06?=
 =?us-ascii?Q?KibFMQH0dWqB5PN+Ge0jOincEDNnNroZOrxUwmcpGVVJnJ2kGNmKBPxGObV1?=
 =?us-ascii?Q?rVqBrP77VPlccR6Jd7B6E8Y/POi1/hzR2msOHhIfZaahe9+FCt+bIs2Ptt4Z?=
 =?us-ascii?Q?DID7H6dYPrJaQzYxL4nxRooKxwoLRTt2qDjbrlocRFOOZZgySO+ZrDOo71/3?=
 =?us-ascii?Q?pyK1RtUQzsGyPELCaUQkZB/K1MpNBwBUcNYFRLq/eut3vZu0pa6p86/Pyoge?=
 =?us-ascii?Q?bD2J/7rOoasgXygSL4gk7ZTUXmGX3b9GLB6kOVTeOCYlX2nRtwgEdhbAbBtR?=
 =?us-ascii?Q?Bn5NCgfVX8U1uU/MDdNRlx6zu1icnxqNH2vlK7PGM9Qa6ypXSHkjjt8osV/j?=
 =?us-ascii?Q?vesVGLvlFwF4uP8TOnj35MGfI4Vl69vmLYGkLuTLOGj1Ee2wp5w4u/YzbkD0?=
 =?us-ascii?Q?/LX3zyRLWXhXThyLn8dEepJnkx1o1CMM65rfE9abFWmkKvheO8LUaiLvWTXB?=
 =?us-ascii?Q?0/QZXiUCXNEAC87CmEsvfB5VH8D+my/yWBM5btTWt36XF8zacOwUNN+A5jPO?=
 =?us-ascii?Q?SiELo9oSi/u7VQU4WaOSlHBYGcwVmElskpotjK/qQY4uqkagedLCmCDMFwwq?=
 =?us-ascii?Q?oIlLkH24jb7xXo9th5VppyyaXbofFflBn8whV/U4iypkiWlU+zo4rFJO2u/s?=
 =?us-ascii?Q?6HlbniMFDTV3EoxF53m+BVEcM4ZU+sM9Y+oU2/H3RYTyhySBpB+SPp05cFHB?=
 =?us-ascii?Q?3tNS9mh71vH4w91dTB/KVv8onELnRd168tesPj4qW6iEZbf5JmlBt4g00Erz?=
 =?us-ascii?Q?LZS+4zxkarQ1o5zd/TYeGUeVCddNkOZ/pS6p3ltyKU+e6k76ZUqNxjTNX8vo?=
 =?us-ascii?Q?TISHCDjsWBiKpyHE0q2umB6UI4MWDeW5ef40fVOZ3NqSCdl8xWFW3giRq0QJ?=
 =?us-ascii?Q?uZ6stF1ewC6ucpNZIvHIv26WJ1+RnGkP44BFynQ2I5R8TURkKOgHdII9r5yo?=
 =?us-ascii?Q?qSmfGRAvec8ANY5IBqRf4zCPyHyAhuEW0mQfwx3y+LOLAxRYphqwgi6Ye3VV?=
 =?us-ascii?Q?UKWK7bNFR+aHoUf9Gc0DklyNbVrYt0mvjykklf5pd7Ko4yfM3K9XE1vUW0Sk?=
 =?us-ascii?Q?jUFKuNJTAc7KLr7Iawdmg9/fmoWJQBfEU5FVuVAz056DBLiAvC3GK+wLSuJU?=
 =?us-ascii?Q?jfRgHlzGZkpjR5dpPFg/PM5EIdIXrDWtJ73FBVftDg8aOVYXYCGtHQx+GOtA?=
 =?us-ascii?Q?BJUw7vRjndieL8elfRC+Bs86xynluLP7znqG8FawVH6hdkOkyF+SbyeDNbF+?=
 =?us-ascii?Q?ksCWKdGnNrSCRhI4se1LteAukB2wgqFDykeuYOjhAkAqh3r1z8uy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70f4c2c-171e-4f7e-2bcc-08de480f1d2a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 01:51:28.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf6Vo9tO3N1wrsQ6y3BCspMbT3TrjyWJmT0l1Znjv48o2WnMkWURnaaAVaLzZyzEU2ISo02H2JLMd8cu3yVBzZc7YUpHs3BwWJiOtdzqbDlLVYKIVuIWp9okjW0e825k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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

On Fri, Dec 19, 2025 at 02:53:33PM -0800, Matt Roper wrote:
>On Fri, Dec 19, 2025 at 02:35:53PM -0800, Niranjana Vishwanathapura wrote:
>> On Fri, Dec 19, 2025 at 04:06:17PM -0500, Rodrigo Vivi wrote:
>> > On Wed, Dec 10, 2025 at 05:03:03PM -0800, Niranjana Vishwanathapura wrote:
>> > > Add support to keep the group active after the primary queue is
>> > > destroyed. Instead of killing the primary queue during exec_queue
>> > > destroy ioctl, kill it when all the secondary queues of the group
>> > > are killed.
>> > >
>> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>> > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>> > >  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>> > >  include/uapi/drm/xe_drm.h                |  4 ++
>> >
>> > Hi Niranjana,
>> >
>> > Where is the UMD ack for this? Who is using this uAPI?
>>
>> https://lists.freedesktop.org/archives/intel-xe/2025-November/105779.html
>
>I think Rodrigo's question was more about the specific
>DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag added in this patch.  It doesn't
>appear that the compute-runtime PR linked in the cover letter makes use
>of that flag at all.  Is there a second PR that adds usage of that?
>

Ok, after speaking to the compute team it appears that it is not
a must have feature. Let me send out patch to revert this feature.
We can always add it back later if the requirement arises.

Thanks,
Niranjana

>
>Matt
>
>>
>> Niranjana
>>
>> >
>> > Thanks,
>> > Rodrigo.
>> >
>> > >  5 files changed, 69 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > index 7a498c8db7b1..24efb6a3e0ea 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> > >  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>> > >  		if (q->vm && q->hwe->hw_engine_group)
>> > >  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>> > > -		xe_exec_queue_kill(q);
>> > > +
>> > > +		if (xe_exec_queue_is_multi_queue_primary(q))
>> > > +			xe_exec_queue_group_kill_put(q->multi_queue.group);
>> > > +		else
>> > > +			xe_exec_queue_kill(q);
>> > > +
>> > >  		xe_exec_queue_put(q);
>> > >  	}
>> > >  	xa_for_each(&xef->vm.xa, idx, vm)
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > index d337b7bc2b80..3f4840d135a0 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > @@ -418,6 +418,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>> > >  }
>> > >  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>> > >
>> > > +static void xe_exec_queue_group_kill(struct kref *ref)
>> > > +{
>> > > +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
>> > > +							 kill_refcount);
>> > > +	xe_exec_queue_kill(group->primary);
>> > > +}
>> > > +
>> > > +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
>> > > +{
>> > > +	kref_get(&group->kill_refcount);
>> > > +}
>> > > +
>> > > +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
>> > > +{
>> > > +	if (!group)
>> > > +		return;
>> > > +
>> > > +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
>> > > +}
>> > > +
>> > >  void xe_exec_queue_destroy(struct kref *ref)
>> > >  {
>> > >  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>> > > @@ -650,6 +670,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>> > >  	group->primary = q;
>> > >  	group->cgp_bo = bo;
>> > >  	INIT_LIST_HEAD(&group->list);
>> > > +	kref_init(&group->kill_refcount);
>> > >  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> > >  	mutex_init(&group->list_lock);
>> > >  	q->multi_queue.group = group;
>> > > @@ -725,6 +746,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>> > >
>> > >  	q->multi_queue.pos = pos;
>> > >
>> > > +	if (group->primary->multi_queue.keep_active) {
>> > > +		xe_exec_queue_group_kill_get(group);
>> > > +		q->multi_queue.keep_active = true;
>> > > +	}
>> > > +
>> > >  	return 0;
>> > >  }
>> > >
>> > > @@ -738,6 +764,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>> > >  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>> > >  	xe_assert(xe, lrc);
>> > >  	xe_lrc_put(lrc);
>> > > +
>> > > +	if (q->multi_queue.keep_active) {
>> > > +		xe_exec_queue_group_kill_put(group);
>> > > +		q->multi_queue.keep_active = false;
>> > > +	}
>> > >  }
>> > >
>> > >  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> > > @@ -759,12 +790,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>> > >  		return -EINVAL;
>> > >
>> > >  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> > > -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> > > +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
>> > > +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
>> > > +			return -EINVAL;
>> > > +
>> > > +		/*
>> > > +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
>> > > +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
>> > > +		 */
>> > > +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
>> > > +				 xe_vm_in_preempt_fence_mode(q->vm)))
>> > >  			return -EINVAL;
>> > >
>> > >  		q->multi_queue.valid = true;
>> > >  		q->multi_queue.is_primary = true;
>> > >  		q->multi_queue.pos = 0;
>> > > +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>> > > +			q->multi_queue.keep_active = true;
>> > > +
>> > >  		return 0;
>> > >  	}
>> > >
>> > > @@ -1312,6 +1355,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>> > >
>> > >  	q->ops->kill(q);
>> > >  	xe_vm_remove_compute_exec_queue(q->vm, q);
>> > > +
>> > > +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
>> > > +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> > > +		q->multi_queue.keep_active = false;
>> > > +	}
>> > >  }
>> > >
>> > >  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> > > @@ -1338,7 +1386,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> > >  	if (q->vm && q->hwe->hw_engine_group)
>> > >  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>> > >
>> > > -	xe_exec_queue_kill(q);
>> > > +	if (xe_exec_queue_is_multi_queue_primary(q))
>> > > +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> > > +	else
>> > > +		xe_exec_queue_kill(q);
>> > >
>> > >  	trace_xe_exec_queue_close(q);
>> > >  	xe_exec_queue_put(q);
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > index ffcc1feb879e..10abed98fb6b 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>> > >  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>> > >  }
>> > >
>> > > +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
>> > > +
>> > >  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>> > >
>> > >  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > index 5fc516b0bb77..67ea5eebf70b 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
>> > >  	struct list_head list;
>> > >  	/** @list_lock: Secondary queue list lock */
>> > >  	struct mutex list_lock;
>> > > +	/** @kill_refcount: ref count to kill primary queue */
>> > > +	struct kref kill_refcount;
>> > >  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> > >  	bool sync_pending;
>> > >  	/** @banned: Group banned */
>> > > @@ -161,6 +163,8 @@ struct xe_exec_queue {
>> > >  		u8 valid:1;
>> > >  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> > >  		u8 is_primary:1;
>> > > +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
>> > > +		u8 keep_active:1;
>> > >  	} multi_queue;
>> > >
>> > >  	/** @sched_props: scheduling properties */
>> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > index 705081bf0d81..bd6154e3b728 100644
>> > > --- a/include/uapi/drm/xe_drm.h
>> > > +++ b/include/uapi/drm/xe_drm.h
>> > > @@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
>> > >   *    then a new multi-queue group is created with this queue as the primary queue
>> > >   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>> > >   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>> > > + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>> > > + *    set, then the multi-queue group is kept active after the primary queue is
>> > > + *    destroyed.
>> > >   *    All the other non-relevant bits of extension's 'value' field while adding the
>> > >   *    primary or the secondary queues of the group must be set to 0.
>> > >   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>> > > @@ -1328,6 +1331,7 @@ struct drm_xe_exec_queue_create {
>> > >  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>> > >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>> > >  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> > > +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>> > >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>> > >  	/** @extensions: Pointer to the first extension struct, if any */
>> > >  	__u64 extensions;
>> > > --
>> > > 2.43.0
>> > >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
