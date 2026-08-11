Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF6C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966010E3A1;
	Tue, 11 Aug 2026 20:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCJx5JFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306E910ED9A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478995; x=1818014995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8RQgPaxg96ZTdVncyt6bnAfhX0i0rvkSlTlhtPpUVhw=;
 b=CCJx5JFR7rjOI4XaCHiZlotngTQh3YPrdaMiMGcJnQHNqSUJQB86kXnE
 7HhLnCCaCHkV0TqPolizyMzSXdCZ2DYGkbHD3QU2j4Ijy4l5Ph7cTPhZB
 6ouj/nvG3ewlXEerAHXf3sjY0+g/hdNZL/Gn4i7OYebNJa7cAaRIigdAB
 1q4Wk8lcJmnkvjZkG40/s53Uj0jE0umeLnPynAaTlveH2xEMlP82Ius7M
 dTOaHbb9aTHi7aEHPgj8xrM2G1WFLa3bC0572a46t1GnDKD6kpU89Zu+h
 TsrU1UfdwbpIjucUJn0hC0Bpgh9K4cTLzr7qx0SaBifdCEV6WHS9iaKZV g==;
X-CSE-ConnectionGUID: dzetp8ZDRuaN4TQbHYtntw==
X-CSE-MsgGUID: Nm3UBkoASRyGwRg7J0dD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86781437"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86781437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:51 -0700
X-CSE-ConnectionGUID: QqWrJt2cQo+GDvDOuOEohQ==
X-CSE-MsgGUID: MMJFa5NTR8iPHb1ITh3opw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="262114172"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:09:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 13:09:50 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1ClM+8E6R811QQxUlG7sE+pLfzSbUSeCRxg1WIxtccM9bSOK0RSZJrU4etD42miul4ld8uSftancbuaFppRiB/lsjgVhICNpjVPYp3oFpVOn1CoyaXk6I3O4SuB+jVT8/R3H4bita+SEMc/3FlSxX4phXUcEA0t9pEeDTzoSZlldRxzFX5MqC7QnUt42vwEHqP8AO5qq2B95uY0Ub5219+vpikaOso6+FbOxvCKcSSa90tkeDILGmg8Y0N9Gy36EGSTZzt/icH8YGXrvX2PX2oR22OSTmF20kgbkI/CdBlf9AgAtx0e3mfRkqwdyjhlMpBGPy/LYgTtg4LlelpkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/sN1jVUBQy8SByJYZfJK3jV3JLEUIGFIvdE9waBb4Q=;
 b=bauaSqrJ+eYFKOwifPGDSRfDfyZXY2LFBxqnzL6AsaXWtkNddA77XqzmlHsoR3d5SYRyIFtlLbIHyLbyC9AZ9zzviALunQknSCDLGhWQoraW8mEThDeSW+R0guT8kG08M55/pHIEo0QMnsRK2zYiQctkrHOiUGSwyVmZABAlI8Y0LsxMkrXcOjLSgoaauSKn6/BzTT/4H8H1mVUxkcfP7dWj7hl9zNf6xEj4iNFDm/Y0ROV5nz4LP4gb0630ip6TNkJb4xqQ7mAZ+q6jQRNdeiGxIEpnxYHYGwuqU/zi8Q//SLRoZahhxO2j3AVlaokyNd7rg7hQ8APM7vjA+ZK9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 20:09:46 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 20:09:44 +0000
Date: Tue, 11 Aug 2026 16:09:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/9] Don't whitelist OA registers unconditionally
Message-ID: <anuBhcLiINOiNYpv@intel.com>
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
 <87bjd2ozeb.wl-ashutosh.dixit@intel.com>
 <87a4smovll.wl-ashutosh.dixit@intel.com>
 <87cxvph75o.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cxvph75o.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CY5PR11MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f1817a-f625-490b-2452-08def7e47c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: tqwWCGlsVCfJeUv340e7kXHO1OaWPRIi9AZSNeH1UgjgGAodEfy0OIqFt1c04hBEeiTAr5Y47PILiNuP+GH1b0GqANVAVwJOaY02dHRncV6lVZvVyTAZAKHotvHxGOYFA88IjtMdsVVd49ZK98IyvLR6gnXy9/Bro710OJbXkPPLWNp5nPitxoW3gC4Ou9cSTjZ5R+A6nHrNmBT/AtdyO60lxwVBvuz6xLuNGr6/mex5r7JoYdnQdZaN585HGklIMNJecUGvjc+LP/4DzYt/5uEgyoAQh3+7L1o911aM1XPKxp9a34BB73BCIsLoMZfFJ5Opydt5R35KTQUYaEl+fFsZll83JmXtKYgQKiCHygIYSV1td5n+Xvq4tAdnxIfFM4uZ7xxgphLnQIaD3VcRlN3O35KYkJXKyXqB17wu3wvBEurSZa8EA1Z/Zbs4OE5L8qwZHmZM0fUogkfR0UJGsYuMABmbM6p+pG6Nln1FywkR3xCbD15OLRoFlbDFPhpR3rNncqXpogkXfPJbPGhTuKfhQ5vMsWs/ICdPDeelYcljgtN+znmm95qr9jSS7bd1NfR1dFBUX0lTb8uWZh+9UbP08sJ19Za9zayvS2aO44UGpZtIp72WP1LEQjgTDNIvZ40X6y5IIujy2cE0/1U5E5/ad721te7ERQqy+6gIbeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ffdpfZggJqRcJT1IRpS9EUoz0QSC2rvAdoFaV0kR6jrTbzSydZUMLQ392uwI?=
 =?us-ascii?Q?+vhkkkzKeskPKaVkZdD0N0bbyRD045uJlHp28KqVo95Da4etDu5Sr7NFrXWw?=
 =?us-ascii?Q?EjSnehArGQ77NbAJtuY+7FwRX96g2bSw5WGi+DM55o1e141lSSr+uXIkIcPn?=
 =?us-ascii?Q?fFkT6UkuhpPtknOraXQvahsou/QrwyAl14QZkXBNuiIB5Yeul4e3iYF117TP?=
 =?us-ascii?Q?qq6Li9zk5MKD83Rsgqx0WkCAc9k1l7Dz87Xy6a8sduuf3jjm7A4kUlcVRzQu?=
 =?us-ascii?Q?uOvdVEH3ORzloidjTELY0QVdZVuHHSiLrsclp15oqpJOC55C7b0WHSEF5xGn?=
 =?us-ascii?Q?HdHSRvonkOj1pn9Nav+YlWttAe8Cc8+LZY8ApmIS2bGF9DADd2g8oCTDiBAX?=
 =?us-ascii?Q?mf/N4tbAm+JQYlvRxPOzDKzC7rau6ex7b9MLaPTRKzgLUBW6W031pdsPJGwQ?=
 =?us-ascii?Q?sqZzxmfTeO3gzpuVxlo4mkv3AQg9lqKXiI19skbUYq8T3aA/T7EgNfp031zF?=
 =?us-ascii?Q?F4sTJvqqrOx1Z3gqAirDojSQIV/MYQOKBIBe+zJmhAZ0WETpKn5agpkeexpO?=
 =?us-ascii?Q?KuD5tAgNeRS2QjetJU4I1UBgdd/Cx5sqllPqiL09QxP8HxVRBieoMICepdKY?=
 =?us-ascii?Q?LNED/6DaGaeY6JpGN9sXt0t8K5YeTPkLLb0Ib93sde4JrapjgkUA/L4arD7b?=
 =?us-ascii?Q?VuI7jozt3VPU4HW4LyzuBqoJf8w91mBy8iSRc75NEudag9Jrz1FINwfgmLj+?=
 =?us-ascii?Q?3CSfBgiW8O8lWknsz+LTgRg9rlR6HanovylgJGxnfNnn4G+z4VGIDtymaXIW?=
 =?us-ascii?Q?zJ6n6jVBFpST4wHvJm89Qq+kSW9CKy6gP6li0IYtTgYt8+8fZAbfTQtDV0EB?=
 =?us-ascii?Q?1RFG+0AtpeAxmN7wkVI1O8dhqPtKYLj0xDEi/6qeXKjSDtI658q5GjynuF6N?=
 =?us-ascii?Q?gFsiRe/7WenLwpX5r1J+uPt/IpzRibYlyS4DR7RwxGCgYx/unW+K6xkyanWb?=
 =?us-ascii?Q?jrzsQ2FPAA4MRB99J2yIyYniaLWrF26SogWa7F3hGOff3yE6irIz0GMGQ0YB?=
 =?us-ascii?Q?LtloAV22T5jHLh/qZh0VpLokbyyZD+cDlkR6q96VXHoT0jSbVqPgyvZe6a4F?=
 =?us-ascii?Q?JlsK6p/wrDXgzu3lRRmRnWhEVo09sASYWdRrzyixcd5i/OrpUQs+yfNQwpgd?=
 =?us-ascii?Q?i4wMB/sgZu1Oi1qsvU5AG8XDhYgkbujRLhPWFdJN71jMlaIzICmHOiepuV9Z?=
 =?us-ascii?Q?E0xAX8hL7eNffXDbIfsuBwbjAZiQsurd1b3VWToEkDBP2uv7UlpWBjfKwrt6?=
 =?us-ascii?Q?PnSQBoIqm3Cl26sKyt0nef6skOltpDRhfhDblfbfactMnQ/WKP3/ECaIV4kz?=
 =?us-ascii?Q?1hON+gxEhSWqnLFckfUpok1KQXX3GnBUCMRpL21bkhuW22RVkJtPyMjJM4mF?=
 =?us-ascii?Q?xTUY4y11lch+7JZhz1SUtAKMmtROTQfvfphUt86pm5kw4YALoUeW8Tdn9qSP?=
 =?us-ascii?Q?UnHwUbK26aZav11bKNnAeuVzz/q+X6QAagMZo5844R+RPaChzGOF/7k/SoTX?=
 =?us-ascii?Q?V3V6am0rXpYez8qUzw9HHHyVMfvwtQ78GyfdxIoNIJhYgCFgk0KOWELdKuWr?=
 =?us-ascii?Q?mgKrGizHFuuhJ62hn0lCXJs/bj9i8Zk0sPGDjgCd7vgzwtdnL9S1nWadlDXv?=
 =?us-ascii?Q?hdAFI/Y9TD7iWlsTuh/5oSoEFJLtcTbmNCaG687pnIisSbGmcjnKExOkrJiG?=
 =?us-ascii?Q?YA84gGAOsw=3D=3D?=
X-Exchange-RoutingPolicyChecked: eCPjPaUrB0/TBhwTHPhivuVF/47D8BAxZ1EwBCnlPL7ocAxkQb5fmM6JST+BcIGeV7NU7f+mYINTHMl+6R8b774T8/LjFS3M1YG36T2+DyfEAm8uhyssp0n5uQchBlRFzaklJP41n3CxzDCirFgXOrcDy6XvmyWuRGloAdB39TLdxZD19GHtu0HQWPw6vBby/AAQw4T9ZgpjCX/neCRGy2XLrmPRNECkvD2+prCM/sjP/poI5h/tN79UxNDe6y1HkxIiPYRpV16hF+K6u/hLMQttG6lws30OjyI8+Rhu9qYex4dgwNrlAo9PqCEQODsBQVZ4Ssm8aTz+0er5KB1RFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f1817a-f625-490b-2452-08def7e47c41
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:09:44.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qxTePfoQhM0135MKixWPb592SB4UIKAmXAKUrmEZre+sLxpC911q7mIbsg0joMt/+qFcxg2Of9UEir/GLp4+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
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

On Mon, Aug 10, 2026 at 04:45:07PM -0700, Dixit, Ashutosh wrote:
> On Mon, 22 Jun 2026 19:10:14 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 22 Jun 2026 17:48:12 -0700, Dixit, Ashutosh wrote:
> > >
> > > On Mon, 15 Jun 2026 15:42:18 -0700, Ashutosh Dixit wrote:
> > > >
> > > > Whitelisting OA registers unconditionally is a security violation. In this
> > > > series we resolve this issue as follows:
> > > >
> > > > * Set the 'deny' bit (bit 30) for all OA registers, ensuring OA registers
> > > >   are not whitelisted by default after probe/reset/restart
> > > > * Reset the 'deny' bit when an OA stream is opened and certain conditions
> > > >   are met, whitelisting OA registers only for the duration when OA streams
> > > >   are open for a gt
> > > > * Set the 'deny' bit again, when OA streams are closed
> > > > * To manage this scheme, separate out OA whitelists from non-OA whitelists
> > > >   (into separate save-restore lists)
> > > >
> > > > v2: Address code review from Umesh. Patches changed in v2 have changelog
> > > >     appended to commit message
> > > > v3: Minor change to Patch 3
> > > >
> > > > Ashutosh Dixit (9):
> > > >   drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
> > > >   drm/xe/rtp: Maintain OA whitelists separately
> > > >   drm/xe/rtp: Keep track of non-OA nonpriv slots
> > > >   drm/xe/rtp: Generalize whitelist_apply_to_hwe
> > > >   drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
> > > >   drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
> > > >   drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
> > > >   drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
> > > >   drm/xe/rtp: Ensure locking/ref counting for OA whitelists
> > >
> > > I have added the following to all the patches here and merge this series:
> > >
> > >	Cc: stable@vger.kernel.org # v6.12+
> > >	Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >
> > Sorry I meant:
> >
> >	Fixes: 828a8eaf37c3 ("drm/xe/oa: Add MMIO trigger support")
> >	Cc: stable@vger.kernel.org # v6.12+
> >
> > >
> > > So the plan is to propagate this series to the previous LTS kernel versions
> > > too, in order to plug this security violation related to unconditional OA
> > > register whitelisting.
> > >
> > > I am preparing v6.12 and v6.18 stable kernel version series, based on this
> > > series. Since these are a bit old, this series needs porting to these old
> > > kernel versions. These will be sent after this series reaches Linus'
> > > master.
> >
> > This is needed for patches to be added to stable versions.
> 
> The series has now been applied to all existing stable branches.

Awesome! Thank you so much for all the great work and the follow-up.

> The
> version appied to the branches can be seen at the links below:
> 
> Remote:
> 	https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> 
> Branches:
> 
> stable/linux-6.12.y:
> 	https://lore.kernel.org/stable/20260805024915.3407033-1-ashutosh.dixit@intel.com/
> 
> stable/linux-6.18.y:
> 	https://lore.kernel.org/stable/20260805024614.3406679-1-ashutosh.dixit@intel.com/
> 
> stable/linux-7.1.y:
> 	https://lore.kernel.org/stable/20260805024300.3406307-1-ashutosh.dixit@intel.com/
> 
> Thanks.
> --
> Ashutosh
