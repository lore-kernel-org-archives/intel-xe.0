Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B444ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0010E159;
	Tue, 14 Oct 2025 17:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXgjsoyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF90D10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760463198; x=1791999198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pWeRcHjUE1W/45uSsRU2DY6f8MKXN3XceN1NYORsRF8=;
 b=aXgjsoyuXIt4Zr5k/XcfrMIHinDNwoK5/j54C8LSw5YYpRuCmx8s94ec
 kCmK49irIRkX/eaar/NOPLH6Z47JXHJW9xCPERpOy8otd+5EIGDGdjDh5
 9EUPiPFV8YfojwQVtCVpHYXMbD5W4O552nj7K8AyjbkjEhNJRX7nHDXAa
 /K1LUBigPS0uKT1rBzRVyWCI3cmVI17kZPLoH1jwV2oDd4yeWAOB7JRt9
 NPA2cDAujMeO/3KDAcVpgAo/KDGai/XGtzDX9finPqDT8W0PqvG4FtVTb
 0x3OviLX56+eXWw/IFvQ2Uv6ruvujUYGpLxXi06NQIK/14i2KEJUPk/tk g==;
X-CSE-ConnectionGUID: OSTGsfjSRLCdE57VbUBDOQ==
X-CSE-MsgGUID: A4hFfEi0SQuhXyjYfEjf+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72900686"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="72900686"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:33:17 -0700
X-CSE-ConnectionGUID: zKVEbuXsQTOm2Zf6j/qj9g==
X-CSE-MsgGUID: OChwh6tnRVO4bk5Jq/rE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182419136"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:33:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:33:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:33:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUosUYSKzvOtF8w2Xu9kRBLLIrsPqW2oQ812wswW9xAGE3iD+MB1z3YB2Lzt1JrcZoqBIbkfEIgX9iV7onL4WGCHkMDavQyB1EotvBtcA4hJhP/hDAkXnjgzEa7LPn7AedoIdtS9aZYMl9RUl2SUHZvJbwnzIYNL/4qMGmGqNuwLX+HeB5Nv66lsNNYJKvBU5nH7r929HRYeVUOuEex4M+VAKzTVlaWtHQzOKuuxXR5NthUo6jmxaRmO/cdqMvsXR6b3W+/7GLhA4YzX4yOZ9rHv6c5SC83lGpp6F4S/VhCsUZMLNBLiKFEYp8ukq9et19KTRHGqbQA6KF2gsMTBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhEXE2nUKBEILgMR4D0Z5rAny8CinhKVR40WWYDnRAU=;
 b=Jz/n1NiMMeF4TGlyZtn/PTxjsWnTMvemBSs9JDYnak4Ga2plu+u1WnWu1MTsSF0BcEj8Vcb5T5IDn4hG1g8c4DdulskbXwhc6YcoiAX6cKVbyeVZL+rXqPVz2qByPZv1DB6JrfFp6hhR9VFoKYHrIYnOjwQ7jZdVnRpsNQXa8o5nHcqCFoqiGiFwDm69sAgnBiVYmciF1elJIZqxZQzOZZek6EfkVXSgJpxeWVdhfEbt0Sft8mB4UQMQ90o/xqH3dQXeAuZXpW0HTX1mG/Z/ROIRNHBoV8Rr4d3Nx0Kmev0TYPVmDMOtReaLb/84PnV3nTGVwrylPQ5P37gNU/r1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 17:33:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:33:14 +0000
Date: Tue, 14 Oct 2025 10:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
Message-ID: <20251014173311.GV5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-17-bfb74f038215@intel.com>
 <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf0ef4e-41ba-4384-bc28-08de0b47c0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xN8GO8SAxzhHYDiBLvBqfVtwAZz21Gpxh3nZAK1lhJfw9+TP+y+rOL5/qT6q?=
 =?us-ascii?Q?h9u0CxxzkzvQL/A587OqS1/aW9UMJyXa2HSNodTv8CTx8/T7hFFdZEgjULSE?=
 =?us-ascii?Q?hVCHofy6qbPoJQM+sguOppHWjiawGscqzebS+EjR2lp46wHxtk/+/rv3Zub/?=
 =?us-ascii?Q?RXjuQ5rE2QXuoMX+i3YEY7r2haT4cdDDvTtgYRZqPTDMzXpVRaq948WYchQj?=
 =?us-ascii?Q?T2L6DoGiu5unnVU0PYwTRpHyaaNMEqbxDnUcpHa5sFjYvJTj0lQGzAHbvYX2?=
 =?us-ascii?Q?t4AJGhHvBgYJ3+Ci2B7rkVLWb9nq4GRuZwbolIbi7YEdWuFTrfA+Q4P6/WZx?=
 =?us-ascii?Q?ahMR1GIZ+lo+u+gw/qInZkMGVGRdF4BQTHLgRZYMsYhPVECDxdv5ylqEbXsu?=
 =?us-ascii?Q?qnEbnDMsLMysHkH9VMyAThsn1Szry/eYZgyXwvqrrwO65k2YI9q8HlrMf+wh?=
 =?us-ascii?Q?n9jzvjIbjOvTIfplzNWwMrhDuyfyyV7Sso5gIti1PUQbK69Ez40Kr0fWKxPe?=
 =?us-ascii?Q?0F7upozH1Z/u0gLQdcHNJdrtMHGuYa4USqtIAWVsNyY6zuA9ZOQ9fRnx2YHV?=
 =?us-ascii?Q?PouFWJkmk2HdgpkpDr/QvPWokhPZ8BoD/weyDTeUZxPehU2eGQoesXd37EAZ?=
 =?us-ascii?Q?PiQT65YYEYGESzMuz2urN+hjhL6hvhWMrIcB2kKp4utlN3nXvggmMPh5iK6C?=
 =?us-ascii?Q?WRwFDdi/3dGzcUdlt1YbnpHTN7vsljHeElsOdtDlHSqVeeG/5VW03GNs52Sp?=
 =?us-ascii?Q?hA+UhVQ8/WJxSAHOMFzkfEPP81vWJTBFjhbe90Dm7fGZq/brO/ZUuWae/bDP?=
 =?us-ascii?Q?6Ix+zir2tKeKkkXBYHbITwhfsXv8lbtSTnPvePyGjDYldiBP5tnXSZ4Zgb6z?=
 =?us-ascii?Q?jpdAR8ZNX+fh82wpd0mHPBwbLWS9vurOFAlaNQd6R2iu8ucY6B898LxKbFN8?=
 =?us-ascii?Q?d277ydKzg2bqRPhADF3rdzhMZJoPlABxjVRXzDm+NC2i6h/5RtIEsjNLVUTm?=
 =?us-ascii?Q?33Hqak4YQCCy7kBwM7Uk0myHS2Oaq0Mc8coRFS8ldPTqoe0usL0TIrtgSLd0?=
 =?us-ascii?Q?0A+anMbWW6/I3+l8HCpvGIdUhONtdGWyjob2qyhiCREovg2gFmCq6puWq1LJ?=
 =?us-ascii?Q?G//TQzFmmI04cyKaeRlkWB9DH8btVCtxU4gDnlDhdaaBlmQ/DoZRJGZcn4IJ?=
 =?us-ascii?Q?a3LY7pB9XyTQr2/TA7M5ZMN09ebMB9W48nc48+nZLy38CilLWkbbKW1CcZaK?=
 =?us-ascii?Q?vEw3+Q/LQtWfp8SO+M6f2D+GFGyiIH2sZqlW85jqZa2E65ReQkS8m0Gtnjkb?=
 =?us-ascii?Q?DVRe8YVvUBfD6fnkCCPE6WE478MfBwldivrVP33LRwWq8Jtnsxo+3UtN3gh7?=
 =?us-ascii?Q?KngacdO/TOFq4X1pDnHOeVsOv+pEfw//hlqlaRwnSeK9mYxBUgiZOJ7pPrJH?=
 =?us-ascii?Q?ZiHH7h9f8z13X17ocDzIxsEEiemK5763?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smvDVN3zy6rxRjxt7OkbGxilHdTNZ3zbMtnp5cjnFFiXRvc5RD2Ox4dRLLAp?=
 =?us-ascii?Q?o/GWDDTZB3K07+AWr3F8DMBIEbP9gkl2pDMMLvBK9v7HJ3AxDjCa39PcJgLr?=
 =?us-ascii?Q?qelm1U+DiKRAh5lfHMF1Unw9cYkeUofxEu4eiNtuB2/rOru7LAUghCHT+YRq?=
 =?us-ascii?Q?SlDQkMvzX+ChhPr3EOYxNLUNWKYBOfPPRICaZtLVYvhmMfPaSfuTfE8n5mmf?=
 =?us-ascii?Q?EinybRmga76OKMcQBFX4uSFiBdjzstbmmgycnPkFeRTMtHlxzxAwhaJ1MJJr?=
 =?us-ascii?Q?FcbEe2JTLpx/sJ0ejngef34J/JRKmoSTO2dVTk0lWifhzg8XIL/x3Xb3jli8?=
 =?us-ascii?Q?/WSsEeJdoT9229YXi/6o8tWDdrrxkcYAlidAgdOsPGjpf3i7pJ403/41P8t7?=
 =?us-ascii?Q?ZCwRVbTRhQNTmtWX7BSDwymEbiRoB1Vf/D+3SDz7sft+TN2He85QM3T0YWnF?=
 =?us-ascii?Q?bPIYLXoP8fnaUntJeElexMn7cYjqfWueblsCw348u6nsVe1vdTzcl/Yr8oA9?=
 =?us-ascii?Q?r+1nRJPdBcbzbtI2cAX396Sq9KBL24ZmRQml41ExoteStvI9DU5tyw9nOCIi?=
 =?us-ascii?Q?zABO+uadt2uOse6MEKiMCVhKj6uac3qi36kGfR9LPkIFLg7cZmvkFttWxdaL?=
 =?us-ascii?Q?0GVQK08JrS1CsfinMH2wVu+K5LcV7Er8nEwLaj8bK1kpqJiJS73XnsbAXNAh?=
 =?us-ascii?Q?JiG0S+5tGmlns6ojSxTrfAvfWJvl6nmeBTvYwlM4pW96wR+n8q9QtFdf1CyL?=
 =?us-ascii?Q?AR5RRq+t/zevmIJddFwYDlHP5sECyARU4OKBSOpRtZdpjBHBAc8IMhyDfKsp?=
 =?us-ascii?Q?uw2TY/EERcv2aOftUtt9YsW6wOi+djVlPHfZF7PDPxiN/oxGePyi6V1LtX22?=
 =?us-ascii?Q?RV8Ycqmy3OfkjQ3Dniq1ST48I0SW+2rFwHols4YzMQw/KYLAbw/PdY5wP3y1?=
 =?us-ascii?Q?IR1sa08ll0w/hi9q3kNw+Nb+g77LjfbjRaHOe8vc7vqUIWPz1IXAeN48YOlb?=
 =?us-ascii?Q?W186C4RxA3wqCREqegj7MbkDv/j3cfb35rxbzzNTuCdnyIH734xe94u0SZmK?=
 =?us-ascii?Q?ZQ0FgPpRXDYhwV3I+5hrsJIrRp299ZKHiPNoB0o2G7HqWCIP9iCYLUxv+aKF?=
 =?us-ascii?Q?DQH78o7yBqqkF/5uqaM1esVdf8q40tSiknq+UJd9O2saJButHGICs6CiDMNo?=
 =?us-ascii?Q?KqPlqzS+s/iZzLsujYXfnduNULhVuG4ohqHfiwvk0DmVYe2MIpwZ63gEADGp?=
 =?us-ascii?Q?1po6PxECy3gCacX5nRVLjLLOfW8TFQL3zby9WItRB6X71CqdXvX7i6VkVsPR?=
 =?us-ascii?Q?XzELGSx8hJbyhIcTl8jwpRX6PiJoxATNzOXwENRoFUMd5QrvdHXV906c41/W?=
 =?us-ascii?Q?TFm2VTcLshnganEBtViWYQ2s4IaTUPjq5H2DihOK78NYmLC3JJcF0cvI5YDn?=
 =?us-ascii?Q?mkEIDiGOgmzQXE8rzjEZcUitsx9xnDU+g0JVlBbkfkrcANwm2JTbe79LV12Z?=
 =?us-ascii?Q?ORJxMUysgat1FnKUDmGo3Rh3QNCpPWRXPzt04i4d9dnKSwfHfbJ7LI0vfYXm?=
 =?us-ascii?Q?xfQi2YSH46qUH8IGGttfUSKtQilFqIVeDMajUWt1geB/kqzm0a4U1WZSG4S7?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf0ef4e-41ba-4384-bc28-08de0b47c0ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:33:14.2020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGRXEMS4EncgJKHn+EfB5qYQ++BGAW5UD1nitpHdPbfpPBVgj6uK7TvxWS1g0fF8MWKbwLY1IKN7cRc9ZuDuDBwCGhB1N4cl/1mwYVXugFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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

On Tue, Oct 14, 2025 at 01:34:30PM +0530, Shekhar Chauhan wrote:
> 
> On 10/14/2025 8:54, Lucas De Marchi wrote:
> > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > 
> > Add support for graphics IP Xe3p_XPC having IP version 35.11.
> > 
> > Bspec: 77979, 77975
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index aa8359a4c5594..83e5e0c314a42 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -119,6 +119,15 @@ static const struct xe_graphics_desc graphics_xe2 = {
> >   	XE2_GFX_FEATURES,
> >   };
> > +static const struct xe_graphics_desc graphics_xe3p_xpc = {
> > +	XE2_GFX_FEATURES,
> > +	.hw_engine_mask =
> > +		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
> 
> In Bspec, I see the number of RES_COPY_ENGINES as 0, which signals that
> there is no BCS0. But, at the same time, I see SERVICE_COPY_ENGINES as 0.
> So, why are we having a mask from BCS1 to BCS8? Maybe I'm interpreting the
> table wrong in some way.

The table on page 74110?  I see all non-zero values for
SERVICE_COPY_ENGINES (which makes sense because I don't think we'd be
able to function at all without at least one copy engine to assist with
various vram operations).

But note that the details on that page are product/SKU-specific numbers
and not something we're allowed to hardcode in the driver.  In general
we have a way to discover the presence/absence of up to 8 engines via
fuses, so we give a mask that matches what the fuses allow us to
discover.  The actual engine mask will get reduced down during
initialization according to what we discover upon fuse readout.  We do
the same thing with other engine types that are runtime discoverable as
well.


Matt

> 
> But, aside from this change, other changes look fine, I can provide the RB
> once the above query is clarified.
> 
> > +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> > +	.va_bits = 57,
> > +	.has_flat_ccs = false,
> > +};
> > +
> >   static const struct xe_media_desc media_xem = {
> >   	.hw_engine_mask =
> >   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > @@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
> >   	{ 3003, "Xe3_LPG", &graphics_xe2 },
> >   	{ 3004, "Xe3_LPG", &graphics_xe2 },
> >   	{ 3005, "Xe3_LPG", &graphics_xe2 },
> > +	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
> >   };
> >   /* Pre-GMDID Media IPs */
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
