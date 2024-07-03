Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A290C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 21:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D1A10E00B;
	Wed,  3 Jul 2024 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdcT1oBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861110E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720041547; x=1751577547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H/Oi/vJ+2/n1Oa+mHM5Aoofikae2UhYwmXpcB5YHPWU=;
 b=SdcT1oBltaezWalKfG6Vx21e3GIRNKGq4XmFKSQ88S8yVfm7m8pmtcIw
 Z3N49tpgqLjcvb18xgiy2KkCiWrzvp2Kc9eqhAqCVjRrN+wSIxlKihwfu
 p1Jf8gcGXXnGLOE43IxC/KI2zweYcSCj92iDh+WOYx/TR9QwX38CAJnAr
 a9htU4TuOcabBTk1X0rhd3JAKWmSRfCX70oF5Gz8+IRDbTbTvSaw8j1Lv
 rBsURmSyd/b6pVdVFLiSPTw1KSfLDkV9nZ9Xi0A1Dlzm0y+lAgOpcTvQ9
 t+w52yHCnYB9VIlVa3qZsmOd6IUi4I/zSsLtPAmmlugDx7/6IlZIHTb+D w==;
X-CSE-ConnectionGUID: ZwWps/xCTKeLMQgEd93lpA==
X-CSE-MsgGUID: nyCHXkHdQV+11ckUknI71A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28690096"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28690096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 14:19:07 -0700
X-CSE-ConnectionGUID: QwfpxY3HRzSgTQUwzkS0Bg==
X-CSE-MsgGUID: WIEvxlwUToitTxqoNV8t+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="69565509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 14:19:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 14:19:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 14:19:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 14:19:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 14:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3gIK1LSPpOEgKnCljq4CZy9gxWjPLgzsst0RWsdk0R9w6gX4LfS3x1fHqh10Skqq1qK5kna/8GXOg3DDOe21LQ0AJ0xLlBQWVLhA9c/vv2alJjAmHR5YNEhDzC/RgLYtdpGlIttPndoSFjWdjklHvIZjYEDipyxq5ml5qlJaypTJfo1c/+KU6KT3cwMfCcEhbNuxmv2tnR4Rq4qcLpttFIq5lC7HJ2a+ryDLgy34OMYGjmlByfAnp2Ss6LJxIioCIvCbZJr8gNKy/w6KIgWTraodDUfHywNt+u+hwt8owdAXh7t9EZhw15L6RlNuqlfVxybxoQAmrGUAbp3+GzhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUO6v1GEzoaVWLByjy5rPJAFY3kdocVNZWlOH3NMyZo=;
 b=M9jDBCTl6ofY48dLPfOmHCullWwIXh2mSLeK3SNIPe/qn4F/08gFbAIutDAt9X77REeY7GmVTM2QljUOiA4/ABO5MNGOmdnildxCcLEg60o5RFjMMfOSyOlYMzJptO10BlXiw1fCs+lDo+bzFA+UUay61Ik2xqKqqatRXAzM3fHMJpBx7c1tAs4jNb6N1uHvKhq2aSqr7b+EBZ0QcmWBS/A/q5oA7aVjZqYkNAuJaWzL7LaU4PYTCjTjtINzpIi5RRDXYa7gqYhWWNCzz6B6d8MLtcOOUfbbZslRnQHl76N6pRbSIwnHJeK4d+BUjurwC+SN/LVcp40B6OkqnpcXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 21:19:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 21:19:01 +0000
Date: Wed, 3 Jul 2024 17:18:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
Message-ID: <ZoXAQrNBCodhp20G@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
 <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
 <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
 <0a1de6fdf21f6cca1751792fd80cf1639b0c79d2.camel@intel.com>
 <ZoVc9gx7BASG3gT8@intel.com>
 <20e7ae0e-a3c5-4136-b007-bae1f9cecd45@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20e7ae0e-a3c5-4136-b007-bae1f9cecd45@intel.com>
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9da954-0e9c-4a26-f260-08dc9ba5c26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ta2SJg2n+MkDvtFiqrdHqhRf+C8Cr5Ny+8Ah44+9lPX+C/6Rr2T6eZzVQItz?=
 =?us-ascii?Q?ODFjjzgTpu9nRKodg212mketLLS9HkSbvU9ckjdl1oFqtajgebr8pRKGU9RZ?=
 =?us-ascii?Q?G6x5CNgaZ9fM5Mz3Lqt0CQ2uO/3X1QpWpFJy0u75T0/7mkQFBxkleosOWtrv?=
 =?us-ascii?Q?Y6tGdw5FyirtMlQsJfRKLFJeBPpHZKLt23pBz7/MMkU2B4w4csTJ799auFSo?=
 =?us-ascii?Q?/fpQxOoXKT4bn0dizTAgowpBVv6wOGFX+QVwa+hlo9y36Dw0tQsZU25jfFlW?=
 =?us-ascii?Q?Clu2G4t60WAZOSqLiRW7n6m7ulCVKLxoltYJ3TJEsulsW0NROfPNPv2wulyX?=
 =?us-ascii?Q?e7aO6Ks1DDzwH11wVMmxXjSJzWNmgTQfQJnJ/6AePgKY0Hcq9qMcMGZKD5rH?=
 =?us-ascii?Q?NQ72dDSzJ9/PtL7GsG9KHrxwYnidMsqDCMbxwpDoRis/reXmFk3Cgh2cbTlk?=
 =?us-ascii?Q?hZOkM/FljZTl9H+4baQxK/Dj1ssxq6519Gq9g1azU0lBmkEjfUoY/hoQwLCQ?=
 =?us-ascii?Q?RZCCcuarLtTxDr/GzT0Qt9LzR61TqHxdKk/SKKC76M6y8hk7zoyuRPgJBnq9?=
 =?us-ascii?Q?pBNp5QQWaBBcQFxBaYAmIE5G4Izi8luD+ByjDtw0wbJqG4kvzJDioB2NiTG8?=
 =?us-ascii?Q?pU4he/Yi74rpiTv+Reu1NMfVnV28S+GRffMbiOj0GkhrxGeWRDZEy1eq+J1v?=
 =?us-ascii?Q?39qIQP5Wdc+3P7LBjcF6VaZIJRVuavU/BNerFbmJdRCqS7cdwzmw+h36fVG+?=
 =?us-ascii?Q?m418o4yqZN7QrA2U3f5aK7LqlSgugDLMa6qzUr+1LJLf+PLYWa1aqqHQ/iTo?=
 =?us-ascii?Q?/5om2Ttqzdt4hdk+WLtrl39CMDqAiPbk2PcxLq/4EYX10/v5yyMVdElGy5qS?=
 =?us-ascii?Q?tFu/UtqbF7GA65k/V/cpBprqo3YUhN4Sf8iZBuVtWz7Ge194DMKBwugU3gXE?=
 =?us-ascii?Q?nuQMHvkRaODNGndXmO4KDjYZEsqO033HvRmpMuEABBON4FcFbe8nhOoI9QUP?=
 =?us-ascii?Q?GmAfJTQWKWKJi5Obcck26Us/KGckLqFP1qg0rjyl9F1EYP+pau9GzkodIyto?=
 =?us-ascii?Q?/+EQtDieMv0L1eaEmPMg2MkOZ4AkpPT32ls6Vk1BSZJNuFBIfoQaZFQ9OBid?=
 =?us-ascii?Q?BlY1fYe3CLBSNkB6vU2jzIxjcTWdoiACVp23QpXX/gjS7vcpimQh6AtMB3Km?=
 =?us-ascii?Q?/HjNk7pggxyK2xF1WAdJ91bvEPmoY29ShChnluDkwps0Oupszb4/oyh3FAO2?=
 =?us-ascii?Q?mXWlzklZtpQxRKcY87eX4rp0UFfwMth+S+3wfvwN8gk1mW8+7CEGI38qXN8a?=
 =?us-ascii?Q?zp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kAkbeJvw7lJJpQK7dZ8m3ZPknbQ82pJOSZxmxjoHr0HzrKx8cXtizvYFU7lA?=
 =?us-ascii?Q?K7RtFSdOWUqi5DcfjC2JQSVPzwRnGZnuwuDQ+wnmNQi7Uf0lVj4XlyE/iiMU?=
 =?us-ascii?Q?W+6EgYSo3sa1R6o3amvnVlitCB0AHN33D9dith4upTj+B8UcGJf5ukc/sR9W?=
 =?us-ascii?Q?CYnit0LjbROOnKb3453KGXwFgYmHXBS1Bvx8ySWAdIFt1oyWXgBIsDiUFm+r?=
 =?us-ascii?Q?s0t+5PWYsTVFUr8x+zYGo27q+duVXoaTbsHoakHYdKXD9dKJTVVlgHkE0wLg?=
 =?us-ascii?Q?/Rx4LGQtsHEpmovMxix2zFUTkxPIc03BRbWyh7lrRghpvulyxHFklV2MVtOV?=
 =?us-ascii?Q?CnPH/TlTGCRpFHtnAVJhNsiiWobdIPOEsD5rZwTUL1ShMCC/GTmPA8Fne7LQ?=
 =?us-ascii?Q?m/xVS84wAeBDjj2LswmGk8dvl67EVz7uuCJDty/4bteIAaMCN6+/gXth2PIj?=
 =?us-ascii?Q?ajr8j49odVdxhuI86EEVhrmbZGNX2B5Vn9HXHaHtX+Xikzaf7OoV+Oyq+1jV?=
 =?us-ascii?Q?SPRpT5EORRug+ES7MnRVK3FMtZhiEHv4sjIuGapvFvmNsXK2s1p6HC7P9A1F?=
 =?us-ascii?Q?Z868qNFKPnAo1ZoA9sIVYi/vgcK0HChQvuOhTVvTNu1qfDjQgnX/6TRd8jST?=
 =?us-ascii?Q?I+6I/bBZosLKl3tJNo2sQybh2ekQ6iNE3hBzcbNxDf7rkHAj3J3foL7XY+lo?=
 =?us-ascii?Q?+Dh8FHdR39WkhTWqDvBAkCf9z6YTMvifYceiFfXu4qE93fzYt74QpKf3slzU?=
 =?us-ascii?Q?2QnqA7fSK3A+gEtAmESzAmWgFdZ355F3D0OqvOhORxaAEB89Brc7SADF9TiU?=
 =?us-ascii?Q?zd/UdL6kwGNO3VGIQjmiNSRM28laCJwfrVJGlHTES4/8MPxyhi0Vy/npYwrg?=
 =?us-ascii?Q?1HOFjty5llnEuXeNgBxXESTU0bn2fXnJ2b3MpXkY/9BvJV4AV9RU9CMPMZwC?=
 =?us-ascii?Q?hFsynER8DWXHnn+JkK2dpvB4MGcUyKJm+GI+x6l/Rd61YuRITaygVPSt7v20?=
 =?us-ascii?Q?UZ50somWuor6+XK94ng5JYVAou4BgB5YEAh7QeYBlGcy2VwnYBdmITXDSs0n?=
 =?us-ascii?Q?hrDdV85H/i1D4JjV/erkM9wux91mTpSQF4KUT3un8PmK+LTGKayrq7lUTWG7?=
 =?us-ascii?Q?5a6XtWdQcl9KOsF8vsat7xkYkind7BSWmNt8VDbkQfeGLeWR7enUjT1yHClT?=
 =?us-ascii?Q?KpvmNIOS9Z2O+zGprv851TTOnJmohQ85poUWru+xjGcUdmL0KPG0dXooWAUx?=
 =?us-ascii?Q?dprJLE+DtJHA5Y4TSh+M3ByVbY7+ZPB3gsmbpXY15yXp5oFOVBZayFVcrgFo?=
 =?us-ascii?Q?TTrp7uC9qISB+WDKlNF0SY3zcF1Vdz1+QVzX0pLTOfexDY5B3XDzBs0BKUWe?=
 =?us-ascii?Q?/p9gbqTA0AqwtEFgn+u5wjueAEzKYKFodvuryx1XGNI5xtDT15BTHthaQc/A?=
 =?us-ascii?Q?apsCeLCvW5d3Sex+Fq9Gi9rYX6SUsK19sPZ0QpFd36eMouFg2BQubWLSGXrM?=
 =?us-ascii?Q?9Uyg8vFE9iniXs4QupBAOoj75QfT4mVXR0gA/T+uTrUfq3G9ohGJ56tVOV2H?=
 =?us-ascii?Q?oYPftI2Ld2tLHHGcgXGqfCXpKcY52c3zU1/G2o3RDK7zqJa0atjJ6cMOTQXC?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9da954-0e9c-4a26-f260-08dc9ba5c26d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 21:19:01.5742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQnI0qN4K3rFFIplkRWckyDHkmR5eu1tyDC32Fl4YOrWLBj4plux0jvF/f1haWiVDNdUR9gEusHA7PbMM9DoQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Wed, Jul 03, 2024 at 04:54:43PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 03.07.2024 16:15, Rodrigo Vivi wrote:
> > On Thu, Jun 27, 2024 at 03:27:56PM +0000, Souza, Jose wrote:
> >> On Thu, 2024-06-27 at 16:42 +0200, Michal Wajdeczko wrote:
> >>>
> >>> On 27.06.2024 15:53, Souza, Jose wrote:
> >>>> On Wed, 2024-06-26 at 23:18 +0200, Michal Wajdeczko wrote:
> >>>>>
> >>>>> On 26.06.2024 22:35, Souza, Jose wrote:
> >>>>>> On Wed, 2024-06-26 at 22:12 +0200, Michal Wajdeczko wrote:
> >>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
> >>>>>>>
> >>>>>>> Including line feeds at the start of a debug print messes up the
> >>>>>>> output when sent to dmesg. The break actually appears between all the
> >>>>>>> usefu prefix information and the actual string being printed. In this
> >>>>>>> case, each block of data has a very clear start line and an extra
> >>>>>>> delimeter is really not necessary. So don't do it.
> >>>>>>
> >>>>>> I guess the indention was to have one blank like between guc_ctb_snapshot_print() 'cmd[X]' lines and 'G2H CTB (all sizes in DW):'.
> >>>>>> I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print().
> >>>>>
> >>>>> but 'cmd[XXX]' lines already have additional indent compared to 'H2G|G2H
> >>>>> CTB' headers so IMO this extra separation line seems unnecessary:
> >>>>>
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: TLB invalidation time'd out,
> >>>>> seqno=27, recv=26
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: H2G CTB (all sizes in DW):
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 1024
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 572
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 451
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 568
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 572
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[568]: 0x80670003
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[569]: 0x20007000
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[570]: 0x0000001b
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[571]: 0x80000003
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: G2H CTB (all sizes in DW):
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 4096
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 1024
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 210
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 3068
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 210
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 210
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
> >>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      g2h outstanding: 1
> >>>>>
> >>>>> and IMO printing empty lines is just a waste of paper ;)
> >>>>
> >>>> This same function is called during gpu hang capture(devcoredump) and the output of that file has new lines between sections for better reading.
> >>>> This a old sample that I had around:
> >>>>
> >>>>
> >>>>
> >>>> **** Xe Device Coredump ****
> >>>> kernel: 6.9.0-rc6-zeh-xe+
> >>>> module: xe
> >>>> Snapshot time: 1715877420.647211377
> >>>> Uptime: 70684.605982665
> >>>> PCI ID: 0x9a49
> >>>> PCI revision: 0x01
> >>>> GT id: 0
> >>>> 	Type: main
> >>>> 	IP ver: 0.0.0
> >>>> 	CS reference clock: 19200000
> >>>>
> >>>> **** GuC CT ****
> >>>> H2G CTB (all sizes in DW):
> >>>> 	size: 1024
> >>>> 	resv_space: 0
> >>>> 	head: 978
> >>>> 	tail: 599
> >>>> 	space: 378
> >>>> 	broken: 0
> >>>> 	head (memory): 599
> >>>> 	tail (memory): 599
> >>>> 	status (memory): 0x0
> >>>>
> >>>
> >>> but G2H is still part of the CT, no need for extra split
> >>>
> >>>> G2H CTB (all sizes in DW):
> >>>> 	size: 4096
> >>>> 	resv_space: 1024
> >>>> 	head: 626
> >>>> 	tail: 0
> >>>> 	space: 3071
> >>>> 	broken: 0
> >>>> 	head (memory): 626
> >>>> 	tail (memory): 626
> >>>> 	status (memory): 0x0
> >>>> 	g2h outstanding: 0
> >>>>
> >>>> GuC ID: 9
> >>>
> >>> hmm, so it looks that we need to fix two more places:
> >>>
> >>> 1) in xe_guc_exec_queue_snapshot_print() we need to drop spurious \n as
> >>> well:
> >>>
> >>> - 	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> >>> + 	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
> >>>
> >>>
> >>> 2) in xe_devcoredump_read() we need to add proper decorations/separation
> >>> lines since xe_guc_exec_queue_snapshot_print() is not part of "GuC CT"
> >>>
> >>> - 	drm_printf(&p, "\n**** GuC CT ****\n");
> >>> + 	drm_printf(&p, "\n**** GuC CT ****\n\n");
> >>> 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
> >>> +	drm_printf(&p, "\n**** GuC submission ****\n\n");
> >>> 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
> >>>
> >>> and maybe also
> >>>
> >>> - 	drm_printf(&p, "**** Xe Device Coredump ****\n");
> >>> + 	drm_printf(&p, "\n**** Xe Device Coredump ****\n\n");
> >>>
> >>>> 	Name: rcs9
> >>>> 	Class: 0
> >>>> 	Logical mask: 0x1
> >>>> 	Width: 1
> >>>> 	Ref: 4
> >>>> 	Timeout: 0 (ms)
> >>>> 	Timeslice: 1000 (us)
> >>>> 	Preempt timeout: 640000 (us)
> >>>> 	HW Context Desc: 0x01480000
> >>>> 	LRC Head: (memory) 280
> >>>> 	LRC Tail: (internal) 552, (memory) 552
> >>>> 	Start seqno: (memory) -125
> >>>> 	Seqno: (memory) -126
> >>>> 	[HWSP].length: 0x1000
> >>>>
> >>>> ....
> >>>
> >>> then the output will look like:
> >>>
> >>> **** Xe Device Coredump ****
> >>>
> >>> kernel: 6.9.0-rc6-zeh-xe+
> >>> module: xe
> >>> Snapshot time: 1715877420.647211377
> >>> Uptime: 70684.605982665
> >>> PCI ID: 0x9a49
> >>> PCI revision: 0x01
> >>> GT id: 0
> >>> 	Type: main
> >>> 	IP ver: 0.0.0
> >>> 	CS reference clock: 19200000
> >>>
> >>> **** GuC CT ****
> >>>
> >>> H2G CTB (all sizes in DW):
> >>> 	size: 1024
> >>> 	resv_space: 0
> >>> 	head: 978
> >>> 	tail: 599
> >>> 	space: 378
> >>> 	broken: 0
> >>> 	head (memory): 599
> >>> 	tail (memory): 599
> >>> 	status (memory): 0x0
> >>> G2H CTB (all sizes in DW):
> >>> 	size: 4096
> >>> 	resv_space: 1024
> >>> 	head: 626
> >>> 	tail: 0
> >>> 	space: 3071
> >>> 	broken: 0
> >>> 	head (memory): 626
> >>> 	tail (memory): 626
> >>> 	status (memory): 0x0
> >>> 	g2h outstanding: 0
> >>>
> >>> **** GuC submission ****
> >>>
> >>> GuC ID: 9
> >>> 	Name: rcs9
> >>> 	Class: 0
> >>> 	...
> >>>
> >>> would that work for you?
> >>
> >> In my opinion this looks worst.
> >> Lets see what Rodrigo that implemented most of it thinks.
> > 
> > Well, I do believe that keeping empty lines in text helps
> > our human brains to parse the text. For the same reason that
> > I kept the empty line between this paragraph and the text I was
> > responding to. But also for the same reason that our entire
> > code has many empty lines between blocks.
> > 
> > Even for similar blocks in the same function we add some empty
> > lines. It makes things easier to read.
> > 
> > Mainly this reason was the main reason that drove me to add
> > these empty lines there. But that is just my personal preference,
> > and I don't have stronger feelings here. I would be totally
> > okay with the removal of these empty lines.
> 
> but to be clear, me and John don't want to remove empty lines between
> different sections in devcoredump, so decorations like:
> 
> **** GuC CT ****
> blah
> blah
> 
> **** GuC submission ****
> blah
> blah
> 
> will still be there (and we can even improve that by adding additional
> empty line to highlight the section):
> 
> 
> **** GuC CT ****
> 
> blah
> blah
> 
> **** GuC submission ****
> 
> blah
> blah
> 
> I just want to remove empty lines from inside the single section, which
> IMO could be treated as single paragraph, where you need use empty lines
> to split sentences:
> 
> 
> **** GuC CT ****
> 
> blah
> 
> blah
> 
> **** GuC submission ****
> 
> blah
> 
> blah
> 
> after all, in most cases, each devcoredump section matches what we
> expose over debugfs, and in debugfs we usually don't print empty lines,
> do we ?

very good points indeed.

> 
> > 
> > Also, I have to agree that empty lines in dmesg are really ugly.
> > 
> > My biggest stronger feeling here would be on breaking current
> > tools that are already parsing devcoredump. If this breaks the current
> > tools I would prefer to avoid that breakage and keep things as is, or
> > changing for dmesg, bug tweaking the devcoredump as Jose suggested.
> > 
> > Jose, would this break Mesa tools?
> 
> hmm, do we really want to claim that our printer outputs must now be
> treated as (semi-)stable uabi?

we shall not break user space... I don't want to break the working Mesa
tool. But if Mesa folks confirms this doesn't break or it is okay for
them to just update the dev tool and move one, then we could do it.

> 
> > 
> >>
> >>>
> >>>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> >>>>>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>>> ---
> >>>>>>> cherry-picked from [1]
> >>>>>>>
> >>>>>>> [1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> >>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >>>>>>> index 873d1bcbedd7..113e6348c6ac 100644
> >>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >>>>>>> @@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >>>>>>>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
> >>>>>>>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
> >>>>>>>  
> >>>>>>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> >>>>>>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
> >>>>>>>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
> >>>>>>>  
> >>>>>>>  		drm_printf(p, "\tg2h outstanding: %d\n",
> >>>>>>
> >>>>
> >>
