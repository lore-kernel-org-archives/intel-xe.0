Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59636CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDC710E141;
	Wed, 27 Aug 2025 20:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJyBTyTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9275310E141
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756327745; x=1787863745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3w+zTQ+QCUWlRBb/fX0h8ZfiGUVEX+cvWmZYdUaDQV0=;
 b=UJyBTyTzsNv+LhunC4Ge0s7AVF0mtyUdk5QebdJW5emy2EJlGUnf8M5Q
 9jsWAc9Ja7Mk5buSX249nnh9RmRywGQSruTkHHywx8cxKDqD21u/Y45fj
 AqGzvGj7sev8Kc8PfIwaRtzh+UT9kD0TRkxsoFRNuuJkpUidnRFSffi+l
 AgR+fEWbaW7SbKSqjHky9dArw7sFaspRaprPubtMz/Uxbks549+1SH4kI
 5O/Eri9UdS7svshh4vkv55TP0PI/6yZBIb8NNdYJYg8eOphcWUwgGcAO5
 6t4GU2HmRHLWNMTjnAPq7EZCcjAgZq8zqIENOBTmc3OHxr8k/utAv54vK A==;
X-CSE-ConnectionGUID: nknXIk/qTK6jLL9keZcSJA==
X-CSE-MsgGUID: CmkXd0C3SfKHy/M1zZZ1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62409994"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62409994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:49:05 -0700
X-CSE-ConnectionGUID: k07JIqdjR92bAbe8XHaT0A==
X-CSE-MsgGUID: 2B/qjlLqQKCyIiuNgDckkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174270825"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:49:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:49:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:49:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcoEcuZ6zUnOEMlP2tmwO63a1Lubt2w678qasy3EJdzSg8UuyXFmwUZEKOy9h8AULT4Zv1wKPPZf6wzSJ53vdlX3dYmROcKVrWtDDblUgTvDK6XxUhRgMKIP2WPtwSvVZkAZyNal4YrVBmeGuMBhrRcYrVbSiEDCC7cGxuR+kOwKvCTn7roQdo4Ntyapzk9mAROvu9lnpSSKADLOPbCurbKJJllWYJYG/7sB8K3Roc1JsNzEfWGcr+pOJyPaiSOfECzo09y3181mXFQWHEH/05eZoP2CZNYG6OaU7aGLEJDU2GOhewGsy4CnRcSq/UI4pLOxZ008jS/RWuTxLQU+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycAK9Zm4WC5iwCerrNDVjeIDElFuk8DV0DzAvY5EBC4=;
 b=Jc0qpD0F5v7/J3LYktc3dybwQDIljlfmBXtpWznFplYEh5e77wxei1V58qyECgixDOsQkqNCwEsRMSG6Lbu3ILaK6trWP3LMfbFWDgmtk2lHXTFbhifNa6CYHA1OKSl4o/TKm3t3UUA6r8ahMW+QfrrhwxkJ3PRd9V/dz9FPYourmQhIxjZFvkygPnnQOAqgbdVUVnc5xhs6v39BgEMInzYUMCcKDjhPrvvMTRA/B5yAJNtB49Tv6IRs5G8xgvUAIXkwn3EwY+LdEhri0GlPSXdHX1OK7N0Oy21jicNmND+M0Xh8NK1d9JrJobuzWeRzOpGSYHC3w0gn4jr8dnSWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 20:49:02 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:49:01 +0000
Date: Wed, 27 Aug 2025 13:48:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/xe/guc: Track pending-enable source in
 submission state
Message-ID: <aK9vOj6qSs5cSnj3@lstrano-desk.jf.intel.com>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-3-matthew.brost@intel.com>
 <8295cb2d-ded1-4a00-837a-e89d1c3bdf89@intel.com>
 <aK9YFYaTHiOhK69o@lstrano-desk.jf.intel.com>
 <c3c37370-d021-40ef-b723-c54809d321af@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c3c37370-d021-40ef-b723-c54809d321af@intel.com>
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: e6025652-c24e-4a9d-e54e-08dde5ab270f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WSFOcb+UKOh8Wfrix2LV1QgVzvGXC9kyXFGAl15YIO0F70qrhQqWtZF30QBE?=
 =?us-ascii?Q?s9TwpXMMTHYf0FGh1B7aZVfU99vM3LEEyZpJuYR3Bl2CmaHc6Ehwz8dmOGjs?=
 =?us-ascii?Q?EQS/5iTxby+UOlYITO13iYSJaFut+f+JRo8rJ6Bug9vYhP2JO2vqu2vL+yPO?=
 =?us-ascii?Q?yJBoFZrrQ1wmKYDfQ61nCYOKnX0B/FaCy0aytiBD1HCRB2Q+Ae2JV4Aq8IMJ?=
 =?us-ascii?Q?utz/PTkIvE/tbK114n95JfRjEzxYw4IFwEWY57VrmmBKPMEtE6gaGYHVhjgk?=
 =?us-ascii?Q?5o9MkqV5n3I2wmokb6faxQQ8jgynXxKtEl8mFd/FtNcQqXihhys7N2VO7Bst?=
 =?us-ascii?Q?EB4hU+mI9XU+Ely6jlCYKmHBvOmekTS7odz3PsDd0Qz+RhLNMckbclPaoLdI?=
 =?us-ascii?Q?sGFxD7A6RiNtVnrgHKsbL09KKqwpaQGBmRfTF+0AXujL4je9YERV9ZnrrJuc?=
 =?us-ascii?Q?pkCC1tghOFbouOcZandRWR4dotBOf5U2eDOPyrqChuDJ2Pc0V+Jl3AGjP/fv?=
 =?us-ascii?Q?6uTqyOh14oUEHLfXYfy7by6Kdvmo6VdG97FXD11zMRl/X3IX6T7Y0L5VNgNe?=
 =?us-ascii?Q?Roc7HHqaB5UkIY6pdxmLyHHfneYC3Z8Ob9SoLO6UF35Xb6x/dxdYgy4GwicA?=
 =?us-ascii?Q?+WGISvi+lFRlmS5F3Nnm+3bor5fu8SZCPfeYAfAClIxPMuVGnkB3EBvaICZc?=
 =?us-ascii?Q?eCAKkui5bkSP6dy9sDIiiOKhbTHfa7LOQk92Ztnh6sbYBKCso0E2gePUq3LL?=
 =?us-ascii?Q?3SoZ7p4vEaNt3/bck59pmqCwXDHZUb1GLD/XJKVjjqRYuw2PFRB5LeKIVIVv?=
 =?us-ascii?Q?0tlG7dBXT0hM9p8jhoo2tL/tAJcf7hWOKsT2IQ2d2PIMB9pdUVx1LZaeCuws?=
 =?us-ascii?Q?caxNYaZopH0W6lv4LsuxQvwzp1im6WGPj1+8vIn0MYyV7kg90G+IrLkdOUal?=
 =?us-ascii?Q?aE9g03uhrueqcc4KX3qS/KQR/rhOl/IvTkwMS6lb+OfR5blPqRRWbG5SW6Xu?=
 =?us-ascii?Q?1H3SF6zWXweN2kj22DJl9UpasNKg2CD+jHOTn8fXnx8o1Ot4Qs4eD9U8Zkk+?=
 =?us-ascii?Q?61q8kJPWd6HpY5LHB18KiDpNeOT/Vey5+aVIScoLD82AvgaPQcq80Bv4bWHP?=
 =?us-ascii?Q?k5hbKIlhhJOtY1pms9PWEi/1xnwipqrfCHN5BPrxWTpVLrqOaY05kX+pK01d?=
 =?us-ascii?Q?ffVuhnGyYPhf8Jm5Kd77FHA0xWST2j2+DYBOS0C3ldcxMmJf+lvIYWGtGMIw?=
 =?us-ascii?Q?8B1FIZ7BE/rFQWPhd+Q3/jNXMY1cFT2oBwnm+TNAEOlEfZ/G+/H4spkN+YGb?=
 =?us-ascii?Q?S+TgTZZxwsi/oVVMkMJc0KYVS2l8xeVQklciLlw/Sw2nKvGWRs6NQtIKxHb6?=
 =?us-ascii?Q?uf+83Lm36qu4NY2s93XJqcxU50YaImdUUyM1b0GQRs15kI1iCX6zHQSGWzOD?=
 =?us-ascii?Q?4nWSnjlio6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MqH+Po209vQRbFk/yJJpYgp0vyaV6GmrOyHLnFNKzmO8s3/PDxsrq6BcsjyO?=
 =?us-ascii?Q?Wj56ufdLfIAzqT0WIB4kMhgyoUdtPiD3cTRlolVKfaLEfZphQGsospOOJdHd?=
 =?us-ascii?Q?yGjO+DRA6cvPFsGNHiMVXGy5HBHdB+4gh8hcndBfI4sN2ep0W6hux/Azp8cp?=
 =?us-ascii?Q?+B+pfMLKgjUQxVMDUICxvndGoHzD1/Ncj1+wNppzKFrFdOsJ3Fjt8+Hz9QQQ?=
 =?us-ascii?Q?PrrTgfzgu9eScWWyF41zHqWZM2QE+/OWbw0ItbMnLrNyK2JBmGnwdTx3Vvmx?=
 =?us-ascii?Q?gKs8Htb3fgqo+9babOL2GIskw3Cyc11CYqr1hV8PgzwLbvzF7fbx8msVmwcO?=
 =?us-ascii?Q?STy9q8eeb4luwHs946ncvpDckA4XR+Ad41F4ui2MBtuGdjq0zWO5A5CNN/si?=
 =?us-ascii?Q?tTcjPDTc6vLMloF9np3PpzvE5M4/XOnW/FdTX8zTkkxcZhYsRFlBNGmlvFPD?=
 =?us-ascii?Q?hFJoTlTjybgMa/XbNUQ2ghj8F0JHs50f1CpMP6NwsNB2+gz8+DA43Q+ugHS/?=
 =?us-ascii?Q?Q7e7zYJ4eMqhjuzCjAkBjPM0GRUyduifkDUafbcnb029f/b/aVszTuY40QjZ?=
 =?us-ascii?Q?v674E7V+pcCXlyVV6h04VH84nqH9e+Z3PgU5LCkroyzgDDonjWmZhWf9uUA3?=
 =?us-ascii?Q?kXbT2IQGKm7uSCS0aTccY7DLvFd57gHGBycLk+PDmuzRKmSwqDIsf4qMVwI+?=
 =?us-ascii?Q?olOxrHT65VmOthb5D5QMkOZOwGTpLa5ixEVkil4ltDPDpMNUbeMrD/SAVI4j?=
 =?us-ascii?Q?2ctNvOy5mspPua9UkvNLq7lAIV1qxWYMg/T4nPb4BGk/BdAOF2LqbLKm5i9j?=
 =?us-ascii?Q?fxM1ORXzhbTcquVXi54yTHmuLOJrMSvtHIh8eSo/teGJ7lCfu82DGP8guiie?=
 =?us-ascii?Q?/2Zd1FWyosRSbzMgebU1LurIGpKQxHZOSyK8PU1yAJgqaaaAqDlVrSJhWxKP?=
 =?us-ascii?Q?n1g3Exdpd6oGNfWljlU2+IlhjVWZO2vCliyxZoVgLZhRI0UQdGE4FQecrWya?=
 =?us-ascii?Q?odGNFbcTbuFryacaEhlRbfunIKx2zODWfRn0TEsI2XYPp4xE4g/EBrT31Hrx?=
 =?us-ascii?Q?hhW6dzBhxnafSUtfc0r8x33ETi6vODVodHTiYme9tGEZjQpMt9NG1ORyoBwo?=
 =?us-ascii?Q?+MoPWGzHOqTAXJ44nxsCM9F1W8vp1JmaxAKXCw3+pWh+pfIGGL4QD00e4fcT?=
 =?us-ascii?Q?gv/1LUqoBwvgATNcpVFKR7ONH6aCPUCvIm9xpZiUEx0NVnltur44iK6h/78W?=
 =?us-ascii?Q?4wJ1WgHSj9yp/hMMuSpvOvRs8jxabqejLZyC8QMP+SCbMqZwYO47JHMg+sAs?=
 =?us-ascii?Q?G4tp2rNR1BA0cDBANdqdYkdRpSwbd6v4/1U545V60McuxbSpNe2NY3a5nwhs?=
 =?us-ascii?Q?N/uHm7j8dhVkFBQ9cJJTXBpBdmZ+tL1XehK0aHocIIvDG+2Rl0p9BRWRnxV0?=
 =?us-ascii?Q?jRnB2aOJZeA3d1G5DaRMCx78vSJIfF/dQF45W5v07Vh5khUt9xNt6SGAJGyF?=
 =?us-ascii?Q?7a5NivAxOlkovhsOL33mNTmjghs8KpVRnGGaAPCF6WUGmwFqEhNywSSgP4tc?=
 =?us-ascii?Q?yh2Jw5CEv3MYrbdswg4+i4W/T1Iu+fL12W8zB7EnOE06pw4NcXFwmDgACqeq?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6025652-c24e-4a9d-e54e-08dde5ab270f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:49:01.6862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: po9JXoPoK+7B6E4BKsBQUaBny0t9Ox1FKXSZYN1THrXwIRsDKbDJEqVRF7UQmxuak7ZY/22Fv260VGRVFCLWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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

On Wed, Aug 27, 2025 at 10:43:53PM +0200, Lis, Tomasz wrote:
> 
> On 8/27/2025 9:10 PM, Matthew Brost wrote:
> > On Wed, Aug 27, 2025 at 03:56:59PM +0200, Lis, Tomasz wrote:
> > > On 8/18/2025 7:22 PM, Matthew Brost wrote:
> > > > Add explicit tracking in the GuC submission state to record the source
> > > > of a pending enable (TDR vs. resume path vs. submission). Disambiguating
> > > > the origin lets the GuC submission state machine apply the correct
> > > > recovery/replay behavior.
> > > > 
> > > > This helps VF resume:
> > > VF restore
> > Yes.
> > 
> > > >    when the device comes back, the state machine knows
> > > > whether the pending enable stems from timeout recovery, from a resume
> > > VF post-migration recovery
> > No, resume is done a per queue thing. Resume can be triggered from
> > preempt fence resume worker or page fault resume worker. It is about
> > toggling the queues runnable state to enabled so it can be switched back
> > on the hardware.
> 
> ok, can we then call it with a unique term? "Queue resume"? "EQ resume"?
> 

Queue resume works.

Matt

> > 
> > > > sequence, or submission and can gate sequencing and fixups accordingly.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
> > > >    1 file changed, 36 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 1185b23b1384..9e4118126ef9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > > >    #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > > >    #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > > >    #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > > > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> > > you meant RESTORE. But restore is mostly done by PF side, small part remains
> > > 
> > > when we reach raising this flag, so that is not the best name either..
> > > 
> > > VF_FIXUPS? VF_RECOVERY? GGTT_FIXUPS?
> > > 
> > > Maybe VF_FIXUPS is the best for this context, as fixups will be applied both
> > > 
> > > for migration recovery and for VF PM resume. GGTT_FIXUPS is longer and
> > > 
> > > will likely not match future platforms, where other fixups will likely be
> > > 
> > > required (we already have compression metadata restore, and the future
> > > 
> > > looks like more are coming).
> > > 
> > See above. This has nothing to do VFs or PFs, it is an internal
> > submission thing for LR queues.
> 
> Right, ok.
> 
> -Tomasz
> 
> > 
> > Matt
> > 
> > > -Tomasz
> > > 
> > > > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> > > >    static bool exec_queue_registered(struct xe_exec_queue *q)
> > > >    {
> > > > @@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > > >    	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > > >    }
> > > > +static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> > > > +{
> > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > > > +}
> > > > +
> > > > +static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> > > > +}
> > > > +
> > > > +static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> > > > +}
> > > > +
> > > > +static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > > > +{
> > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> > > > +}
> > > > +
> > > > +static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > > > +}
> > > > +
> > > > +static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > > > +}
> > > > +
> > > >    static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > >    {
> > > >    	return (atomic_read(&q->guc->state) &
> > > > @@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    	return DRM_GPU_SCHED_STAT_RESET;
> > > >    sched_enable:
> > > > +	set_exec_queue_pending_tdr_exit(q);
> > > >    	enable_scheduling(q);
> > > >    rearm:
> > > >    	/*
> > > > @@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> > > >    		clear_exec_queue_suspended(q);
> > > >    		if (!exec_queue_enabled(q)) {
> > > >    			q->guc->resume_time = RESUME_PENDING;
> > > > +			set_exec_queue_pending_resume(q);
> > > >    			enable_scheduling(q);
> > > >    		}
> > > >    	} else {
> > > > @@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > >    		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
> > > >    		q->guc->resume_time = ktime_get();
> > > > +		clear_exec_queue_pending_resume(q);
> > > > +		clear_exec_queue_pending_tdr_exit(q);
> > > >    		clear_exec_queue_pending_enable(q);
> > > >    		smp_wmb();
> > > >    		wake_up_all(&guc->ct.wq);
