Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB22BC36005
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 03:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03F10E0E7;
	Fri, 28 Mar 2025 03:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbxJazdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219CB10E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743132229; x=1774668229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zFhICnOPg9sxmDeh86CP7He0Xrwtj0Ro9ncXM8qDTPM=;
 b=IbxJazdx7H4i6KLp5cUuDE0hGAZyW+Kl2B6Xl9MAQgGFbd8XCGPI2bg6
 1IYngngX/XSw7lhw6v262KhLrs0co3/EphrKC8PY8WenkaPjJvC0zywoq
 WjbquYGB4lVtdsrRO7fT0KLS93WQfKZy62ldaib4vmlscGitOKR3J4Y73
 GcR/Q5myKIo/676HmI4ktTTSgMOozmU24Gs9dO+ew1qyHABMLW12jk6Gi
 yJShOWqJRGxsPSQ+ZMFrfQs6q55780FreZpZXitEeR5If8UAC91lReyQ2
 62kUxgYhXV1sScBiniQlK7NYdq68l0XabvOSS/rlEpZ6rgNPibFtXHhnV A==;
X-CSE-ConnectionGUID: YMNaAIOnRnaRxuXm/O/8Og==
X-CSE-MsgGUID: XJIqNNhoRDCSO6UT4UCtPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44617740"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44617740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:23:48 -0700
X-CSE-ConnectionGUID: X/rXvCX8SQyq5L2b7wD+kA==
X-CSE-MsgGUID: xFTxJnxKQ86Kp5cPCEAWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125340099"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:23:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 20:23:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 20:23:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JehUBB3Cr8fil3brEp/zZXTrBya8klBwSs0L2YXQEoNMdJubCAMXyibICTox4VOhIRzkcqRkdY3EvSjbwYw6okPmFPAfV0zy5YnsnNkn2AsA+e8p7BMO8AmPcpgKLNehCkZwLSuetqtTE+HC0a243dB0KAN5zHxVehzpPAwR7dy1v/c9+P0sV2nVnyjxSQyE2j1MRdIGp+GUaM1EreI6bUpRtIcFs+NNMnfE3AdjKUDu8/V94brP7nqcj/2t05AE+E1pKnRUbRfHVpoaTo31g/nN4/ID+4mvGjH0zyL+ceuKnkpKEgi/WE1kITYtpHESR8/sd5lExekB4fKN3TIAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvQSINvDVIoVd98OlmEG7gh5yKo16n0axc9F+RN4Zcg=;
 b=UMdG+8N+pfQpvtvoCLKx4ARYPU1GZcGW6JkVkjXz5g9tsUQsptuT9SrXQBOT2KN33CVdNqrgtimRbAf3nvVVtqDO+GLrpQ1bafFymBbHuw1FRfTflv1tIeqLcMRYBc/78cwpbS9x7D2AZSnEJ+IvIzYpTpu8+eN5xrigNH+R8FJifr8NwMqKM+Fb6YBswV6LVuQ/oA+Xu7q8cC7QNZZn4PwIBrI2qKWQq+SkZ7CY8Gh+xQwLao/OJMZ+oCIYW9T4XNAGZJe0yawtq8AU7ILWblMZ2mMsahDB+PWvQSc5m/zcpOIh+Rp6jQl63UelMn30yu520lh1uQaGHMbnbq7xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:23:45 +0000
Date: Thu, 27 Mar 2025 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Ensure fixed_slice_mode gets set after
 ccs_mode change
Message-ID: <Z+YWigl2GVyLiUcW@lstrano-desk.jf.intel.com>
References: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
 <20250327210205.GI1439735@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250327210205.GI1439735@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:303:16d::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e1b5b4-dfa9-4fa6-467e-08dd6da7f262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9uifE15X6q5AZGc4mJHlq3F6dl5/wACLUSatrAGfXvqMHKIVBfBSYSzXLHVS?=
 =?us-ascii?Q?vkFahSIKd5hc1EWQtTPelZSeu/C71mruaCZ1TXAjVWAGiIHg2Xd3U+9d2sRf?=
 =?us-ascii?Q?iL9PZqUArQbDQDfOo9fRTG30NdhEo/tX2b23gdMbkG8vMcQknCdzRchTbU1i?=
 =?us-ascii?Q?Ptc3SqKagY+RGDTrItLeBEu4U4CtTFJbF7Bp74mMFuFfCh+3FJ4oFODIWsjF?=
 =?us-ascii?Q?hlFOZkEAqY70HQcQP3zxjv/JMPWfNnmkNMMjl0FpIyN5iXwBOZoQ8jBd5CBN?=
 =?us-ascii?Q?XmOWRkGyN5MHBrGJNQxMHOq6+YT+GLRC1c9yC7aVAhE0Cs7PkUcLiT+Z+9yt?=
 =?us-ascii?Q?nkBWfVt+sFrZBoaSs9yXiO4rWkUcBYam5d5jGSIjvr2qNdInTT0a1ArhWqug?=
 =?us-ascii?Q?peZduJQ4VkUAD5nOk5++PhMIsW90kgwBAEqHchQAatrsu8EX2MyDLmN1zs/z?=
 =?us-ascii?Q?fx9QR8ZljunJpFRpPGut9Unmv5Z+Guk+/a6rcEdwU/+4NcECbYKzE5Vajw+U?=
 =?us-ascii?Q?poctm6HAg5rRzsBTVuFl86O1BWTYctRz5DlPEDxMFjX/k9tGHeuIz0ZANCiD?=
 =?us-ascii?Q?xkKFybuXnogXzk8snheaesMXev59HbsypZBVLigwGIpUpnqlXUpPMLWLSOuI?=
 =?us-ascii?Q?+cweN1gKqonjmN9qZAfMmrh5UUrSfqhIRhYSQmRctwUhUwoka7h38RJIxhUj?=
 =?us-ascii?Q?jQEw5v7T/hVKRJuwfpH9bwofE3wLh6jFiUgsREj2a4qNAwc6kNRoyfpTlykc?=
 =?us-ascii?Q?WedbLx2AiLre66hFX9/uPBDwSEZLZLBnTFOtwhnqEywVw68nT2DK2llkhr2U?=
 =?us-ascii?Q?KfxD9sj7JL+xGLzDVSbGdTiWhja8h2toqUyX17XPvpPaUtQtC0HOESlCPMf3?=
 =?us-ascii?Q?EE8kNIVCHCy8ezbnH5UXXoRlcMW5+zAw2rM2cNa1OrnDG93L1QIn2NOYoEvW?=
 =?us-ascii?Q?pe2f8ZnxqwIrQViSrgTQJsewL20apPz3iBFqj/8eNw03HO+731IVNmUh0dYi?=
 =?us-ascii?Q?eCoVqpAaiNRkIK6lIsry3k+ANO3Io4sYoneqFnz78pYBHyxTmvOyo+opnNzv?=
 =?us-ascii?Q?ykWjHh0hkbJPjLWob1l9McVsuyiIe+HZwiTOtIcPTiFefmKty9Vc6FQ9x+em?=
 =?us-ascii?Q?MnUlR4VSUtqEj/sJ3Vcl60axWa5MAbrZLnLHxYN9rdy2sp21og/6TsBIH0eo?=
 =?us-ascii?Q?A8ke7h9/FWfU7PqUHGY08YPGUO4dOjqk6qWfMK9Pv61JxjhcB8Yt3DVy8qAa?=
 =?us-ascii?Q?R6fwO+Owq3v9H+s57eGRcuayZz5aRqiXnknjJ/MpiHmW+w86RHl6mxlW3+eM?=
 =?us-ascii?Q?zVMBK099x+VKObK1culPul3Q/koYUjfr0bzFgJsFF1EZXLN5C119sgYymwug?=
 =?us-ascii?Q?LPCKvl3D0CKGfXB1w9CB+Jq24wq3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vHb3DQ4M3vbRd93/gzlosHLE8utPNuVIwOG+4SGyZxMA48S8cCEBY8/L8LL/?=
 =?us-ascii?Q?zb8RrxwxHv8Lts1k+/8tiNy40fL3qFkK5zCuGh04va4Mb8fEj6HDpOp4XDPc?=
 =?us-ascii?Q?VZJSA/kT1R1FjpCPkFjNOG3YVnSOY6k1GT2xdxugOAKHRi6ahilg9q6GHSFX?=
 =?us-ascii?Q?vqRmJgeEQSa6OR9Uu/9v0HLE4Ij3ceGH00AfnB3o2l4k0/YjRWd5k+YcPR18?=
 =?us-ascii?Q?DSVIwJR7UsX+qxcjasTQ4/BSmGv/MgkatEsOJK/9JvJ8TS8VekBBXobOkD5D?=
 =?us-ascii?Q?NqHnjLzJk9ockatE2443tFX0F1c/qsn0WqWvw117gOXI+yp4Fv7ltkOGxEcT?=
 =?us-ascii?Q?KBQMO4fg07zQ5jaQ+qBMtKQ/Pik8VY44Twrca8qBegQNGZljeXPgpe/ZsUCk?=
 =?us-ascii?Q?lbpP43lF/rf7G1CWbhUthaWspC0k1MARwDdq2utfihSa3/9ONluIguA1HgNn?=
 =?us-ascii?Q?Y53Q9xTfzo/md4XkUqzXd9KeQKon8Ma9+prPsSluFNdlc1ML/dNfU7PpQ3z1?=
 =?us-ascii?Q?BqP4ykKsnMngk+crIAbGmOkRa6BSBO5yQRzgVKaOhoY1+bz5SCW75XmVgEcQ?=
 =?us-ascii?Q?lO2EqgAdQ9m1Hr0tQ0s2ZkPw1TFBuuyY3pMYuiPBbHc02rTnVI20wNyi/b13?=
 =?us-ascii?Q?NMKfp6gNCZEQ+Pk686OXn6hgYc+nPXi9bkkkJtG4rKZyDM7eYrvw5IvapKsL?=
 =?us-ascii?Q?5T5JVm09rkHxPYS9TfEoVHtro9qx4gBfrxm+M+GW2DleO6swtVBaNlIHsbRe?=
 =?us-ascii?Q?utsSH1wyDCIk749N/KAxQXU0ipmiLYf1QPaVs0X/Afx+U50VDFDO7kB9ZKpV?=
 =?us-ascii?Q?TSFu2q9XGAenmcbJ4tPYoDayaUUiLM1ZEAEALJ1OlRxM1P1mg0jc6TcpKICT?=
 =?us-ascii?Q?liDttTnIJ3b35FidkXDmcgSbfr8Ehy0vTMsttw9lbQXYdDFVuzzTUW42JSaP?=
 =?us-ascii?Q?eUsC6hOpyYItlcwVoO9EudI7T2K/+sLcg9oMx6qqYX/G+nCyB+RwnwIcGoTH?=
 =?us-ascii?Q?JNqu7zbw8vwHAcGqIasVqPkU9xAhaj7RIe1O977zslLLr09644TpZlxpy2U7?=
 =?us-ascii?Q?L90/dpUCVbCRnY9PrPGr1zxtoMqKrHFoZhycGemXUVPOztFQr6uuqnVrZYcK?=
 =?us-ascii?Q?cy3C62Yy+F6oJy03BelLVwG+MYhfR8WgNTxzwOjjmHcnRwGHg6vSA2VFtEF/?=
 =?us-ascii?Q?UPwoPybekF1H4MhQNjOUzLNURbginROqBk9cB1/WbJmnAtPK9DOC5UKGYbld?=
 =?us-ascii?Q?MYcVGzvFdOUgvoX8+wBr01ibnKJjJIBV48wVf8mRZcmf6jjWTWQNmQtEcuiy?=
 =?us-ascii?Q?sok7kRn4CjloaBvmh0scmu02+akvXnafOX3b/FW50tqE3t4Aw2Woymv8qY7z?=
 =?us-ascii?Q?NFHgHiWDvbRQZj8kSVZ+ibMxurMho1c3ywHhHrpOsm4JAq2Xx9cVX1BQN3sx?=
 =?us-ascii?Q?NogOr9i33RVD3iUX9311iWxjaXA24oEHmXl2RHJGjextLY/vMqpCAFo9LkcM?=
 =?us-ascii?Q?paX/DQVKt21dhtKE4hjkape2hTlXtZjVE2TYWupo2nX69An7YgXelis0EtY4?=
 =?us-ascii?Q?JddEXdP+SuQAKzhurrwonSRgjTT14LP6VpiNXmY+NawJpnG/9ijk6QQGf2Fe?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e1b5b4-dfa9-4fa6-467e-08dd6da7f262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:23:45.1458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0axJSt1D1s9B2zuVo5VWqnWJvZi/1Q4X3DJhKJKKwyjB7r4nPd7VncUWnaz9igUpmaREofGr+H60spAWf9c5sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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

On Thu, Mar 27, 2025 at 02:02:05PM -0700, Matt Roper wrote:
> On Thu, Mar 27, 2025 at 11:56:04AM -0700, Niranjana Vishwanathapura wrote:
> > The RCU_MODE_FIXED_SLICE_CCS_MODE setting is not getting invoked
> > in the gt reset path after the ccs_mode setting by the user.
> > Add it to engine register update list (in hw_engine_setup_default_state())
> > which ensures it gets set in the gt reset and engine reset paths.
> > 
> > v2: Add register update to engine list to ensure it gets updated
> > after engine reset also.
> > 
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 

Merged this to drm-xe-next at the request of Saurabhg. I added a fixes
tag so this gets backported.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 8c05fd30b7df..93241fd0a4ba 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -389,12 +389,6 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
> >  				 blit_cctl_val,
> >  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  		},
> > -		/* Use Fixed slice CCS mode */
> > -		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> > -		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> > -		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> > -					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> > -		},
> >  		/* Disable WMTP if HW doesn't support it */
> >  		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
> >  		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
> > @@ -461,6 +455,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> >  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> >  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  		},
> > +		/* Use Fixed slice CCS mode */
> > +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> > +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> > +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> > +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> > +		},
> >  	};
> >  
> >  	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
