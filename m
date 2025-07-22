Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF10C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9155E10E319;
	Tue, 22 Jul 2025 18:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG5XJD2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31410E319
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753209134; x=1784745134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HQgiRRiAb+9H+A4UXNIrLTcSzT5FH2p3NymPxeKdWv8=;
 b=ZG5XJD2OAm7URYTv3s8ZDku40txwXinjt9kRu0lgJ3yMTdo/sCstFVb7
 KhmHxns7Z1dEudetHEbU2qZgyNTRSL7ZYFCRt0O19DAUip7YKx9JA5zVU
 ZHPWhoeTGekFOUW47/JJO8s0xl+6yha4/OZgiCArJkQ6wqFPIf2KSIEvD
 1bdsNm1PqaXLc6fEuBP8kR+jdX/yngXXxF1obiEFUWUIFxvo9iWZITozf
 NhwT3tB2zHsXX2JbSVt/Ds4Xdm2H8j68YT/CvIoTAKUYlDn2r9lN+N2pp
 WPef38z2Grp+qKdnq+ov3/IqLvN7hZlfSYncOAsccCGB2Q+lqcPKf87t9 Q==;
X-CSE-ConnectionGUID: 6jJFY+ddQA6rNmdjHoqD7A==
X-CSE-MsgGUID: cJKn66XETE+CG9jXddm2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="80922284"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="80922284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:32:14 -0700
X-CSE-ConnectionGUID: ER3ZApNPQBytluWHIif47Q==
X-CSE-MsgGUID: 6eaq6BZKQ0iIX/ugJRQppQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="164865256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:32:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:32:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 11:32:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR1TdaTqdgY0OIKekKyWRTZOMlU3NP1y7ibSxyaFQPGHVzVL5NlBKVoeJtUf4nqKkSoMfMjg9Cahi2qTCAaG3pdYyPvEqdpTbdwyAf7W7bCqyds6RtyY2RLcMh/zvNBEyUb9/4jVNsn4ai/mksOIKQtfmKd/DotXPoJHEORt74Cdfnhc4sJwrXuedleWbuhbkPWkGK4/PH21vJjSiECM6a6zQZ3nX7ygJ1Z0drYcno+OrYUnE3nt2Pt1ofLr9rqSPVxIkvauRpWpR8YTVvZQW5T5DWcGwtFoyCA/TZAmC2dk0wMkR7Harcl3b/P3QHAn/tIgkmHuBoCnoUQWE2DR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQgiRRiAb+9H+A4UXNIrLTcSzT5FH2p3NymPxeKdWv8=;
 b=RKHUuHq14mLxDUrFs8EBf4pp3FC6pJxu9N8mskr1lW//Y+2U566qXE/QTwIPzVniPVjjqw80CgSGEWu2pKnTfh5b9TWFTM52U+z2ye59bd2iHnCBbrLIsDYRDggzxzGWWh2Gha4H7AdLda8mmTIqvgy9kSGFH8zIBWccXKjJ0bwZeRDgO6EAVCDzheHJ8eQD8xnjZC4ABryo/3GkFxQvw5UJy+xeqHg2WeI3WsyFhB1MQNdjICjEFkRrN6uAc3I6drbQ3fyRMbHQWGAVzIVonS2t1d8f8UIQZ6YGIXIOI+xmT6wEgMjPA0xlLbnrKi+fFmQCPDupA0nsnJvfoqcO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:32:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:32:10 +0000
Date: Tue, 22 Jul 2025 15:32:04 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/pf: Enable SR-IOV PF mode by default
Message-ID: <4b4tg33lshbumj7swqs7rmlue6xxnybylv75h6x6fcki2xldtv@3rwo7mrm5672>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
 <20250722182618.30811-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250722182618.30811-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0980f255-7763-4510-64f7-08ddc94e11d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WkSm7ypNmufDxmwIC+zLostCs6Owj6sHqylXJgZ/+LaN7wQKvuS/+kmBF4MH?=
 =?us-ascii?Q?ecKdrpnD+Ft9D6J7HpO8GW+oHQoCrt811ga1j0lToj+749NKt4vbGEokXL56?=
 =?us-ascii?Q?IG9bpQX2Ngh75BX+zBcj+wgfF1bXL2NLrjn6+SG2ws1jCNDPDUJpWdSAwOcR?=
 =?us-ascii?Q?r/k9tTBMQAkiJJD8aY0Hb9I5SZAwGN1i0Ex94/HsGKmdKnh2hexXw6SypStf?=
 =?us-ascii?Q?in0yP7jyHLVR0cMm6VNiRpG9W9g6vG7vBbnprIwlT5SnOjN6TJkx5yMVTS2j?=
 =?us-ascii?Q?Ldt0ko/M60IW+b4V7TXRqB+r3b5HkNyl89YtHUHrslprixZDR0HfvgtsD0RM?=
 =?us-ascii?Q?myeHDKLS0gA95Z5C4F1otXVLvXP52wcQcr7YDcGJXN96O77+7zE0yCYyJQ1+?=
 =?us-ascii?Q?pvYuIrNdINUlwzL/Hfk935ITRtDA//mJWYYSrb4EzZ+7QTGhk8eTfMiWCufQ?=
 =?us-ascii?Q?QvYkWFGWvq+Eb8oL25nEQ9530FdXy9flBCv4mkuvCn47onZbf7pont3O1kjn?=
 =?us-ascii?Q?qIumQglvWdjOijX+XBvOqpfOwY5k1w0ggAY28J7ERRCTuYUW0b4mcS7u3ln0?=
 =?us-ascii?Q?xhEDiK14N1pAUIQzPqYhT+LADPBk6yduWJYw32qr8g6EWu4FvcH/tQZyCxJh?=
 =?us-ascii?Q?A+hkIK3mHicp0LgFBgS0fidafaqG98fUFxGmtzXdfpV1k7JSqWxGahLwKQhm?=
 =?us-ascii?Q?CMdQWueMjTGYkoRVmIlyxbMVpFWjd0/IaleE9rgDfhYsIpsA21PE45HvBJ8i?=
 =?us-ascii?Q?Gg8ch+OhNg0Yvteub2ci8YLc7jTaDu3023dHn1C095dk1xm+CiJbOWnYigxG?=
 =?us-ascii?Q?iZmYVYUqIhH4v6H+RwQjXzcxI7RpNJFezjyRwEE5hx999KWRAuJx3aRa1HCL?=
 =?us-ascii?Q?sLjhSlcaXbuKjqup7O07tayfKo62mjmIZrNsQx2N8nEmXkrctHKzp6T5RzfI?=
 =?us-ascii?Q?+l2KxJdJK0b3TM2TTyc0ajqhPqwDlzHZ5wVM2J+GIrcyhjBc0ubBhPv/qt5P?=
 =?us-ascii?Q?sA3YwsLbvSbyrKWw3P2AxVe7TrFUsMRzrTMIYbKMNOhBWmYDF0B/hUODANtm?=
 =?us-ascii?Q?q9ikGvQ2aRYFRk5f0DvyUA5p9YPw4mdwnU5bww81/h68EBsm//eZQs6iIpLB?=
 =?us-ascii?Q?1tR3sa+GMcA6XqxjT53a7JeJWFwtmkMs0BDYNZfc/ZGt6dnE1unVvDvDmBwm?=
 =?us-ascii?Q?T48GaP288+uJrSc1/ysHNXoBFQbBeva5fxgPRdgn7igepZwNNNrWkjk9nBmV?=
 =?us-ascii?Q?vE+IHoQFvIF82vx9geDY2J9UkEOH1CgS5q+w6mREke4QNotU7LxbWkkv4qGv?=
 =?us-ascii?Q?fsMn/htza1bfk1woeCVq5m+EG51lszx1o/AVZ1wNwnWxv3+lsUe1ZDESFgni?=
 =?us-ascii?Q?huvRVjcUNegoi1bSVVlFMroTBEflbQN96ixKachKx/fbN+rxcUPGdo0eZgGS?=
 =?us-ascii?Q?rVhlm+YrvMs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZdDGaruJITxG+deftCmtBiYYvTOiB1GXisyiT7KCQGJVqQ1VocGOqRTNHJD?=
 =?us-ascii?Q?PRBpxPYOzQcLtjjHZ/9Tz6ba6rxpUwqsWRqQyLZSv9h4OjT2F3OwElSF2Sz5?=
 =?us-ascii?Q?yUP5DaTBqgduvsBgMyVthiGl6MH6AY5M8DiX/ujCWOt2akZGO/Ud1X+4Q9uN?=
 =?us-ascii?Q?O8fK/AR1hW0DNUhlr4q+PUrBPXDVPNmWSqAMTqsufxr4dyJq/dEbIj8bYHzz?=
 =?us-ascii?Q?fabrpmJxwjD5jV+UbGpH5qnnkSOoew1O2LdYHgui7npuYSFlmzTyr61JXj5F?=
 =?us-ascii?Q?3xF9LgmVL0img+TJ5OBR2MhAMJfIzpFQ7wvRhC18iaeq8xJrvYE+CSL8Wn96?=
 =?us-ascii?Q?p6cnv0IPoN0PH2umGa5Ed6b2B2gVSkTmk0oSIIXUAfTnCHChyVhUf/v87Ir8?=
 =?us-ascii?Q?pegLHGfVit+rHD6Wp9Ki0D7XtFzwIuYQzOEKMlhyHrdbfYRjnJ17MPK6Nbio?=
 =?us-ascii?Q?6IbMWmm4uB+NlwdDusXKp9+SfKXKBzQDWy5Hk/dArJQIr2sIeB3622WEWUcf?=
 =?us-ascii?Q?cBc3gS6L6GBFWqe7x5i1yfUYEXFS7W5ZgeGtOjoOIbeI7uZHldKqMOgUcmTh?=
 =?us-ascii?Q?iu0MlR0wUGnQo/vMXyeA7y6AQJajVEdytGsUHafeEb/bNLX2r+Lyh4FQRPyr?=
 =?us-ascii?Q?zYnriEDYFZ+KPs9n4zTmZxH80EHJ+SlpK2WofOiWDWiGz7jWvEE5RZzxUDIE?=
 =?us-ascii?Q?L87aibXRWjg+ZHxocJXELV4+zH/A7JhSEbZ782nm1oElLfINfCJDkzK+ssRC?=
 =?us-ascii?Q?QC5/Oi+T5FyFG55RayBp41eYg8ww1YKlPj1fb8IjgENo1evukscONcnUcwoA?=
 =?us-ascii?Q?GwAKp5YOFV8OFeYzbhiWBfQY8Q8lHZ7z6IwxB58msIo98hx6QRtihPCBJD3i?=
 =?us-ascii?Q?RF2MzpN7PDMe4vAg6t+4ZqIYuw4o5P15TLowtmt8+XDwCfXu8Sglx0d6qGGG?=
 =?us-ascii?Q?hSIjCsdPVMjiagIufhBOex7XhgoY0vrWhMXK4trvrp/U4Cl7Pa9nN6iEHPd/?=
 =?us-ascii?Q?w3vBtkl46LckVJnfEiHJRRfQNNzGf2gefECP6r00g/UwOGdosInE3bZGzBr0?=
 =?us-ascii?Q?HXVAx8wD29eTcJ6523v9VIV6RCyLadbJ+rdIwLS804HDmN+O3dF6w/mFaIG4?=
 =?us-ascii?Q?HywIlWlIOJmZkLfom+CSy2BYYWAGtBZ+ZUfE+OMMpRwoZyczRGzC3xT4TJT0?=
 =?us-ascii?Q?y7E8XuQ5MI2ov1FJj4LzkEmCKkLWe4PLTgNCPPW810KSOecIeS4RsvrImnTD?=
 =?us-ascii?Q?xoh0PQUKGEAvBFJGaRLAvuZB6OX+79WMmF1JmxlZ1+t2MdkswUIWWxOwTFMJ?=
 =?us-ascii?Q?iziF9eeIdBpMhSqcRZoGr9Eg8PhIzYozhDV7iH33CQsFUbpEiaTsN+SSFTRS?=
 =?us-ascii?Q?kDBvXNPSbrOhT0Km+0ll8WCTdsmzAps+PBPO+HlK04W67FOcPRA8zYqdN95e?=
 =?us-ascii?Q?RL3dvYI7Ak6MMPqYq5LFagxBi8wjF/1k53f7uomq9KC3VAXK7iZoex7ptyDy?=
 =?us-ascii?Q?PA0eeUVlyhvrt+guKpo7QMpLr9T0EaLXj2EoRYq1Mi8vPqaXAVYkm+LjQTHA?=
 =?us-ascii?Q?nslBNk+UNyJQ70hp9edDApSQBuxJoODIDfpzze83RBXm1BH/2Z/EDTJZU1mC?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0980f255-7763-4510-64f7-08ddc94e11d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:32:10.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMbmI05Wb0CuXRfbxdfB7ZjWUiQwRvKEACtnneHkoQVHRKZVn/mPzRHnCbEdoq2D9PGhe2S6lirhB7dN0TPvIN+0TX05RLxxY8Sv+wcfVuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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

On Tue, Jul 22, 2025 at 08:26:16PM +0200, Michal Wajdeczko wrote:
>We already claim official support for SR-IOV PF/VF modes on PTL
>and BMG platforms, but by default we start the Xe driver on those
>platforms in non-virtualized mode (native) since we still have
>max_vfs modparam set to disable creation of the VFs.
>
>It's time to let the Xe driver support SR-IOV PF mode by default.
>We were already testing this on our CI, which was relying on the
>patch that was enabling it for CONFIG_DRM_XE_DEBUG used by our CI.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi
