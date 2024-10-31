Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47990E68953
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 05:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDAD10E0D5;
	Thu, 31 Oct 2024 05:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVMzEXi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874C10E0D5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 05:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730352062; x=1761888062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CdXJ7Pu0hvp3b5JrtsTF2yb/gjNn2/gLqiiS9hSTgEk=;
 b=mVMzEXi40vlzLxR6Y1OGdXCrMy9qdHZqrCyN2/PXWNzAYydzZMLI7wTX
 FoimA3Sh0/7kAF+l3lgzCWrLJg6LGVVEwRSFBZ/AcY50+mv1+u1mepSI0
 B5Je7ZVjL1383GMX4hyA6zjfjlokrPNLvwHSHamibOZfnZj9C5lRbRoDr
 RAN7usYD5ud/fgygmvr2QMhG+wIN6WghtZDQJk6kfAsdKuSzYgFbTzcO8
 /GKn1vLVLkwGOjTSS6v+kCs5qXQ5o+MiA8XyVgL1p86x606TbG9iTlXLl
 kIZOSlZvMIQOtPfEB2bEKEkkyIWjWIu5FTxGmex25PwOaryWqz2cmImpI g==;
X-CSE-ConnectionGUID: 8oEJOrUKTkOVqWjQDASJlQ==
X-CSE-MsgGUID: OgctDi4WS6myqHe9XSGaNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="34001121"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="34001121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 22:21:01 -0700
X-CSE-ConnectionGUID: d+orPb1aT8CPQ0AA+45G4w==
X-CSE-MsgGUID: AyaijtqSTpWAuteTts01kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87313228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 22:21:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 22:21:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 22:21:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 22:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAeyJ4OOkF9Ns50qMeqYgU8kexotOfq8hpmud4hSW6BCl6nnknu5JmUGjrho32YlU7N+O5JdROrcnqhlL+ESLYaXQpo+eRd7c/sPx2+hnjP9fDWWEPMPnGXy4XT2Ll9Aq5duC4WRar0jkTLsOMmxo2rNM1YAjxl/b/Q/JKdhDEmuXUt69n0/CeerzISryegJ7NY212rGm7YvNbI5dRAQlFQk/z9Ns452ZVmrSVjEHYaUJFEpE14mEqFa/fYOpSNxpO/LcFzKlYEDDWA30QBi83sAy3Fa7nJsmji/ns054vBlMmMhTLl7+P3NMBz2xXSDPqOltiqBaZ5ufc6wsgumYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdXJ7Pu0hvp3b5JrtsTF2yb/gjNn2/gLqiiS9hSTgEk=;
 b=Dyha/TVlKSBAmQgpven2emlNcDdbU+PEidbHwsmCbp0YVizbaWZvNvn3Ui2XVFto4ua7JKaAl0zcfBSlPFJ+hUGcSOrqMrNW2e28lUpkVxjXH0jz5nFqKCCByDVaKQ1q8niFf/ZjwULmi8Ak26alum2zZlSdZdN/gz54UPgTc9BAzsIIn7XIrXsCg9CTLhwyG+Pz5WyeQhPIUS93bE1S39jxzxeXP4g8oI0gC/rNSAbMqK8ibijYBrqwUuFMLxP4TLtr5wHo6o7OBYhjdlr+pV5+ch+nNcKvarpKrjy44IcmJYAMICGGj7roUsXx7Y3R9IT0ScHfN7C+6g8lzgtNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Thu, 31 Oct
 2024 05:20:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:20:59 +0000
Date: Thu, 31 Oct 2024 00:20:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Don't short circuit TDR on jobs not started
Message-ID: <mubjqffiebfbdfmbpw7rhfynsc2ttbk62bzeeono4yjp5e4fik@lpjf4z4nflfm>
References: <20241025214330.2010521-1-matthew.brost@intel.com>
 <20241025214330.2010521-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241025214330.2010521-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 421ee1b2-f2bc-4fb4-1205-08dcf96bcdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j+rjg2XTomnvDlSaIerGejC/t/CfEDsvFJkEfD6A5vCico9eSBgBX0Pd8Q1Q?=
 =?us-ascii?Q?tpFypIg4hcLxHrrXfA74sxwXTVwFdex8E2EMwqjaC2ykkkshR90PgZ7tREJ/?=
 =?us-ascii?Q?jkihIOGYEpcrun/2fyf6WOPDxUPI1bOBv3iUHSkUYT4XB3ACwit90D5t5cqR?=
 =?us-ascii?Q?9EIuNoR5MI76CgmeYgP/mBawfxvXK0QpIlrTnSYOk1t76WE/Y9El1PZRlTO2?=
 =?us-ascii?Q?N2u8ZtqhcD7362xtM9A03s5U3YzRGexdh+sw2dfp8a68o7ulsBSvcxwTesqR?=
 =?us-ascii?Q?OclY6XBWqWHkMXTC50T4PYh4bQruiXVRuRaCY5XEzfwNNe7gWIpB9cv4G2Qf?=
 =?us-ascii?Q?X8S54Teh44a+bwMTdXFzGhvAYgRLg5QE3hjtb0hupEks/xBbr6zG7AKiTY0c?=
 =?us-ascii?Q?SkXf7U4fbmFzO78RI9iINvTwdnmj3TmNkIiXUyZ8IJTYx0rcHpg6G0Y7ZoU1?=
 =?us-ascii?Q?F0iAq3ecgLu/IhmCWcTYTHR7if6gNHuJH+2P4gRtvvXWuYAy0THnfzfMB1Wu?=
 =?us-ascii?Q?UZ3McvAf0m4VdTR+Ohn9dLvzESdgBkkVXYBlfCLHbleybjifVs2fNWFsmn42?=
 =?us-ascii?Q?up2VW7xbmbc0SHXWfMQkaV+gLwJ26NRPbZ86MsiXdhtmAbd+ATKIB9XromP4?=
 =?us-ascii?Q?/fbOwyofK+2oP90A3WdXxPtixHgmGKZWKjOQ6Z99sBfYZJzAMWed/pIrNf3L?=
 =?us-ascii?Q?GjSSJB/Cw8lLYBwngJqhr3F4AINUUZqvA7gknxyjKb8oiBs3iBH8l15sDvSd?=
 =?us-ascii?Q?3SHcpzdb7QVVx0I/rvG2tICVRi/WaXR84AFDcepQtHuMBA2xG5CaoMski7Nh?=
 =?us-ascii?Q?gCugY5SdzG646JZQFGPxOtpyvq3GVwhH1SMGabf6caTeOQxNfdXJHv2kZ91m?=
 =?us-ascii?Q?CHlnQexIph2nsWes/+mU0DD3/gh8aAYf/zN3k9sgd5jTPmBPOKlcqnxnasWM?=
 =?us-ascii?Q?VYXwfaXLCaMw/MqONZOyvHZjmp7QwcsCqOxHuJxg3psnWHJjoSLCl9t0lTs1?=
 =?us-ascii?Q?coeQyn7CWeeI8LdiM3S9pbU6A8cMM7vsf7AHbdjLthtgfj3ibG1KGgoyUkee?=
 =?us-ascii?Q?YLQidkODHUBwJQ2bxp8q97yZvGnwY8Tm3cV5GLdyjGn7r53WoUieIsZeh46M?=
 =?us-ascii?Q?eUqHK1CK5z8qx9fJo2Mxoq70QEU2HhyIlA9jVFDgWWsTdBcfIeMFmdyY1ROt?=
 =?us-ascii?Q?URqKwmcunAKOWHLPQ5sWNrWERqG29q/SBuuiqUt6cE2mv0jtlrLshSg9UFmX?=
 =?us-ascii?Q?/3Qj+2LNNWPeT3RM+pBZFNBp+UEPXvtDICLNbvb9JHO/mvgUU2M/rgxZMJj8?=
 =?us-ascii?Q?yQJHC/MQvL6kRfEbIIi0mz77?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v5ighV5+vtDJnjp7chxOjQijUndEPY2KDExNT9UYxE0JKr6ibcybQ3PgXN1p?=
 =?us-ascii?Q?8J70k9O/WuUHxu/DI41MVT0Cmz4jrQ9EqwdY4jZ9YMw73ZwIrCd/SlyEOQee?=
 =?us-ascii?Q?fh/AttU6U6zkbhzTxgb0ZjddpueuiPaMFhMCvWFNVtUzyTgp8739P6PQiLnV?=
 =?us-ascii?Q?2/sNfeEYBwHAACNedMGTIm9BhB2/V9OSn5sdh1NR56rrJe29/lfoA+X+PtR+?=
 =?us-ascii?Q?V8ORKQpPCZwJfOGgh1D90OayXPtzTGXFGnCucfpifUe9cgSE6dQAx3I/IyuC?=
 =?us-ascii?Q?W2H2+ejZEWhHB3sgHEuhHUSnEQYfzTaMWSoZEIEO/1jHIl0N1Q6iCnC5C8SI?=
 =?us-ascii?Q?P++fpi+lgNTLBrh+P3Arw9bN9qCFz+YzWhIZ4YktjwVUTekO2NLnW0QUKyV/?=
 =?us-ascii?Q?9Um+gLFzyjVxXKpQwFX20E9vXLVhS4PlwgyW6F4MRb197amWfccPwAl/InOT?=
 =?us-ascii?Q?Fv938nNMzmUO/SDr7LAC1SM9OzGHspEB9WtW/vnYCNsoww3Fpot+4It/0be1?=
 =?us-ascii?Q?IX2srK63SD/aFmV6LsJ/7rR/KuJrPSL/+Qr2kvoqXqbjYcWvzzGDFrGqaH33?=
 =?us-ascii?Q?jfWHu4d4LlBlf1kv1VrSUrPNIaoMZzltvkawN8EIluV5YYc8ItGRBQ+Nzta8?=
 =?us-ascii?Q?HbieIwtbciq/w/nDtQf/5AzcfCbulzBWNnfk2p6LdhCwOynnr3FepfLVHarz?=
 =?us-ascii?Q?PXZOQVWMUneIlKEomiuxX9I71LQTISq314LJWYHUB36NirOASFaa1s5d24Cg?=
 =?us-ascii?Q?LO1FyZ3ZmPP6oDUOViypXCd4bQxrOnKtOO9JhN+p/jRTjk/yw8zH0R8gyZBT?=
 =?us-ascii?Q?bVu6F4KqqHAtK02ByYd8Cji5b62NvEW6QXgXop+SIiiBriqQ9RUQYK4e0LJB?=
 =?us-ascii?Q?mQzFlZsDjzPwBYpUOZhv07FymcTPxYjc6o2m9y8n3hXZidxwFQnbpeH2Tm5e?=
 =?us-ascii?Q?gJFAii1x/8k/lFEWHIRzJ3dk983o3OmbbO5aKKM58/bBiPxZqEK4bjPq3MqH?=
 =?us-ascii?Q?/r3g+LAP4zUtfdBv4sFcUUOwkniVmsJ8dATCwWLWPDtOxi/oq3Q6Uzx2H9F5?=
 =?us-ascii?Q?nnD1HSy02v/KQU1Y+TOS/7vytmQFglSg4NQH5lAE2Ox/ttFWGB2BnHLYYiI6?=
 =?us-ascii?Q?gW5Ajpu95c1blNuEyf7lQsK0NyEoGMbPr+pawD+lOaAl6/HMOp1+H0iLYFmQ?=
 =?us-ascii?Q?YvcbFzvr1lHwHWSVD6OxJv8CCgOrCBFrerLfsL9oRTYuKMbQW/xS5wZnTEgN?=
 =?us-ascii?Q?FVsc298VShk+k0ufxiFSBdNZIHvdMeqmwr91fFk//5vn3YZPoKNtygzmtxjD?=
 =?us-ascii?Q?HTpufcz6FqAQQnd1qjLyrzpGlZ38v/Y2rrN0szOQC1y3vVnvB1yp50rsMOYM?=
 =?us-ascii?Q?hNuIjjILtgwIexQC1FzoqUzPSuIgaat39KD1HxD1vtVJrXuGEL39OX+cynlY?=
 =?us-ascii?Q?qiVyXQm+oAoIdh9ElsrIuLXGfyW+Bck2GmwGZkou0L+Wpckvxbw9fanJnAt0?=
 =?us-ascii?Q?Oyiuk93WX99BUowc66qpP/4RBG1Sod6KyE42ae7iErp3ORizo/oDXEaOIa2q?=
 =?us-ascii?Q?u2tki+BCZysNpGSQB4mEhsJlvRmrKNZI3ZQmGot6Sxz3lE9HO30EzyWr6TdV?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 421ee1b2-f2bc-4fb4-1205-08dcf96bcdaa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:20:59.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YUn8iV/Kbtp5o2TG0St6ZECxXysDMrk5YYmf9MIKGlw5N2bllIc8LEw9JkU3wzavmSFca1FZoLTz1JhgAbqRLASTVIoTI9GSIy80KFtyos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

On Fri, Oct 25, 2024 at 02:43:29PM -0700, Matthew Brost wrote:
>Short circuiting TDR on jobs not started is an optimization which is not
>required. On LNL we are facing an issue where jobs do not get scheduled
>by the GuC if it misses a GGTT page update. When this occurs let the TDR
>fire, toggle the scheduling which may get the job unstuck, and print a
>warning message. If the TDR fires twice on job that hasn't started,
>timeout the job.
>
>v2:
> - Add warning message (Paulo)
> - Add fixes tag (Paulo)
> - Timeout job which hasn't started after TDR firing twice
>v3:
> - Include local change
>v4:
> - Short circuit check_timeout on job not started
> - use warn level rather than notice (Paulo)
>
>Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
>Cc: stable@vger.kernel.org
>Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied. Thanks

Lucas De Marchi
