Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3B1C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 19:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B41E10E12C;
	Mon, 24 Aug 2026 19:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqhDv2p2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AFF10E12C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787599751; x=1819135751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l56H8dDlUimPlwY5yZDVZaAuhxiiz2s9SCSMSlivIUk=;
 b=IqhDv2p2wFHwz2t6O3C/Czc9xsGVOcGtKZZhla5fm8YZkaN9HyviHYFn
 np7NrWA1YnYV9hMSbPS8kieTppy20s4/KHiDR9XBIa6RXg24qt9fY6p1O
 fMgaZB91QEIsIMLFOTl7cFtqvZrZfulUZ2pzrpbJ/i05j85XzbpbQVnu0
 S//n4U7Ua9pPewhwFac7jPJlSfLFq1PFyM3z1A04w8eLybE8dzv5ZAuwL
 IyqyJC/J3C7wZ7dD8p10SOQATyn0Oe3jbFCTGBUYBhz9J5U0eu5vfxFp7
 3PgYi6+dJ4M0n+DMygPNCyhvHTzCwFIA7PbIDX6uK51yOdoj0zcUqMiLn g==;
X-CSE-ConnectionGUID: EnZsYjIaQheiZtOm83iFgQ==
X-CSE-MsgGUID: nrtue5wvSUmaGNwaNeSVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98736357"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="98736357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:29:10 -0700
X-CSE-ConnectionGUID: +OOCEdHTSNmy0/9aHmq8PA==
X-CSE-MsgGUID: cLqKpD+OTmiTQ3WelWp8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="291935186"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:29:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:29:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:29:10 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXk8y+J22L6gygoFB91lWK4ZtTvUYCZheN1faIpP2f5YlLMnWHJyFjtlV377RdPaMH72cDPXQ6oC7ZPgJmleNEcYYXbn6gB9kP+CCqde0Rkn79cMOP4kxgzEgC8T9urX8cdhzBMHv5pWz/dFXnxB2VX4JmvMyyqn4/ZB8/63MZDW727/owvK+FW7ySliRP7sgSwBeMDuQiTYOOVCQRu1ijxmIkvBKGdUrOesP3eLG34UMI3au1dqKMmaqu6e9uoqR7Avph7CWRnDsTPEQjJsaANuPzfY85ERjznkqW4M5GlgxWSYXp9q1BcE5p9o85E8uh53E6UddT9LADj4h7m5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjqz3YXw0L25VTFJyAh1ceapKeXvDITCJQUbC7nmzA4=;
 b=K9zc/LvYUcz4CHM1VxmD+uxPpIvGlh/ecU/X+Ipe1FFdan3ii6skWJ90ufvfJQfob3/ZhEr3wk0oDiC9k0sT30/1J7D5t7wquiBuGQNqfBwDuXUEQNeQifPwUI8KxNTBN52dsejtatrGSZ2xxdqAfqqYiooBw7x3yCDKyU5K7YovIxNFY43yrYAUAhZ1T8HBf8fokW9bW6EVDhFsVatZbLzwFMVtYxbWDFAbc4heC/tqH7+o7sPhvSegceSXmGCQhZxExGS3nrUYUMiuCB9ARQ3/wyiX6pY7kn43OXCc/LPptSpIymhwBXG2i4n1Bxtw35D/xoOBblS8nYbJkvMLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:29:07 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:29:07 +0000
Date: Mon, 24 Aug 2026 15:29:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC series
Message-ID: <aoybf-MgwDlFqMSv@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-5-badal.nilawar@intel.com>
 <aow4lOTbMenEkOE6@black.igk.intel.com>
 <afc09ae9-a8fd-410b-b3d5-e07a88e3ec38@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afc09ae9-a8fd-410b-b3d5-e07a88e3ec38@intel.com>
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 203bb1d0-a100-489c-7842-08df0215f6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wDR5rpwiQAPOcgY7ncsCV5fcvU6kzeWJt//qQTFURwrUGsVi5mN1yWuJIQyVn9X7D5PSbqeGHLYypzGjA1LCtCCSfLJLHrAbVVUwirKO27ZcAnrp25hqoNAYbtELov6Q6j+art1S3ahdmP2IBG21K8fNX5O2zjdVf2Rcid/2DCmQ7qY2NLRg8i7QF6XQJ8MwJ9dTwbY7GEbYRucCvMW4psfedkeZ8lumCpVRRcCA4+5zfnYATU2BRNsBEg/E3JCgpfz9TY+SGEQItQz53xF2qzIJjCvfB3ONHexBGVa+XEYc8GzS6iVgQvpgmOXJ9JtrgGQN4n8U/vie8y0fjBElM9AqND79AYekeBYDoMQRTTw54A8QAgq26byglGvKqaDtu+qTBnQWk/u7lR4YijCp0dwU96UnfEhoswnP84Sbtf7tTRiQ/a+ZAmizixb443GoGG+JTclObKBwoJYv9A96tgQGD3NV+mnuYGmeboGjSKJtSh74aCk4Fjpx/D1yKBwVFFGyPE3qg4WPyu9skwcfvP/pA61cjGJusGXFgGQdjyzU1IiZvjNjTbMcmJmjymJxYoR49fDnw7nLfl3VqBl1B8x44uWBnndZ1AbCqFDUTEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGq59O9Y4J1QXM1gfmX9mH+rhXMOFFyV5OWelcdMVY7ediRQTckAmmp0W/hV?=
 =?us-ascii?Q?1byihfrI1z2QPXBZYQj2e8GI4F6VGRstAP1OTElZ+6awsvasx5/DgOiwpHKa?=
 =?us-ascii?Q?D2tXVwbiQJUDzoj7g2iPtL5n4zkmTaNHauIkjss8n7gFjNLAt5ufuQSwF3Eu?=
 =?us-ascii?Q?05D7nIVyMz9cP00YxB6j4C4d6TynSX7O88sT4WaT7y3Xs+aKw/dkvTpV0ATM?=
 =?us-ascii?Q?pHWL4obiwVsaZ4qJzvwMKRJEHybvJuAjPwDlPZ4ivFhucsAE2KBci5qK+ytL?=
 =?us-ascii?Q?uXPw31m6l9dHsk/RqxuRTJKNlxilNu/Nr6svKxWflI7L3jxtkS1GzFZ01S+R?=
 =?us-ascii?Q?H1V+E3wLh2nhiv2oxFEnU+/KummhAvg91La7ucVIkQXHCAS3UpwhjzOKPkMp?=
 =?us-ascii?Q?psMWuLmMIWxGBcnSbtp7FDQ8LL2gvSgYgxpe4O31898JWMhmyfkR5D32OGDY?=
 =?us-ascii?Q?znYLc8Kw4h7bsJqatMzcUFoS39VQ13bCLKoEy9aewL6asdlrmEAJ7DkVCegY?=
 =?us-ascii?Q?VjcY+dkEBloZHY+u+le6OyU9sdtyq31qxgaHAidYEAGujQUgWA1srxfBUnYW?=
 =?us-ascii?Q?RHH9VvPuMoyLqQt5ntBLTdmK6LTEDj3avT+EvrDisLli0vzPqcKZQ1M6BMJO?=
 =?us-ascii?Q?2grQbW0cqNDkUAoB66E7kPEefs/zAPEFLEgRahOOSjpH3Iq499QKGmU71jzd?=
 =?us-ascii?Q?xBE/Uyv/cU+MMha3jp5LCKn9MhWzy6UmrmgBCHvCYYScdHVrFpZJFr+QmMHm?=
 =?us-ascii?Q?FNc92CpEiShBMXC91G0/ygIFPr8pENb9RdoD+YDoVqR59lFs6+PSrzvcv+m8?=
 =?us-ascii?Q?0CJ99f54E8vMOh0GENVnjbJuuV4FG3qcgfBNGaklQqIwK962dSRkKbppsnpO?=
 =?us-ascii?Q?/tARbGlJKp07Ab+DDAB7WYLwMt8m7c926gLJ3TsGFW+NJFcxYxRQC+T8HY9B?=
 =?us-ascii?Q?IwiNHMR0wSmeIHrhtKBhTupETGT3AOx99Ej9t2WV0xHugdPir/Yiwe1tsFBO?=
 =?us-ascii?Q?oGr6UKi3472Hod8U/krLEoOecy6DYeYLOYcwhN3Xu7M1i7z6QtnuYctirYbP?=
 =?us-ascii?Q?EsmC9RWIKrh2gyUtgb4B1Mf90EVnPSj5cGgKoRsJrrxUWSFXA+x3dLjuFtna?=
 =?us-ascii?Q?iZyPlbG/eHng0oAdZq/xVeple4P4b5ctChuv4S4Um01vwXfq6Cu7z+nfq9v/?=
 =?us-ascii?Q?vbnmaThWK2ouzG7N5cibouSrMMotT/KukDboJxn76IAFKBgvSIU5mVC1q+Y0?=
 =?us-ascii?Q?H7ICYtaVwXrMf4kfgYbSsQhwXyUL8WcqrSaB2bu51HVfksgLIlbfDdI0TChH?=
 =?us-ascii?Q?NQ2sN/miXFCtp7OAnWvmva5xzYxw/6UfoNEcQ0ygnTE5UEUR92u6pj6Xk1xJ?=
 =?us-ascii?Q?PzEfjK0bUn4tfEP+lPeU8vCVESWdpKrPikttGaPPMRz6vmWcPvgKnVUKEtBo?=
 =?us-ascii?Q?fMNjrCM29qFZUp3jr+CftXynGAu8xks/UQIK4x4OBtoEAGMgMjM0scj4Ai3C?=
 =?us-ascii?Q?f2PDMrAjMi2Kk9K7JTES5ZntesRmod+yfA1Y2ZNrxUPKFe8OpJMp57lirMgz?=
 =?us-ascii?Q?2nUBnXnRrmrg0CiPN4DG3sPuL5S0pkHs9Rny57ZZR0DqL2DQw7t7jw6iaRLI?=
 =?us-ascii?Q?7VbzQxy8W/skWegcfvlR7BROv6hvTNwdKb3fALh4BMwy2mb//8bbPHrfGnnd?=
 =?us-ascii?Q?dk7Rb7oLptOCzwy5FnDuvy38WA0Q3m8e7RDf3G2bk8VVrupQa8VPJ0hu9GD1?=
 =?us-ascii?Q?WzrNknUuiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Btkon3/0GGA/ietiuQteuVy4JGnw0H0S9w/31/DCeoVxBPgXu5f9pRMnVvmuP2R4Llqf5ykjXp8gmR/2H5i/d3uxuzQh+LysWxsOWYhqYay/W05B2Jt71169GA6hRbF2ysNrY8pjl3aGrhS5/dPef1Cw5cab3XxvLxWg8Tgfec4YYrp9WCF25yQxMliF11qHyrfas2rMsqzG/6dw06O7FyPg9pxrhUqM/IXhVaFAAtZhmO/AK0dYBVI2QcX0bVm3upRMKnM04dDY+LwHtyiisMqDjufD+R6PvL3k8RgZcGCLaSO8mF289N21aYT2PbAo6DR+uayEw0lKZstkK+3bJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 203bb1d0-a100-489c-7842-08df0215f6fa
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:29:07.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXLeRqTDcTUYNkh4X2BzY1uilcMEd9HInGthZXGsC5kk7unMiMs+H8Ae158BrOR9C9yDutMZdXnzYFSJtlZvfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
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

On Mon, Aug 24, 2026 at 10:33:23PM +0530, Nilawar, Badal wrote:
> 
> On 24-08-2026 17:57, Heikki Krogerus wrote:
> > On Sun, Aug 23, 2026 at 04:05:25PM +0530, Badal Nilawar wrote:
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > This patch is not from me.
> > 
> > > Squash of https://patchwork.freedesktop.org/series/168930/
> > Why? What are you trying to achieve with this patch??????
> To unblock the development I squashed your patches and built patch 2 on the
> top of it.
> > 
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Do not use my signature!
> > 
> > It does not matter that the code originates from me - you can express
> > that in a different way in the commit message. You don't use other
> > peoples' signature even if the patch was intended for development
> > purposes only.
> 
> Sure, understood. I did not think it was appropriate to change the
> authorship, so I kept the original authorship intact and explicitly marked
> the series as "Not for review" in the commit message.
> 
> I think I should have dropped your Signed-off-by.

Please always remember that sign-off != authorship! A pretty common misunderstood.

And whenever doing this kind of squash for CI make sure that the commit message
needs to be pretty clear of the intent and with lore URLs for the original work
where the review of that needs to continue.

Thanks,
Rodrigo.

> 
> Thanks,
> Badal
> 
> > 
> > Thanks,
> > 
