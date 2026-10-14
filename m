Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D6BC3DA7A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 17:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04210E1C5;
	Wed, 14 Oct 2026 17:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020710E1C5
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792000008; x=1823536008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6/wCdc5Uri3Eehxh9ud5QcO1TjoaNbORkLtDhg3++4=;
 b=BxfrKiJBiKPijJOOeBenK21TZ5W5AFWOxfFcFiu5+06TEmA3tmS+1+l9
 Y/jPkcq9SEdrhRHqoZKaa7ALhHBNRNUDoe9dz8MHUFyyHI1DaxX1XaVDB
 p5XWN0JBj1qP3KjW3roUDjY9DZpynX5uNEYDnNaeQjva1/lSQvUhg1HoO
 rNfNwvz95uAVuZ/f0X5Ks3IWcgf06dxjHOl1jg8a7ShvlFKm9FB1ZgCJ6
 pydn0L2fpiH16msk0Iy9JXdARmZDPfFdgLMWQ1/ijzJzTNzvWhLpA2VHy
 rS9Wra5ljRlJ8nJjgvzlVJrfeQj4gqf2wr/0602ce3LAJ42spYNSNVxTI Q==;
X-CSE-ConnectionGUID: VrNk6HJDT1ic3cEJt0hVHA==
X-CSE-MsgGUID: RjDSGd6fRoChOYtoclNpgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="763206"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="763206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:46:48 -0700
X-CSE-ConnectionGUID: 0gKigf7XTye98SUK+wx98w==
X-CSE-MsgGUID: 6Gu1rkfwQGOD6F5ASSLoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1374116"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:46:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:46:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:46:47 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNMXAMM2G2hmTtH8tcBKbYVVF9gvXaBff2EydHmz84Icl8r7y/DPHEaQ6yV4iX3R6aHoJYF4HoUXCjwtaqEOqh+NC6WEy34fe5Oc3fM8oa+/LjtVl+1ZplDzTb52sO/CTqQ12jYEXU9Rft6EbT3GJsgEhXnIPfWgxKk01nlc1yEMCGJ/k2DSE+gt+JRMTnQHfZcSzHT4TUybMMWSwb6rlSuu7GVFCNtjyoy5kUcZAhJqTNNzs2C3ZawYxkB9ZNaa5MAKb/YL1YSr03/8MeU2gZzNRB8ucOjJZMYrhzHVPjPPj21JMnkVhsFt5NCUrqFCRLIkwgrhigqfPXzFgxQ+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2t29sC0VF+5OcIzIJRmqy298X9TZvFsXDlXoRMZWEg=;
 b=zOM+9ZAPYY0hoD1cuNvecRNyP8yTc/PW9NRemnFEBX6jTClMfK8PCyw/NTYYLE3OEHqUYBocM1ywIdt3SxmKhB0V6qxHEelXc2e6HYtwBEOZePoj59Dk9yJUgPdp607kBzk9/cPNvvrGoQOyQFOEWdqliatlAJKP+Bn5uBrEfwVrK4jMukE+eSuGQjsSxWXusdVkO1Ne/7hdXT3pyNuJd3uSfpKhtENd55HIbRVyw5kvCQhmXEfJkNoG4aTSYOYswWUu8kd/AWxpTvNBaE4S0zSdPLziPOJCm09drx6t5Kk9hEko5hBohMO+3WCedrpukD+1twps280Z5BtGFNfrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA3PR11MB097687.namprd11.prod.outlook.com (2603:10b6:806:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:46:39 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:46:39 +0000
Date: Wed, 14 Oct 2026 13:46:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v13 01/16] drm/xe/hwmon: Fix pcode power limit handling
Message-ID: <as-_-4ruLww5bioI@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014115806.831459-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA3PR11MB097687:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ca25f7-6a4d-4d6c-cd01-08df2a1b1995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|3023799007|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: x9MR6RPAFhLh17dezYTGRs/BV8XttxKJWXWNOu4VKKbBZ69uMtnhm18jVJL7/x/hgxk6UbIWUoAIfuze+Dt7kWmGOeKX1t63QaeqZrVyHbjSbqL1fWGrAumttXYVpNVnwNnlF3+Qa2SFGPNTFaQMy52H2EORktOmWYntE1lbOoqBK/Jx/G+TRPk2Gv6t8z7z/nUBBJroVOrSBWLfBE0Aa4HsLUcMoi9zQVdHuDccgQDwpjOohuSwy98zicOMLydl6ZBfH9uluUqhaQyQW+h5lrjIWHhoZpJEQM9B0PTYPkTcpcJ6fi0jeypCzGHwAhjrE54utMhNhxn6wsftiHptjn4j2rZjZqKOWLS2qk6Wt2PhMhAPe2gVbzh0iHXNvHqLqsGwuv985iV0zNVjO1Tg7FPiRuvy1i3Se3iuK24nDc+OCHGE98o6Romct4KPJ7MpixxiympIZQNdA7blDnsG1CBgZvziLUckIIUfhyVdrslIlmFw0Xml1anoQVYSU3Wx7inIzetpP7tI+kzXe8sWnozIHdd3h6r/EbnRx0qNqbZkS9uT+0pNNAzWrQcipAat2ZePN12uKi+T0e/SO+hbbDXrfA5IVLBqgvUn9OZ/GLRTnmABno5A3AddaFackNUht4tghQ/Ix9CVXXc2635yuu5IMMV7Cj4Hcr//jMOcxf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(261009223027099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+WYJzgWa/bScpJA5VywpVyhGPLaDQKX0xaIw7yKPECZIH7GP7FuYPBbXVdVo?=
 =?us-ascii?Q?kyQegFeEduyMGIsNkuaJxa6c1iUKDc670yadw8cPXpde4LdevU4EknAiKe9B?=
 =?us-ascii?Q?BwLQCbG6r9I3x6CTKTKELbZAX9VTsWfbXgSsMnokdAqITcXJquVgeKhgDjMB?=
 =?us-ascii?Q?jLAhj0gq0OKUdLE0rUcOXSiWJb77nGlTkH34G58u3ZoJPYeFNDoWCZ40QIUz?=
 =?us-ascii?Q?yDCpvJ7JRhZXW7xN0QuBHYGJ8prDWm4CpIyCVGUXsX8o7LrGGl5HyOg6FnNz?=
 =?us-ascii?Q?EobLXPLuxh8abPE6u9jwNcgLila5zqrzpJAUmIm+gjGu+YtBIx8P/7HxZpMe?=
 =?us-ascii?Q?BStHlhJ9Zab9IU43NpPs4DmDDtmXuFrkxt1vQwEJpRFNd5uouh96srdOpk4o?=
 =?us-ascii?Q?xcbJV8cQuSWYtZwdwqyPciSwZzqdJn5dKt+l0phXb3nHN5T9zBoum/uYjiwF?=
 =?us-ascii?Q?5Y9iwMG+ShnFjSXWCE9AQuIS0NJFMkw9LanrLwz2urBZERNsA1/zcQ1TtKDb?=
 =?us-ascii?Q?yhy81w0Uu9yBwykQgttgTdvZ3k7hdILe73miof3gHhzmGfyv3YGjdPgKnOak?=
 =?us-ascii?Q?yJygvt+D/f4tbfJCc8nqn2xCHTVmPRNLWz3Lfx0AJLoO1U2bWo+3wkzQbUVD?=
 =?us-ascii?Q?Ys3AtrjM7gCq9CgDZpK8WGu7S53PDprgUhtzOotspdApgBOlk06kwBbd24yV?=
 =?us-ascii?Q?ff8S4drcdg1WYkKbD/2u9PuC+NAdX5BLfYZzCOPUKDcxLRf57OnHA1VHuKHY?=
 =?us-ascii?Q?rmuE9DvXOBeHqrB3XuafbfLN70Il5sfM/XqDJV4XV69hre09aAXSVdTMSIjy?=
 =?us-ascii?Q?M7TkVyFd+jp6TqVyjVFYK+y9hR5erDFlnggynvSQ72DPUWvp/MHjYD0pzsOy?=
 =?us-ascii?Q?rmePNU1RaTgQYVDWo4eRfOodge7UoLoAxIEOm4yaGck5yOwmKLHoDTZyX9CF?=
 =?us-ascii?Q?L6VmMTr1q4XXzWW49FdWtmoQ5ETGqK4tsmq9x9QWF/CEJEnskTSGFZ7ayZE4?=
 =?us-ascii?Q?4W3Krxnp7SJ9Y3fieF2qFzWiT0lkz7Fh0M9SkhjXgAIyGm2k+APqFJX1R+WX?=
 =?us-ascii?Q?QhuqGwAvHZZVJQU5iSZc6CY8PWoX+n9czlB7Vs0MTIZKprQxvhNkOfEsXZ3j?=
 =?us-ascii?Q?EBHAFNtJNsHPL8yQ5poL4FJPwvpmEyWIr5lBxvhUHVrgYrXNO5MR3aUY+LR8?=
 =?us-ascii?Q?3UvWxbwsFiO4JJd1T31LH2PX5e1vvKjkYmTwC/nCd80CBBpoK3Zzfp/uP/Zs?=
 =?us-ascii?Q?vCZl0j8PwDyDEGOl9we8EzZvjBeJPf+4Yt0bL5N8nB/xVHzGRzqct/Ji3sWU?=
 =?us-ascii?Q?4e2z7wGaullTCW7zT6c8yYppj5B0nye/CY0hioeRsYdiwIOOC+I5sj+GqKHI?=
 =?us-ascii?Q?5qM/1D2AyOw5VXY7MMCkU40Ud+1BT79CGSCFyDDOBE8cmWArCdkQFu6j1BrV?=
 =?us-ascii?Q?oeVU766vp9HuQeYEBcT70hgGd3RRCfvJWLznL1X4mknB0ytKm9q6roHC28E9?=
 =?us-ascii?Q?+4ARo81PSnAbUOumSUPb0B9CCrXSkY75gCSn7USKvpHHRKOXRHMeq1mXao6U?=
 =?us-ascii?Q?UWWSR7790spSILZdOFeofAhtQK4CLD4dqcYLVGbQLZyVhKznagKYiADMX5ue?=
 =?us-ascii?Q?jBoPfUE7qKVnORKdCE4gsKWDRxRIrhkCNbkVjlgjxfYXL8R98atxkGPc6lfT?=
 =?us-ascii?Q?eOu/Eb36ywOnA/KbdxZgz6Md5LkfIa+7JDCQ+oL0n9W9SMOse30lyQ+ckusF?=
 =?us-ascii?Q?B8DNIsXHgg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pyS/JSiVgcQ9i7D4cQLd//4mJQ7+IpQwvzGuaqvGK6PoqT3ZX+j7j1kgKDLHf9xaM1pE1Q3ZGsaEUNlV60UcbMquH3ehlT+0eP1sMT3m/usdEjBUSEqWKpTpI6IcduuDVKR8V3yqhg0cBVUfy6cDXdA20Hm+lZyKh/V2HwToMU+w+12eRB4ThvKO81YHHFJWLtF473dn9hurV58aNsAtvfVHrTlFtBd/yRGaYiIuVbvS95HRMqgMS4oD6yCa7dV/I0ZpT+yDjSUHOVvxKiiwpkvh0RnqinexDpL5zt/Ri2PcSau4sVa792Y8fs+G/EQ8TU8g6hrizXDGmCjT+wiPXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ca25f7-6a4d-4d6c-cd01-08df2a1b1995
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:46:39.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBqDeXUSmwZ+jyK7KIeos31HJwYlmppqdJ6/uvFLwUgS9nuDH0tskQ07ArannSjjiS5Tv5dZaHW0Ljef0MMu0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB097687
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

On Wed, Oct 14, 2026 at 05:27:51PM +0530, Karthik Poosa wrote:
> Return early on pcode read failure in xe_hwmon_pcode_rmw_power_limit()
> and propagate errors to callers.
> 
> Replace boot_power_limit_read with per-channel
> read_power_limit_from_pcode[], set on the first successful pcode write,
> so reads and writes stay consistent even if the default limit write at
> boot fails.
> 
> Also return PWR_LIM_EN for power label so card label visibility works.
> 
> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2: Check return in xe_hwmon_get_preregistration_info() also. (Sashiko)
> v3: Track pcode limit updates per channel. (Sashiko)
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 77 +++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec3..c7f936892512 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -165,8 +165,8 @@ struct xe_hwmon {
>  	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>  	/** @fi: Fan info for fanN_input */
>  	struct xe_hwmon_fan_info fi[FAN_MAX];
> -	/** @boot_power_limit_read: is boot power limits read */
> -	bool boot_power_limit_read;
> +	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
> +	bool read_power_limit_from_pcode[CHANNEL_MAX];
>  	/** @pl1_on_boot: power limit PL1 on boot */
>  	u32 pl1_on_boot[CHANNEL_MAX];
>  	/** @pl2_on_boot: power limit PL2 on boot */
> @@ -175,9 +175,9 @@ struct xe_hwmon {
>  	struct xe_hwmon_thermal_info temp;
>  };
>  
> -static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
> +static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon, int channel)
>  {
> -	if (hwmon->boot_power_limit_read) {
> +	if (hwmon->read_power_limit_from_pcode[channel]) {
>  		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>  			return READ_PL_ACCEPTED;
>  		else
> @@ -198,7 +198,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +						  prepare_power_limit_param2(hwmon, channel)),
> +			    &val0, &val1);
>  
>  	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -213,14 +214,14 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  	else if (attr == PL2_HWMON_ATTR)
>  		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>  	else if (attr == hwmon_power_label)
> -		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
> +		*uval = (val0 | val1) & PWR_LIM_EN;
>  	else
>  		*uval = 0;
>  
>  	return ret;
>  }
>  
> -static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> +static int xe_hwmon_pcode_rmw_power_limit(struct xe_hwmon *hwmon, u32 attr, u8 channel,
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -231,10 +232,13 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +						  prepare_power_limit_param2(hwmon, channel)),
> +			    &val0, &val1);
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> @@ -248,10 +252,17 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  							     WRITE_PSYSGPU_POWER_LIMIT :
>  							     WRITE_PACKAGE_POWER_LIMIT, 0),
>  							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
> -	if (ret)
> +	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> -	return ret;
> +		return ret;
> +	}
> +
> +	/* Read from pcode once it holds a driver-written limit */
> +	if (!hwmon->read_power_limit_from_pcode[channel])
> +		hwmon->read_power_limit_from_pcode[channel] = true;
> +
> +	return 0;
>  }
>  
>  static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> @@ -394,7 +405,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>  		} else {
>  			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -679,15 +692,19 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> -	else
> +	ret = count;
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> +		if (!ret)
> +			ret = count;
> +	} else {
>  		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  
> -	return count;
> +	return ret;
>  }
>  
>  /* PSYS PL1 */
> @@ -1511,22 +1528,22 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		} else {
>  			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>  			/* Write default limits to read from pcode from now on. */
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_PKG]);
> +			if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl1_on_boot[CHANNEL_CARD]) |
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl1_on_boot[CHANNEL_PKG]) |
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl2_on_boot[CHANNEL_CARD]) |
> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +							   hwmon->pl2_on_boot[CHANNEL_PKG]))
> +				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");

this is wrong and ugly, please move this to a function where you can combine
the returns and handle it only once...j

>  			hwmon->scl_shift_power = PWR_UNIT;
>  			hwmon->scl_shift_energy = ENERGY_UNIT;
>  			hwmon->scl_shift_time = TIME_UNIT;
> -			hwmon->boot_power_limit_read = true;
>  		}
>  	} else {
>  		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
> -- 
> 2.25.1
> 
