Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A0C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 14:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731510E790;
	Wed,  6 Aug 2025 14:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekLCwXVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6287010E795
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754490569; x=1786026569;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/L50xgMjrCLjlEHIQsiqU5F3s36fJ3Qeqb4RDPgkhms=;
 b=ekLCwXVPfRaaZpfORX0rJRW8d+tKjc2C14tKwWbZkiaUB0OesrG2GUjw
 0WNk9Mmy/tg/h/0yyjFUizqLOlPC7A3YmNyFevaMiN1VoKURNv+Hw5DPJ
 22HzZNVisVNLFfh6m1O9nl5QhFSCmvfjv9p1aQtxI9JUMctv9Leix2o92
 1EgcKHecyTHMcaQPqpA7LYrfzbFtiLjbP1kTPXRr1QSzsyMh7Pzz6BG+5
 RlLdTNjPxdumfy/pLUd9U19lxinZrRXAOogtvGTGtv83vdhjdaom2GTW3
 51iZDJSVJ7j86eZYhoSsjFZh6p8rUfwdpd6qEQxB2viCjIeU7PtG1LnYk Q==;
X-CSE-ConnectionGUID: Ys2oAu4fT+e5J/LEnXnA+A==
X-CSE-MsgGUID: TNwLJmZOQcyijxT9oIDoGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55847351"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="55847351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:29:29 -0700
X-CSE-ConnectionGUID: 3t0NA0F3R1GD1I97ju7cZQ==
X-CSE-MsgGUID: eqTc1D7DQUGS/2Z4+Y8s5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195757426"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:29:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 07:29:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 07:29:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 07:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1iRTkJOssaYUe2bWCwLXXov7uDTBvuf+RG0NCXEkukVaxjD+Xz6luYR4JVk8D3jm6sLuSLZ9AYWs6OrEmGWkPryil+HDFl87A2FG+GMgIVYgzyYvDbcAr1U0Ya+/c32VzcaPWTpvuWMYQ+X2o0vAAVbJdCyIUaUBpUZs+igzsSaIuq/30cUUBft6zMH9Rck7VPqFeSCQe5yT9JoNh9avoudSYv+p6ipZzHabY0IPJM7KLMhcG73hoGj2wg+8Sw0R4xHcT03aBj6jeh5qpY8aDKRtJ/94JTJK8Nni/QDL/T+ONwe8YmPqZ3Vs/2oluMCbOTC6ItkIkVuWHOXOi7+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cYW32w5nVD+1+iFyVfaQKmj6AB4rS/udt98pcH/eJA=;
 b=HI/8l4FFGvI0Jc9taTsL7tGUgAUBIQ9I74vHoogekRH98ObvbmzyoeJgw2FfKVwZAa0EuuJHTIW6tbRcGWlA5l3jq4zhHeCKndiVrnqivaPHf312a02VWSghFe5TVvui5h41hE+7xB6kAqzMYGN7v82CN/JhK6lN9wB4j1X/D62PrAYpmbLdxb5RnoSvgXla3YzPHOAbYMbv4KqShQ/phGAqxD4qnxs7MJzxhgRLrTz4KGdLKuvP3cvHZB/I52W8n7HWvsw0FgO2Vb57QpPAnYsXQYB0j3gY2Xyi5mVlRt73D0sY2hG3y7ZlaOQ229qrFVe27H56axFHT4YYaBBpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 14:29:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 14:29:26 +0000
Date: Wed, 6 Aug 2025 11:29:18 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v6 08/11] drm/xe/configfs: Keep default device config
 settings together
Message-ID: <k6k2qigitfi76am73qfmsaswdywhobjrk4metn74a2rbauekms@7cfzu2gpch5q>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-9-michal.wajdeczko@intel.com>
 <pk56daxs2snzdqbnaaq3cqysy5rhpeioc5xd2h4cgxbdbrmh46@q6iqxhuifmgw>
 <7eeeafde-329e-4bdd-bf90-f44cec920008@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eeeafde-329e-4bdd-bf90-f44cec920008@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 204a2490-81db-425b-e325-08ddd4f5a510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hnet72cTpGgVD3m/Qi3oNwiIPMPZ0xaKZ7FEIsVYKZM6MFjCfDU4yKJg9g?=
 =?iso-8859-1?Q?kaA7SCR5oPcCBRfnLaarr8JbLbxp9q4Yc4KMmZaMqjr2rX616rC3TpA6lJ?=
 =?iso-8859-1?Q?YhUldhws3yR1iNAyhyZrf+zOWqWdHI4acTJAI1BHxxibfqZ1rBH+Qyupp+?=
 =?iso-8859-1?Q?HKzWYGQHKl7ioyUFU75liU+AdtnQmuklt0uAdfZ7n4OqEiAcJ1kAwNr/R3?=
 =?iso-8859-1?Q?rOtN+v6obEVs0/tKdA0eJFUkHxc0KCX/UV6CMFrCf1mHNCatl/ewQmNs3t?=
 =?iso-8859-1?Q?4GBomgX26ZT4LtlYbLO7/we0bD3iH7sKj024J3eye68XbrrQplUqlKhq4V?=
 =?iso-8859-1?Q?+hHTru6n9gn9EE9bWJgLOVRwfaajOLvU6bo/UwMP7REDyj5EwNBzs1wH9i?=
 =?iso-8859-1?Q?J9y+FnGJZW1vhDmPIS8qOplYk9mhzW5UCpPGEiuQEjT06BHZZ1hs+UthLx?=
 =?iso-8859-1?Q?bankWYmTgYemO1L/aI0gvbsHKntsVZCv4fuJisUibzg+lazPC/24c4EO5W?=
 =?iso-8859-1?Q?vcLb7o/TCxKnPyBtGh113agzsf7xzBeUTmtTZsAhqYaZxbXyFzaVjed6Kt?=
 =?iso-8859-1?Q?wyGyz5d/X8GjcahV0sEOI5YK+xLEEl6OhU6SRq/WsIq7B/0gMWsQ+2zd42?=
 =?iso-8859-1?Q?WSXbyi9jkQpFgxe7GNLaAGNj7fHi5XAbFS2ZaznGigbxDRnwD+spydfx7h?=
 =?iso-8859-1?Q?ttEUUtMIQ1SL21YECFMGl8ktg5VbX1/DGwsDbFLsFjiAaAVuiadG5roTdg?=
 =?iso-8859-1?Q?cvd/vrSqbAmb1QiCzB8lMfWjVgGxkYtlt4ZFWuahW7EzWv0V39l4jT/uz1?=
 =?iso-8859-1?Q?vICz1hc/rOAhLZgYa2L+0jP3nK/rqTWnEnTN9MhwbUWV7tfVe1b42+YOAj?=
 =?iso-8859-1?Q?qdh8PZIXoUmIYF7fmcXZbbtFGz5WHBPYl60D/KRaNp9GTyg4/UwSZXgYhY?=
 =?iso-8859-1?Q?9exq0i8cvEhfFXAqc00rAzn0cTXYbgYrqsiWivYYaOe6YtEkEbXgoyGpII?=
 =?iso-8859-1?Q?JdYeQ4TwC4Bu6c6rYD0kiBLSr5psy+xpG1VY81+MSGoWzgyPYAP79cq+C6?=
 =?iso-8859-1?Q?NqpGAMYqWvqqz9RK2S+DgwFT6hIc3K6HiRnr2K2L0prLCRkm1suU1pdlwc?=
 =?iso-8859-1?Q?VoXSfg3jjqN7PJC1IkFtmdzjeEjztw1yDKDBxYX5Xz1+NsyPE/3ONiw/LR?=
 =?iso-8859-1?Q?QogfEM16iNoL4pjGsst7/r54LbFAR106/7+lecje5yXVGyM4o6ra20oSc4?=
 =?iso-8859-1?Q?zpUe96ptwZUkGbp/9KwlBmHibEFZ7ShmZ3iBmFjHvSjv33ivKzwYdlySJC?=
 =?iso-8859-1?Q?HbenLu13bYit9IIyHmP9JJQ9SdGWkqa884A/1bnrbi4fkjHSpZ9sZ5cBEA?=
 =?iso-8859-1?Q?Dyzb/QLYuxxIMiXqkMHmrxeZ1LJOrlcYFc4La+tZRtHZ5v32foHRI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EaboW7UI8BLWhlowC+b7p64nRbxkeImUrtFdTTl/GES10sWaRIVV7WkHEC?=
 =?iso-8859-1?Q?bq6AAj4SoDVS1RU4sIzlxmQyOSjPCF/XPl8moHErXDj9ItOQhnke3Dx9W7?=
 =?iso-8859-1?Q?icrzesppulERr9BN5ZxwqxOS95b1cpQRXt/jIH2CoSGeoJ0i/IMYjLAFez?=
 =?iso-8859-1?Q?NLxna2UohckV/7x9j3feGLQ9jmluNcWVS3HdKQA8Ew0suPzdxzF+lYNkrh?=
 =?iso-8859-1?Q?6+JU+Ekp8BKWQyMYxioEjzzpvkQ/j28OKdFIombEMnPPkSdkPw9Dqc03zE?=
 =?iso-8859-1?Q?Xz+N8Ml/ihGC1GSn/cexOuSl3za1eZoeXQkdEayqdknf49fTs3h/e7sRGF?=
 =?iso-8859-1?Q?PryxePnk9udEP+xOZwgn5REANSAJ+8nmAT85KVXoBsfNLnJ81g+g/y0Cej?=
 =?iso-8859-1?Q?yay/VbtK9XaSGCDkbyZDbaYj6olR7QUOKNOLjdpNCfESC3TUz08NxSlw7h?=
 =?iso-8859-1?Q?jJFZGaAUfGMqRm7JIWN1AM8XmTRAmji9gwsDr9lKtoGS6xc0HVl8ZTBd5S?=
 =?iso-8859-1?Q?Px3zvsYW1p1Kgoh2py/kLsurtplz8WoiJDNpPnAxsXLXxNGfuydW/tHW7u?=
 =?iso-8859-1?Q?6+qHkJG4CHT7yvWPnHQqeEqik62oUTnDLW6TjAxo5vVasJ/vk3V8+KIwtL?=
 =?iso-8859-1?Q?a2q7QQ+YeYeO8ck/i8CPqqbwP3V0GqCanmtTiCJrmv7+bDsRUDvSHywQGt?=
 =?iso-8859-1?Q?2WMW31L9df4YJw6wbt0b9a8yKWoYmYsEwmoVj/LxT7i5AssxElGk12OCNE?=
 =?iso-8859-1?Q?yFrt+qnyG69RQm6V0OzN72u57y18ur40i2AlVjoVD51BMYXoGeZR2nyl2S?=
 =?iso-8859-1?Q?fV4rE3TM2YbR7g/rXDGd2wwNDEn2hUpKjm+9KB/aiqtKN5HulAAuC5GTtZ?=
 =?iso-8859-1?Q?+XKzqtJxQCn7BP59l7edZlXRev52D8G0JQE1TVgznLCx6mrEWdySjuWRyQ?=
 =?iso-8859-1?Q?ePl+XGmZkK9TcpUGStTscaXAo2edunF7XZUXwbOlp3vBSQ2aXB/yzTzI1n?=
 =?iso-8859-1?Q?dMjG5cVZ0lSf6lYYGLCK/D66U4KN2ZdZyUm6VWP5wItKlc7AzkDEP7mcut?=
 =?iso-8859-1?Q?duTUTYjNfgvSFVOLq8ag/zeV8tXGkRmG9clWlfaVbIIA0diotHi2SaMxiP?=
 =?iso-8859-1?Q?12rYLCRKFBKJ/iglMr/Tx/ILXsKM74qP07OWwNELhwfFf0qNzIFQFajNm7?=
 =?iso-8859-1?Q?fKMuQJxnCXeL50VbUM0M5hTWIOCaFwQghqXVNs5Pl3optXkSBr5MeFcq24?=
 =?iso-8859-1?Q?MRAxJ954C0YK5g2BkEY8CXj+/hcUGA7jhEWWueUgLpCTFK3HCEwXmsFy4i?=
 =?iso-8859-1?Q?tMN1fjtJKqzAlBx1d372YNk79y7rZFU3zz9onAiTShXS9ZpVMxB8rvE0gW?=
 =?iso-8859-1?Q?9cGjsWdhRjvMOeE3uodFYwtJHJRQWPNn5XHOQM/sWOw9Fdvh3lNSqFzJi5?=
 =?iso-8859-1?Q?RJsnE5otbwn9i+xoohWet2dmYF12TuEyGa4xuUOB7jFkDAkg+CoM3o2gWz?=
 =?iso-8859-1?Q?N1T2zmEL2LWAjEnBQyXIZ8/tr3hMy3dTsKLKmrH6m3R8Rq0RjlHV1dpkPe?=
 =?iso-8859-1?Q?yjtQzEDZggnachNAd0eYuJ7E5Wc6NmOVNhRLTS8kg3FkyLsjT2HJ7xOJoY?=
 =?iso-8859-1?Q?NR6VJMzwDdrFcWbo3+VJdZmAJAFb/RYSiVZDyg2kI6x4DNZs767AWzFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 204a2490-81db-425b-e325-08ddd4f5a510
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:29:26.1882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C+QkcTC/5Dmdyn87LiiIy1pEtdedsEhnltiLJ7lohUqX1poOoHDqWUnNbPBLlUb+GwU+PWYiXymsgtNIlushU+4w/UtBjlHOEKZCaDlKn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

On Tue, Aug 05, 2025 at 05:09:52PM +0200, Michal Wajdeczko wrote:
>
>
>On 8/5/2025 3:28 PM, Lucas De Marchi wrote:
>> On Thu, Jul 31, 2025 at 09:33:36PM +0200, Michal Wajdeczko wrote:
>>> For easier maintenance add a placeholder where we can keep all
>>> default device configuration settings in one place.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
>>> 1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 7ad9fc65e21d..150e7f2becc8 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -97,6 +97,16 @@ struct xe_config_group_device {
>>>     struct mutex lock;
>>> };
>>>
>>> +static struct xe_config_device device_defaults = {
>>
>> any reason why this would not be const?
>>
>
>while today we are extending our configfs support only
>with completely new attributes (like survivability mode
>or allowed engines) I was assuming that shortly we will
>also move to configfs some of our existing modparams,
>which are device specific, rather than module specific,
>like:
> - GuC/HuC firmwares
> - max VFs
> - ...
>
>so to keep the idea of 'device_defaults' as the only
>place where default values are stored, I assumed, maybe
>wrong, that we will need this to be non-const (either as
>new location of some modparams or cached values of the
>modparam attributes)

I don't think we will have non-const defaults. If it needs to be
different per platform, then we'd rather copy the "module defaults"
(since it's a static) to the device struct and work from there.

Anyway, as I said in my other reply, I added the const and pushed. If we
need in future we can remove it.

thanks
Lucas De Marchi

>
>in [1] I was trying to make first step with max_vfs,
>but patch was dropped for a while until this series will
>be completed and we will have some better understanding
>how to proceed
>
>Michal
>
>[1] https://patchwork.freedesktop.org/patch/664176/?series=151660&rev=1
>
