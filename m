Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75DC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 22:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677A710E314;
	Wed, 24 Apr 2024 22:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SltfXl2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0E310E314
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713998344; x=1745534344;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GIvfKWda5uBaAiJAb6ap2GWqyCLH6AxrWIpIUOG0uaY=;
 b=SltfXl2SM5JUtH5OvUc3PoCdxliTtmPy8V4eF0jsXuIdI80uXb+PZNp0
 nMM4eX0rKfGO4sbczjRwTAH/yN7OqyQG7BU3amFQYdAM014BZehC1ntfZ
 N7rQpc0K4L0ckDRV0MiD2Q5uKSDDdJuAdVJyyIGeRne6x3UIlvj8cQdzn
 vjGfTWVjNp4uqaH+bWQr/A4F3Y/0ozsCmdNUKu/WCBQVTYWn3DaaKvAhn
 to0p30z8O06IphuaB/GlAggAlJWif4IyFy4t+N7868Ftx3T4ObZJzJNKo
 ph+0/MYR5mC+OKQ8AaEsCiUGSO0CpK2rTlkzp+pdcves9LOgYY66Bw8qB g==;
X-CSE-ConnectionGUID: s0i1VUOWQ26dk6oaWqhKng==
X-CSE-MsgGUID: 7hq+nvJVRYKOQeCTupJLbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13443961"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="13443961"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 15:39:04 -0700
X-CSE-ConnectionGUID: O/JeMdBhTeKT90wF7kkbLA==
X-CSE-MsgGUID: PPZmYaRoRHq7grrftyZnvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24871723"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 15:39:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 15:39:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 15:39:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 15:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtfLF1II/FO39owF4c/d7w0u6mE8sdlCSeVGOqxXZmLCIfKZlc5FigiktxoQN1xJvhBkHir9GaKXLd89PhbD3j/GqmJMNOM/LduE0H7f8UitXFmbE8jP4Yt+vIXOLqxORn+NQTSUZ2Zuuq0OMZUBdsrVF7Ui6MaAS5wcu1wvP3nAs1wYSPmHcHFjXZeXATou6ITsIHz/aSjLe6E4X+jVO2PuaqH+pkQgYDjR63fXaBrLo02j3yBUfPvsU6zUJA9n7XBVkd18pL713ceehCVxN6MZCz+Bz1i7qAfS5dkwXhW58+/7cwNn5WxD9ZqXETACbsoBGFKJoIPbh0hhYjJu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4xtpJo1UGe0fIbAYlzVe7ZyXMyLSVimQSmzmp6rZLg=;
 b=bAB3vUXjWbRiGx3QO7CCNh+7nvcx0pL9S5QjjugZbYIeH3es9Q1AbodM3AnH6TZuIqZjL6PTCTyXWAoBB429ARpX+Qr0E+H4OesruemB8ZdGzdef6Ms2LfIxRjhiAkoZyr3nhW3hT2ZiUczj96/h92++NAihUbUcTTxisRYCIoW5sIoE5c9FWyYDanhGCdmXmvdrt7MuDcFdBkt4PS2Sk881fh/1h/GRga+NFMbMCQv4KGajUKnA2eGdzBRQDb4mOOkMK2sOFynOC8eoXncm+H2Y21q8n/z4WuoJQWa+Y7/EQ/U4DoGd4G2WNnm+fEoeAFVTpjVofTy68EtZsKYDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 22:38:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 22:38:56 +0000
Date: Wed, 24 Apr 2024 17:38:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check result of drmm_mutex_init()
Message-ID: <33t2dn6dzhxhhgv4mhuz3jh4dbpuxi6y6cxyqg5i5u556utzhq@zaqnjneilx7k>
References: <20240409153132.1111-1-michal.wajdeczko@intel.com>
 <yzab3rps47j7t5o7cbi22yek7xzfmne2c6fa7bhgmsnedtpt5u@b2aje4vank6e>
 <c420106e-d516-4317-9ab6-462d9d72bd61@intel.com>
 <2hakctnmdt45up36qcwhw43c5m3x6nvrflwfhp47owpshe56el@qpdl7rdt6t4x>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2hakctnmdt45up36qcwhw43c5m3x6nvrflwfhp47owpshe56el@qpdl7rdt6t4x>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce02b5d-7532-4477-966a-08dc64af5360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYLuUktIQq54lD6FI7zPQgU0SB1F5bF/HZeBX41NooWk9xveMRJQseK5794W?=
 =?us-ascii?Q?0AOEMtVzsU/YFjyfgsnuRh+/vdH/KhR8cwGOgFyp7VgtCDbyXjhyCglshPvz?=
 =?us-ascii?Q?gZEHUEtDDFgxZHD8EAXuNUaPyvyxyX4/YPtSU13ZuA18fURyS/SYkVj7fmRu?=
 =?us-ascii?Q?GTN7GP0Anc66zMZSSYlFzKGsco8hapj0gjSyEEpmUfgELawbuscB8G8q4++7?=
 =?us-ascii?Q?d8b2EPNP5g8mFJHX54LlUWpUDnS9htb+DOJG4+lcaIwaeb34OPonbtPEcxnZ?=
 =?us-ascii?Q?AiFBySr/LlG1HrqfH/hkzK/ruRuGRNgYIY6lD/SWcHJ3aiuBviBAIP54sO9Q?=
 =?us-ascii?Q?XaQscghGakP4o5cxJXkMM6BKGcB+OfzWAZDUBI4mko5RrbGZ8CDDd8kLw+Vk?=
 =?us-ascii?Q?SplDMMGVv/dDL7TThqlNsxrMTAMP0GFGejS8bC5IQFiqaLKo0eW9Bblp9kfm?=
 =?us-ascii?Q?Zo5JMKHKvwKIAVheEcpjExuMRqLTVtDxcxAbOyygym5vMbgckmVx4kILadD1?=
 =?us-ascii?Q?bO9iwF2ov4Zvw9UV5r7mY4IzsoZy8s30258roA86u27Z5l0POHY9Ei8ZmEUI?=
 =?us-ascii?Q?CeElQZpero/PDswS2k6vWVcii3YDp4W0N+T5sQZAKJobDXsNb4HxYUJpcBpm?=
 =?us-ascii?Q?RDQnVz+E6R7tGcC0jMhzWwKed2bKtUcQXxkFLWyCoTg8wdI/cBmrzZHwaGmZ?=
 =?us-ascii?Q?iwuCYDIxTXkl5d58eYDn01BN/BYFYXaxvmXraMNzT6r6GsJL1qOynYXangeT?=
 =?us-ascii?Q?bJAHFfPae9q2yZrt3BoSekCLRxFmE5MldFrUo6EluVq7aSU54dPqgWqy0FZ+?=
 =?us-ascii?Q?bkh/qRoDREYRcHEpcPpW263O3h3fVKpLxQE8tj90wk8JGZaIXy2Im3JVcsTj?=
 =?us-ascii?Q?e5w+FgQuTjGLCtQJAWDO6k4FvAeDXhvg2XpMeaCnGX6EyHlT6uRW1Ot+qD35?=
 =?us-ascii?Q?Bgn1yOdCNBK8QgTtueiPFGTx98yNj7FDjgqLurtPADX0mW1d/OmYK8CmD464?=
 =?us-ascii?Q?PrqhF/SVMTmbLxUpKJorTrAburPcrveVTMRKtwiltj7SZRCWuPE93CaZkpHN?=
 =?us-ascii?Q?zLnd62vzqQ1PjAlS1QTgpKCmXqjoLWkyhEoTv75hctiwrBfzir5QMNMkk8qr?=
 =?us-ascii?Q?VutKxBdpx1UdriOxdgbu2nSOr1fbiszl/6T8RIY9z/eDuni9JO6RoEDJVI+l?=
 =?us-ascii?Q?FtFrDEf1/cPbwj4fjZRgL5kOpqkXFpwl42LEZy3dcbagZDs1O9u3SRY7vkI?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYUISx0Yo8Ka0W25mUraBNClble71ThlUPVEMOAWvVOrc0fPlBSA61Ja0qTp?=
 =?us-ascii?Q?/K4TbTo7gXSlFrbFGAF4VMgVG25fVpae8QokECowESHa3jAmcQpOq54LFDo3?=
 =?us-ascii?Q?bEFGixXMtSMTd6VEfbHsPvoUpKCSKrhCZvT6HdvUDJ34tb7V7w0DqiDz9Xft?=
 =?us-ascii?Q?l18V5oH4e0sDez4H8TFIkg/N1iP42+bSqGmUpjhfAipHTAUFpznIweh7PlqA?=
 =?us-ascii?Q?7BtZH/N8naeRKkVOPEgpG4/k4AkuZ3gU25Xnn0lX0mXg1CJV6zptXOTY+0Aq?=
 =?us-ascii?Q?ggbAhxVNQlieVGMCH6mekAVu/ZnAQMml8qI2rCuZ6PKOO/qMzqQAfeYwztBh?=
 =?us-ascii?Q?Mx2IPtQjFSRxMoC2UuP0j1WYwDxuZ5Kzauir8q82ZNmZRO41f7kuzd182ek3?=
 =?us-ascii?Q?pohu0XNM7PhuEBVkap8YjTti7PsYoolT3nMxAZIPbWGEyj4uX9ymf58sBCr6?=
 =?us-ascii?Q?g7iGFTs78FqqSHfZH9n/cXIs9rA6nyhoUcxJCmakugE4MgddOhaGsTIUt9JH?=
 =?us-ascii?Q?r0wF7j/vWBkSk50qhcAvv7cpz/DFaTTt91TcVJ8qlEZWP8qUZG5VrUQlPOIb?=
 =?us-ascii?Q?u8hJGJGUYkFwR3b00IWscglOaWbzSpr3wBHg0bXL+26QUBFR7bG1HHcNEa1Y?=
 =?us-ascii?Q?SbwgJYmqO0jfbde7nUb3yZpUNdo+aUliZ+z3H9TQp7ymQeDFb5xbpzckSl7e?=
 =?us-ascii?Q?Db8P1iNiyQIwANuFUTvjiCYYt7EC/s0P458J1ozDmYrRjtbe4L8kwEMKYIp7?=
 =?us-ascii?Q?OMFFgcPE60rYm/YtWcmTkKjUB5Ou4AhKggWVqibAwgSSfmNiAA0v0rgxcsmT?=
 =?us-ascii?Q?7B0SqFB3hl2hThGZcgwdi2UUxgRmN4/eGVTuwTYXusaKUmqbYcG5olDdXwA6?=
 =?us-ascii?Q?xNFme93VpG1sKOgt6Nv8pLFn7mjjSjaTEfDhGp9Yb9yRdOONgQsjtWmbdA5y?=
 =?us-ascii?Q?rU1uso/p1FrC5isWXP9wM+1FM4Tp8qsD66FrIXanFbaSscikVqfmhVGA2fmk?=
 =?us-ascii?Q?sEDBWRq4amiO7i570gL4b0u3PbPVJPnGHlUSmig9PiBUlrt3Ab7esq58xVhX?=
 =?us-ascii?Q?e3BYeqCBd5aZ78h3pKGW0SHdKwkrVfRFsSKg/Ai2TjtlHtia6Y1vBwCgUEki?=
 =?us-ascii?Q?uA0w1WAD8QAlkU6JU9rmsVhXuRV6f2nXh0JHH4ipAqPFwGTQeEgKC7zDTdpF?=
 =?us-ascii?Q?JJWIB4sQ7+oY6WXve8ojj5FaEee4oFyqdCAcPIAf/8fa6IZroVrdyFC9Bygc?=
 =?us-ascii?Q?K/ZQOGCDNSN5/EKJ6ubaEvERHrWMCDt7QitA3qE6050sprfUItuwUuEOghw8?=
 =?us-ascii?Q?NW48cIAjDghUYjQfo4NplX1G0EPwYuxoB4rX+3NeZfu1Ar4wrFz9VpXdxOve?=
 =?us-ascii?Q?T169U+cbWVENNzz0EBXcdDS8UPdAl33xxPbp3oLtzftGjrBFLtL14xo1UMS+?=
 =?us-ascii?Q?3XqPJL3P+8SZW2LrouCS8cwrJ92xHjc6zAcovOWzC+L40aorHIBW4wXLs7to?=
 =?us-ascii?Q?Uiuq80iDFD5UTlRKhP0HOD04I9hHi5lqpcz26tYyg9CFPij1Qg1f91qJ7ssG?=
 =?us-ascii?Q?tCVDxmh2I0+0bNGw0XvMF5O/OoPUeOXojgLBUyyUHhDS/Rkph6baKglO7o7W?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce02b5d-7532-4477-966a-08dc64af5360
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 22:38:56.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YySFo2CcVY9j1bTx8qtrNHwRtW6kzgWI+Onzxp+QC0EXsshB5LOqPIRf3L5/c8MB7XkDQ1f2rPGqYNdA4aM2/7SWZJ9tE3ahSMQMO3i+gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
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

On Wed, Apr 10, 2024 at 08:50:27AM GMT, Lucas De Marchi wrote:
>On Wed, Apr 10, 2024 at 09:58:45AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>On 09-04-2024 23:31, Lucas De Marchi wrote:
>>>On Tue, Apr 09, 2024 at 05:31:32PM +0200, Michal Wajdeczko wrote:
>>>>Although it's unlikely that drmm_mutex_init() will fail during
>>>>driver initialization, however we shouldn't ignore this case.
>>>>
>>>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>>there was already a patch pending for this, but got stuck because it was
>>>trying to do something similar for all the display mutexes, that
>>>shouldn't be there in the first place. Not sure if we take that one with
>>>conflict resolved or this.
>>
>>
>>
>>If the patch mentioned is 
>>https://patchwork.freedesktop.org/series/131300/, it does not 
>>resolve the mutex mentioned above.
>
>https://lore.kernel.org/all/buobxdew2jnbfblawfvnzwntexvhxkslqstsgp3xsxpexdtdem@gwnlli47tdkc/

since there were no updates to that patch, I went ahead and applied this
one to drm-xe-next, after adding the missing blank line.

[1/1] drm/xe: Check result of drmm_mutex_init()
       commit: cbf7579304c234208569d767355cc39c0665bd5b

thanks
Lucas De Marchi
