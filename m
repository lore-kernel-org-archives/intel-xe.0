Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A198C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 17:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AA110E0CA;
	Thu, 22 Aug 2024 17:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE5Q0psA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BD410E0CA
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347447; x=1755883447;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vy+fHX/4/eXm04VXYbSSYaW+8lpDaPPm0TkaNQWDmHs=;
 b=OE5Q0psAMo0GJ4b1ZL/Hu3w2dr+TQ8CeMpkXPXoMphHIu/6hVmV1ZsCX
 dHUAKhrrwA8eOnWhptlRHN6nKTxVJ1F5AD9Q7PuTeJ1mXF4RvvbGS1Crc
 LljwTJzGe+5XBzwH9bwvVum0G5C8P2vImTVyVbNMZDldPlQYGeUObJI+O
 Ii8JW7MRqfTDRknKbqbACjeA2AUFgfJPX4DPTvl5CVsklBnGxASpkXEqe
 aEjX2GrSOaxeTua/QSZIZzl4LCO/ftLB4ySOcSondg9l77E1EbZchkzOE
 iV/DQgKsXpMzpD0Y3SB26aiO98hcvpEAUnq9hYAWe7J0HP//7XX5bRZLa A==;
X-CSE-ConnectionGUID: gHlXNpIcQSquba6sIAYF3A==
X-CSE-MsgGUID: mvg1KnqpR62X82ip+J9oBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26532653"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="26532653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:24:02 -0700
X-CSE-ConnectionGUID: 1K7RnyHmRmSlMrPdGrDt6g==
X-CSE-MsgGUID: 1HhnTaYcRjqfSXFmk63pPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65859339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 10:24:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 10:24:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 10:24:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 10:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1CkmuZhMIDGF0CEfn1DnkhRMzmCxTPKHxromgzUqSMYQrpNgPRrw5Z4anYafAq2xeebgeCAAtU62RtT2D1EmpMXRur4ulnXQ8QLkb0KqVkzsxxC4mkrwv+AvzjWdylxRaaZO0ScmiIDAuPw6HNZXSmGgN7/BskK/cVcMmW6KTS23VdO8DGygaXugOP5243j9emh7+Cn6aaXfCTiYeAaWqKsrku68NedgJhA4pIleaUpgBEekeKmKR4+buf/igjf4UobMwugUmXIcYalfYc+DB89BsT6Xrym+80izaraofz4gofZKxBBDSll5tYSbM2QGhzuVRnggqPh79o16GFLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8nGkC9PyzMcVhMc7s1XiRocUEOumrwZFa5dZ2Ju0ec=;
 b=wPnPkt4hBdbnacZXkm1oIXBvJmvXykW9pA4RcCYTdRzAyWEDHfGv2S4iR2I8WbOAJQMB3kDmZTmkjnwBrpk6LkfdyqqswmCbA0n9UOpJ3UU/6dK9N09s/yerHkSsiVCiE67r28rUOKxKQN85FwFfudtgvNGpQX4Ha/x+mMPx/QwUnnhjpqXJlF9eXZPaY5fQ8dmAirdWM1EGUJafcasJpvbm/mr5xU8OVxg6ax4i7q80LajKGgnY5zrHLrZO60Mhi82XufLKnc6vU0OSU3oNy31eIf+mkz7AToALcKUxE6An6Gi6DgpDLb79w/jQ6EOZ57lXTGThodFHCl8z/0An2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.18; Thu, 22 Aug 2024 17:23:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 17:23:59 +0000
Date: Thu, 22 Aug 2024 13:23:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <apoorva.singh@intel.com>
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Message-ID: <Zsd0KqGme2kci1tk@intel.com>
References: <20240816080355.897256-1-apoorva.singh@intel.com>
 <Zr9bjsY8zcnciW0M@intel.com>
 <a1d7a803-e365-414c-a9e0-1407f9320b8d@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1d7a803-e365-414c-a9e0-1407f9320b8d@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 204db116-ba15-4d8f-bf3f-08dcc2cf354e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hQw8ELX218ecwezywlwsllDWC3IjVSW4S4LkQjYdBvOxA2oOzCXV767kak?=
 =?iso-8859-1?Q?Lw1zcuzDM7S5TDNgaJ1djLMeT5xoeIpiFF5fSlZtomztv7pq7nikcvhdAz?=
 =?iso-8859-1?Q?4bU6nRNnj1w3DrdqDQ39Y3EfXic+a/auabZRAjK8Yd9FWAVSUavankK7kL?=
 =?iso-8859-1?Q?gb8gR7NHbEMaHsET5K3Zx41AVgSpamNUKOXr6j81y1gFx57Eq6ZE49R6v8?=
 =?iso-8859-1?Q?n3K+yqvg0Z43y5Nm4sSZBpNMC3hZRl4/GMr5CKRh8wYC9FBsPpR/4W8gJq?=
 =?iso-8859-1?Q?giuGMnjOt6Sobia8mkKkCrQvHT/0HHH33xr66dk3Mn3WJKsY1LzEg8FWIN?=
 =?iso-8859-1?Q?MyMTX2nB6MgIz7cvUemLPzekjqOjfTm/M+K6BsiWc/8dYPapa527LHsKz4?=
 =?iso-8859-1?Q?YVjdO6ElJCzDJO6AGeOH/apx/sdHiR6zTNDecmZFXFAdTz2CHoo3KtuoSw?=
 =?iso-8859-1?Q?iuUn4Vb23N7Sv0noyBknyp7MmGUYNXZUIMhWSRm3j+m8gp4KjHIzh9LqYa?=
 =?iso-8859-1?Q?dOvPtLM+4EMxrHYoRKhDzs7VHO6IjcNR91fR9QDOIYtM50g58by8G34uu+?=
 =?iso-8859-1?Q?4va6Ai3rx+nibPzk1UpEPKBtQP41zoj19O+qG/Vj2HP6FBXtGaQ+P4TlIB?=
 =?iso-8859-1?Q?mKaEHOP6lQo5PuyJsbsWUgiPjVjfGwOoxaB2kenjnmNSKWnSQ/e8E0kivN?=
 =?iso-8859-1?Q?KdFr0dhPDlpaVLGHe1pFdMjsUuPWK2H+E2b+KeYM4tQ+nci1COQ2wafFfs?=
 =?iso-8859-1?Q?dUv3xwM/sFGLHb3uX7+H5elyHr93ltLCTRnuv1MCzisclw2W0OzJzmTQ9E?=
 =?iso-8859-1?Q?dJBAt7vB8xJ+SajdG2fWRJx6JF2pl5I0C5nTKXyQVOa8y3egy0Zxhctd5j?=
 =?iso-8859-1?Q?fcn1aoN5x/eGG+O+XSk77Qn0FquM1RNCHglZEv40Om0jv/BkGbQo+3OmLJ?=
 =?iso-8859-1?Q?JJ15rXTys/aMU8/baiTgYqRYEZjrGqktN9Pe/+fEjruh/kkvymE5PLFs19?=
 =?iso-8859-1?Q?hH8mllhqjZUXbonPskTPOtRpnSApKwQXr2IbZajv+j3DIy/QYekuXWTnhZ?=
 =?iso-8859-1?Q?X//YaK/Z+be18CJVf5+Qq5JME7thQ512lXJa6/LVOsUdrqatfwANFgaMUv?=
 =?iso-8859-1?Q?C4g3ZurrLud7PIr2wX/EZ+VwkZ4gQecnBCYr/hVIKtqoXbpls12j+2pMaq?=
 =?iso-8859-1?Q?ZGt2/a9aXkKSnzMQMjl+7mXAilwAKr81yyvLsnwy3zCnjB1VjDSQ3yNkwW?=
 =?iso-8859-1?Q?pwt3ky3iAvtm7rrS/9O8tKgdM+gLyZ5UJDdcdnERD5k7y7WvhJ8D/b2Q54?=
 =?iso-8859-1?Q?UEzdJoxrQfskdyZeaEOAmRWVtJs9afTJY0YF1lnRAVAqzNCpUJ6QnDCi6x?=
 =?iso-8859-1?Q?KKcfTHuIbu9CFUPT/VsvEgvT4i1kobGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9Ei74dsHiRzC6UYs2hmquONYCqjFPSxBz9/aP862bIt+3vJxn6evDTPFzZ?=
 =?iso-8859-1?Q?mV/QPUghzDjfua+c+rpM/gGm82narw7fiBbBJKA6vNzelSBFHUi/Cw9uYr?=
 =?iso-8859-1?Q?zJcMDEq+9dDNJLv0EUagh5XiK6fXG5uzP51B81QNg1IcbYp7qwiDr/5ZdI?=
 =?iso-8859-1?Q?yGnTyZCQpsoNdER3M3mwzS622nSYNOIFh/gZxyimQnUOm588qPIyqXAEdl?=
 =?iso-8859-1?Q?JYkXu3UQbOgyF6vy9inxDZ2LFsnSCtOxFTVjeItTpSB4qdnqKHrLxEMwtv?=
 =?iso-8859-1?Q?pRcjle8o0hf0WM0GakhNQ/HcP+b6sgNi38l8/r6hALDoucY8uVnHkWBCw4?=
 =?iso-8859-1?Q?0J8VsD+ta87/S0Vo0rYHpFaMnKFGw5PaX1vfqEu4QK3OmsBd2nOhOtSzHG?=
 =?iso-8859-1?Q?emWrstb4xn+eJcaUXtqqrlFEPPc9MOA4vxD/mXGDdiDKDcjKeGMMANqIfs?=
 =?iso-8859-1?Q?g0Q/C4H/vsa/BK+IhK2poxaI8PAv4TI9CuERgK1/5+2O+cbRGzWR+VPA0p?=
 =?iso-8859-1?Q?9hrabavYJMH7gD4nAN7UQBtjkvfgNLLJOVLZM2gfcriYf1AwMwfDRU98X0?=
 =?iso-8859-1?Q?BOZFP0Hq9M5vuK4DZCEOgqqNaaSeowNFClypvSQdMUMwKKkNCURVaKkuuC?=
 =?iso-8859-1?Q?eiv8QWZwAc9xJlhrz3F0zq4NHNPe6vicXsTJ77tbScBQd+K7TGChT5uZc4?=
 =?iso-8859-1?Q?aovJ9vCF3SmVmzftqAEG7lnAN3aB7lLnVYpCjUBXMdba0btiOd9YYd4XIg?=
 =?iso-8859-1?Q?g59V3NNQ/4d6CD8lkPcgnht3ZEjtgcN+CjcAMLqsOXq8HrUrvvNxawcGxi?=
 =?iso-8859-1?Q?60nG1cXl3BzOYV2F5jjArU4m0JE7V0Mwa515iPIU93fW+Ppz7aSEI2SW6h?=
 =?iso-8859-1?Q?Vz19sDPczAH6Z6NTUSr2QYyHWT7S36JgjrL8wySaEEK2cQwNqfECQSHDee?=
 =?iso-8859-1?Q?2Gtao3fBXJUMNptgFXP1iChnOj2MWNUODJv9dIzfIyEqKYzkdstQylU/gq?=
 =?iso-8859-1?Q?FwCCCVUnOXipKdpyFSBA2tgjtZFXu5SyzNPVMSe+yLMySfcPggTs+FgjYM?=
 =?iso-8859-1?Q?2voilDoy8lXc708pwo0DWBMXNb+tmpL1TQVNCECH3JGPYuV+//8B6vFyfM?=
 =?iso-8859-1?Q?W+EDwjLOsGuQp2IT0G6U5JE77UN58UKJF7PO4GyGBuuYSD8NrehowDLOtx?=
 =?iso-8859-1?Q?DRbcUy8bknelRAHsJ5aA0RSs3LZ+fRNokjam0rzWwBzMIpxqePxgGdnYea?=
 =?iso-8859-1?Q?fkPn01KNlC8OBwJ1t1OsJs71rEGI1wF5UpK9bhK54AWRWw2MyKJqX44oh+?=
 =?iso-8859-1?Q?2z1Iczv3ome63WXjJDsf8K8HDrvsF90YtW4hHoCP6m9cY+fiSju4mu/9PO?=
 =?iso-8859-1?Q?vo+MCYa+qq+ndcd+cD/YoWWUk9Daejt7X6irUN5dLuDalTd9qvxR+5zVUo?=
 =?iso-8859-1?Q?8zaCzz3lcU4URPYCKZnKMkO33pO7XiEtaCE6v9UWtK7CQkblezTZzivqJO?=
 =?iso-8859-1?Q?+jTGaIGan9OakSXjRS+hpLbVQf+Uom7uUCpQ+el7dvZVxfccJOcU/9+v/M?=
 =?iso-8859-1?Q?E8J5ViBXYQqVZ5sBptRTjTDNhAvR50rDmIfL0fmLhVNbBwvTpHFhyJehkg?=
 =?iso-8859-1?Q?HUV64qUXtoLdpjYW/qFyK7+n9dZyr/PUu4BKHiafDHe3f9/moR3+xmwg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 204db116-ba15-4d8f-bf3f-08dcc2cf354e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 17:23:59.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TI//wNF97PneU04lM+MPUgnbCMl3EegqQJ+kNXl7f570oOxjI91M3a2uIZvjbqo9qTtJm7iWTgOZLzygLnv6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

On Tue, Aug 20, 2024 at 11:43:12AM +0200, Nirmoy Das wrote:
> Hi Rodrigo,
> 
> On 8/16/2024 4:00 PM, Rodrigo Vivi wrote:
> > On Fri, Aug 16, 2024 at 01:33:55PM +0530, apoorva.singh@intel.com wrote:
> > > From: Apoorva Singh <apoorva.singh@intel.com>
> > > 
> > > - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
> > >    its already been taken care of in xe_lrc_init().
> > I'm afraid this is not a good reason.
> > This snapshot capture is coming from other places and apparently
> > with risks of paths where bo was already freed?!
> 
> 
> After taking another look, I just realized the lrc bo is always pinned and
> as far as I see, only place we unpin and free it,  is when we destroy the
> lrc.
> 
> Am I missing any condition when xe_lrc_snapshot_capture() can be called with
> lrc->bo freed ?

if you are confident we don't need it, let's kill...

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> Regards,
> 
> Nirmoy
> 
> 
> > 
> > why is this check bothering you so much?
> > 
> > > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 974a9cd8c379..aec7db39c061 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> > >   	if (!snapshot)
> > >   		return NULL;
> > > -	if (lrc->bo && lrc->bo->vm)
> > > +	if (lrc->bo->vm)
> > >   		xe_vm_get(lrc->bo->vm);
> > >   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > > -- 
> > > 2.34.1
> > > 
