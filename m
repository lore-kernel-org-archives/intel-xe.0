Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBCD3DEA0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42710E972;
	Fri, 18 Oct 2024 17:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aV0K7PNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8757310E964
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729272986; x=1760808986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3+sQYtA1lJIMC1aIbI4bA/kvVEEif2VbUsbV6zUTwm0=;
 b=aV0K7PNwmpaT7oNa0c7N7DKdgQcujlUmZ8wU8rdbhj9Ghd6Txk9UGg05
 4LOKBsE8OZINyKq2CDoYZFLGEbPoT7ZMgLmv3gZsSy+43XKBV8zp/NQ6d
 Tt4bCAw4koYo+xwyxk3qPBdJZxKy5fJwRL04ac5kLAplS4FOXlcyxEBQK
 QLwYF5edGJZS3nQuevDLOp+esyu3tEESWuKWvGrPNebXPG4IetzIr1r4K
 IYqmLXZx9LDoHZIhE/E9H8UYuvbD9W6GyZU6FI1qqm5yXB6yLVMu0MaMJ
 9mn4u0qBZVV5Hs2p/BMGO4xgwvDwJ8OR3bx4iQpmARPl3JA17yUEMpw1M A==;
X-CSE-ConnectionGUID: Q0IqQ6uIS2WBqeZZkvj9aQ==
X-CSE-MsgGUID: XDLoZvzpTDyyFMwT0X9p/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39439633"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="39439633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 10:36:25 -0700
X-CSE-ConnectionGUID: MdSiRyylRhesOR5nflNDAw==
X-CSE-MsgGUID: gWt8R5gBQ16jbauKL4ivPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="83556843"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 10:36:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:36:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:36:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:36:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 10:36:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 10:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Moy8DKk19xb1sNxeLnb2O0ksk5Iag13Ic33qBG3d2gCRaL+BfV2xcErKVkomrx5q1nFQps50wowAuCj/5Mt/ij+80j5I8D5hHANAENaL9kdpwX4UImOmdxMK0PIxfwSft353mVPVfNmEBzDo7PJjLx17jstbs98yFd5HJz+tkBG0voU8GseM7rcvK4nMoK0N9ajBNc5sq80EEaqNJGsqHS6FtBnFGB/0U+Pr00jvGtgqR5WdjB0tFkIV+2XMr6NsysUh0bYUc2pZlLME0QQY3LeMwOfp5i2d0CxvLv4ij1gVRJeftH2gvMt21Oxc7VoDbA9bPEpksU6dLnaUKGRK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2QbP//RVVtrNScl21zRPGdGhGjSvESvvaz93kItG70=;
 b=tYhZnFvqguauWqaKkWK323aSiVOHelJ5e6DKN4sBLCfNFR9wQ/u4zC2P+3Y35CS6YRDbnsL2I5AZz60bPjIZtuGSDbw3ArOnYhK5EViZIrFLqYYcky+oUODuF8ylnyA/K7t3CMLtAv0t59wU2eotdg/fGxl01Cofglc0jFMPeK8Th/J7z61TaJQW5mmDv5NW0TpkXKiMC53DgkxMt2a8R316+x2kNTJZaWOcWT9GAP3EW3eZFv171gMvRX0XFaKI4fKKfO+XKRQ0gsDExuHpvTPFPGdh8hyGO5KLz9CP0WMad+9K5QEaICcXLjqFg/hwGsRnTWcqeBT7GHlYEynxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 17:36:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 17:36:20 +0000
Date: Fri, 18 Oct 2024 10:36:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Message-ID: <20241018173617.GA4891@mdroper-desk1.amr.corp.intel.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
 <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
 <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
 <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
 <d6876566-1385-40b0-b4f2-7d5c67ea4367@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d6876566-1385-40b0-b4f2-7d5c67ea4367@intel.com>
X-ClientProxiedBy: SJ0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 909aed59-90aa-41e1-d735-08dcef9b60f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FpCdDdrq3bsqb/xPWyFFmpKj5DMAS/xLcKygF+nobHR4773OSOz9RfplLGHD?=
 =?us-ascii?Q?IURoQTHuzgtXbOUT3TW7sLdf/DilIQF0A6eBiZkOmKk1gn1R/PswTKASywz1?=
 =?us-ascii?Q?jm2QBdd2OTZ899920YJzLUz53jDtLgVbxLp7dXJ298F547P2kuHmGfqTbs5d?=
 =?us-ascii?Q?YjdFdxnXFrInoqhjuBFyIAiEGd8Sifw/5E1Z1qpE8EEuG4TXOkUQfb+CV3TF?=
 =?us-ascii?Q?yy/h2k5pXG9ejaXy/Huu6Q3k/vTq+bNUl1okjieTxmpWz4J07Pkbf8nU701c?=
 =?us-ascii?Q?mHz7m1Qq35T0xWTwtsmaEEHiGo0Sm2oBdI+qfYLdm+/dZHc+JNEqgst6WyPo?=
 =?us-ascii?Q?VIac0+4RMOI92DOFltX9/UtcrSd1A+rRmJ7S84rRu5/t/0D3tE48f80hqQE3?=
 =?us-ascii?Q?HdxJ6RFDHLGdCGPpf5uRIwi/8ge+AEpJu02GXDQy2bVKd7tjUtvnBLHAPpOu?=
 =?us-ascii?Q?Ysel/AdF5zKSIB5EmU1TeCUKEyrr2WJUuuJS4FrkL9NplDG3Ry6lR9ZW2g/q?=
 =?us-ascii?Q?RIWS3wPl1mpAXoB1Ny7kMFNGJtz8qGA5+UfyoXy1/DgyFK/35LxUjy1P5pr5?=
 =?us-ascii?Q?vyg8irQsmHjQIRo99rHZq3JlN9ZmJJ1tR9f5cL+A0Y2tpO47ECzgALK5pIaO?=
 =?us-ascii?Q?1sqfwOGmpE3xwtvvpl/Bw1amCKHx3qKxnegIOtBGzQ8hHm5RJ+h9PgnCdVd0?=
 =?us-ascii?Q?/NOAD859ZEyHewPnMfUFBRWmHiURBwe8d2uImdaRCW56Y5BIwW7KbkNianel?=
 =?us-ascii?Q?xBFkcjKeUDxuC9RsGiAOTwy25oaDZNzFfzoG3rHFkZKPdW61TCysaB6KcY7W?=
 =?us-ascii?Q?B8Eh7+OUESOwSGWiv5wbgLIu0exijfIev4RhLI1wZV280J8760M9ZlgjH97y?=
 =?us-ascii?Q?AobnV79U1F4q9zqzF9xfz2OMP7L9LxTHHyBVKUICwmLos4h56f18VV+wfHPz?=
 =?us-ascii?Q?hgPB/74e0mlxf7exdKYzSZdJRLGVVkKX6Yywwfwd0Nxpmwlsxr8n5geIQx7Z?=
 =?us-ascii?Q?1sIV3ncKfErL+euSJgAJKJpGJ6RsWqcpFXhbGJLF8FPH/ZAYY3+oc2F0jOm7?=
 =?us-ascii?Q?1DJXZ/Lnq/thnj9pRH2BJxvoxfo9gpZxEpJHgUTf9ST27Gxs8Doa8aGhmpik?=
 =?us-ascii?Q?PyBPzH2UlmHMuq7JSbuqk4KMnBogcyuxrYXBce/GKwDZIDBxOi9GocrmnW4L?=
 =?us-ascii?Q?zfQOuTDisKwQvVbU5yyhvv11J4qksAotY2WfMMl4x5gXTdH1ELogjjP0xH93?=
 =?us-ascii?Q?Z/rwJr8HBsE1WJeEF1hb5XmnauXLiFPlg17gwXlp4omkSt5yxfucgrRSmUdR?=
 =?us-ascii?Q?vQ20EhLlolKjEaTYEOgyTwGr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2yhVCk6iU0yUZEL9E2rb3mfAAkcOJz6pIdIppD8HTyDjLvNdJSvuIZ1c+NeK?=
 =?us-ascii?Q?+gsWg0+W0BwgmjiGQs6djNETmOrWPIPafg/3RCU2IU7g0UYWnKsZvcznf2k3?=
 =?us-ascii?Q?nYPugH6TnT6/xMnbf78u6pHZDZFzzyCoFgm7inS29JykSy/IoPl9ccI1auSs?=
 =?us-ascii?Q?6YH4Sr56Q293OPCEK27TEUUS8RBU9q1QQygFakI7xuJNPMonuxcaxtBYg9E9?=
 =?us-ascii?Q?gc2syYQMjfkWBvPUUq3K83w8JpxCjBeBLaXQCWdoFx7D4GRbh9dxPO5mufRA?=
 =?us-ascii?Q?ed065anznq1I35ni95ZnXj+FlDzuXO9/b6xk13VdC7y7lCxW67eM6I/DHrUs?=
 =?us-ascii?Q?dY14fHByD7m5GcDUEVjEIt4z3/CopgKnNSPUYPKwlOf2ElLie5lJrhi42SAF?=
 =?us-ascii?Q?TAhhZJzK69mxD3hanVltFSl0qn/nL8hOOYwk0Mupy0kh/nJjpVdVBR20sEE4?=
 =?us-ascii?Q?kO+QpbTP8yDDRh9v4kAym0hCID9uTEy+DRPTPOZvrlo+uAexxicZAPDkn7H6?=
 =?us-ascii?Q?pQ7Zv9xNtmQEGBss/04uYVD2JzUmJYUNclV4MtcBRTHd6Rn7OJFHJjTKmpOS?=
 =?us-ascii?Q?GmUpNlcZcU1zcbpoJRkFQ0Oa+1ihWVilq9CR4csbJlB+V3croEC1Z+B2Aaj1?=
 =?us-ascii?Q?ozMi8oT/Gf0MEebWMoV//d3E61dYyYyP14Y+G0MO2QUNdXvdsbyhyC2gJQdj?=
 =?us-ascii?Q?76fWdMwBqU7HyhpwxmHfv69UicTpQUJc2UFy1ZRdq2o5Vy2x/ZI/TAFthjo6?=
 =?us-ascii?Q?hasUlzBOLvVPBABfIOiTFkfvHIfyg+1xfaTiiY1UWYKtCWIVpawrlWBgZaRN?=
 =?us-ascii?Q?NMAfsy6wVjJkfcsv24MNeBeeod0+kii3Ymt0ed+Osj9AjyZfSarXO8yze4Et?=
 =?us-ascii?Q?8uN1A5OxgeTcaTQdZFTZOz9kUAIFJTtQaalvAJ24712bfu4U0bR/JYe01QDU?=
 =?us-ascii?Q?iXRic62S4fK7AThfxpUwbJbMLt25wn7K622GkQd075IThPQlFNoh3IO1QKsF?=
 =?us-ascii?Q?ohz1W4E6SNPXZOO7QftFSTrQMN/zw0oZ9xm9mphEbqPu4Qjzo2ZHfm5KhJk7?=
 =?us-ascii?Q?IsGuKuDZXtXkZKarW4ei9RWbG58I4lY8JW0vbjeNLHNVMjdW+Udp9A/fWr9w?=
 =?us-ascii?Q?4m+aTZUVQYVxgzBPcyPnd7+Zjkj/nE89uRibTA31iGZ1z7IHrlIwLe/72ORG?=
 =?us-ascii?Q?mQnF6atlDm4WsuKFQspSjNcV77O9ZJtOo/8LQlUNs6j85MazWNtvkThoZK1D?=
 =?us-ascii?Q?bnhD3vKhyhjo62tCLX/IdReIoOWMJ6BUUrV/ATOkJOWt/aKa17ijtK/N0dTU?=
 =?us-ascii?Q?FjRQVW7OFK3C40Yu4n63/DzPH2mHbh08PKjDLkqamMFATs5BO5DTUlhOd4ij?=
 =?us-ascii?Q?zwb70hd/yciodHZ6mVRxbHlrSpaY/R0U4IfitfgSxZQFNQIbcFD0jW4PJ29w?=
 =?us-ascii?Q?pdCHE+R5B1Gvy1xtXpKFxiXBS7eHi2hcAipGOF6xH8sHNx1yMAYeQdFl/V14?=
 =?us-ascii?Q?pmPG/dBKkOgftuxt2T9pRg5Y7pxDuZbgLHxA9Tba6Wdst43pmbQD/kp/RBi2?=
 =?us-ascii?Q?pveJoooMTgEXzutmgNWHoMJg6GioVvJPuTEaa/XGUfCNoyZoUgFoKVsqt+SH?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 909aed59-90aa-41e1-d735-08dcef9b60f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:36:20.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhXgEWjD8orLfLK6Nlz+dULhCMjv0GV18N/n+47qrGpvCBh0ChwcQyol7nrhw7MF6eL08Cal5LLo3vuEx0K2SaQFVKNDI4AEEtGitJ3oqOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

On Fri, Oct 18, 2024 at 11:14:40AM +0530, Chauhan, Shekhar wrote:
> 
> On 10/18/2024 10:34, Garg, Nemesa wrote:
> > 
> > > -----Original Message-----
> > > From: Pottumuttu, Sai Teja <sai.teja.pottumuttu@intel.com>
> > > Sent: Thursday, October 17, 2024 10:24 PM
> > > To: Kandpal, Suraj <suraj.kandpal@intel.com>; Garg, Nemesa
> > > <nemesa.garg@intel.com>; intel-xe@lists.freedesktop.org
> > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
> > > yuv
> > > 
> > > 
> > > On 17-10-2024 13:35, Kandpal, Suraj wrote:
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > > > Nemesa Garg
> > > > > Sent: Wednesday, October 16, 2024 12:55 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > > > > Subject: [PATCH] drm/i915/display: Workaround for odd panning for
> > > > > planar yuv
> > > > > 
> > > > > Disable the support for odd x pan for even xsize for NV12 format as
> > > > > underrun issue is seen.
> > > - Probably with the discussion and the latest update to the patch we should also
> > > update the commit message to aptly reflect what are we doing here. (We can
> > > remove even xsize part or maybe give more explanation on why even x size is not
> > > being checked in the patch)
> > > 
> > > - We should ideally be using the workaround lineage number in the commit
> > > message.
> > > 
> > Sure.
> > > - Also, seems like NV12 is not the only planar format, should we check for a planar
> > > format in general instead of NV12 specifically?
> > > Cc: Matt Roper
> > > 
> > In WA its mentioned that the issue is seen for YUV420 format so that's why I'm checking for NV12 format.
> Could you please explain me:
> 
> 1. Was this issue reproducible for Planar formats or Semi Planar formats (if
> they are different)?
> 
> 2. Did we check it on only YUV_420 or all the planar formats (if the issue
> is only on Planar Formats). If it's only for YUV_420, then can we have
> commit title as "Workaround for odd panning of YUV_420..." or something like
> that. If not, then can we test it for the other formats as well?
> 
> 3. Are YUV_420 and NV_12 formats the same, and is NV_12 a planar format or a
> semi_planar format? (drm/drm_fourcc.h makes me think otherwise, correct me
> if I'm wrong??)

YUV in general can be stored in either "packed" form or "planar."  In
packed form, all the information for a single pixel is together in
memory, then all the information for the next pixel, and so on.  I.e.,
the same way you're familiar with from RGB formats, just encoded as
luminance and chrominance in the case of YUV instead of red/green/blue.

In a planar format, the components of each pixel get separated out into
different regions of the framebuffer memory.  These are called "planes"
but that's a heavily overloaded term unfortunately; these aren't the
same thing as primary/overlay/cursor planes in the display controller.
For example, NV12 is a planar YUV format that has two planes, so one
region of the framebuffer memory contains the luma values (Y) for all
the pixels, and another region of memory contains the two chroma values
(U and V) for all pixels.  In general there are also planar YUV formats
that use three planes instead of just two (so each chroma value, U and
V, gets collected into its own plane).  I don't believe any of our Intel
platforms support any of the three-plane formats today though, so our
driver is mainly concerned with the two-plane (sometimes called
"semiplanar") formats.

In the Intel world, NV12 is probably the most common planar YUV format
you'll run across, but we do support others, specifically the P01x
formats which are also two-plane formats with the same 4:2:0
subsampling, just with more bits used to encode each component.  And
since the workaround description here says "YUV Planar format" it should
presumably apply to them as well.  You probably want to use
intel_format_info_is_yuv_semiplanar() rather than testing against NV12
specifically when determining if/when the workaround should be applied.


Matt

> 
> -shekhar
> 
> CC: Matt Roper, Sai Teja
> 
> > 
> > Thanks,
> > Nemesa
> > 
> > > Thanks
> > > Sai Teja
> > > 
> > > > > WA: 16024459452
> > > > This should be right above your signed-off-by The rest LGTM,
> > > > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > 
> > > > > v2: Replace HSD with WA in commit message [Suraj]
> > > > >       Modified the condition for handling odd panning
> > > > > 
> > > > > v3: Simplified the condition for checking hsub
> > > > >       Using older framework for wa as rev1[Jani]
> > > > > 
> > > > > v4: Modify the condition for hsub [Sai Teja]
> > > > >       Initialize hsub in else path [Dan]
> > > > > 
> > > > > v5: Replace IS_LUNARLAKE with display version.
> > > > >       Resolve nitpicks[Jani]
> > > > > 
> > > > > v6: Replace -EINVAL with hsub [Suraj]
> > > > >       Remove src_w check as not required
> > > > > 
> > > > > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +++++
> > > > >    1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > > index e979786aa5cf..2d7ca6e62926 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > > @@ -1031,6 +1031,11 @@ int intel_plane_check_src_coordinates(struct
> > > > > intel_plane_state *plane_state)
> > > > >    		 */
> > > > >    		hsub = 1;
> > > > >    		vsub = 1;
> > > > > +
> > > > > +		/* Wa_16023981245 */
> > > > > +		if (DISPLAY_VER(i915) == 20 && fb->format->format ==
> > > > > DRM_FORMAT_NV12 &&
> > > > > +		    src_x % 2 != 0)
> > > > > +			hsub = 2;
> > > > >    	} else {
> > > > >    		hsub = fb->format->hsub;
> > > > >    		vsub = fb->format->vsub;
> > > > > --
> > > > > 2.25.1
> 
> -- 
> -shekhar
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
