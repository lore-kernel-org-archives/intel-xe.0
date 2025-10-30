Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5A7CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E10310E9F4;
	Thu, 30 Oct 2025 15:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4hQ8XNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33E10E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838986; x=1793374986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aDdaFMUJlCNB51+MhYPqP0HTDREo3+Nk3GKLH2pBjLg=;
 b=c4hQ8XNfRjt/HMPFRGhcGL5GaKb19SVU7Ck7twBSV0OwtDDcZkW7sugg
 gx32fcLMW7HDQFAJpnTNLXbo8MzcrekaPj1qZxTHYhZZcTIpdu7Mcxjo4
 zk+4PP749v349vY3CQh24Y3oFaC+eBAmAfRrbenLgAGfwcN8tLKnILMqD
 7oXHZjOEllJv3F8BxLgOK2iK/DG/+qyTk79ko4Q/VS8twmp7z37iGM7A8
 tH2AwBd85rNwPOrvKcnyOjYYCJkkW3whqxBJ8o61SpWwjgDhD26QUd4u6
 qVKJwx7wSH8Rpfq5Q3LpKg4mNK88EdSbjhRyCj/DjaDhrSZvhboR29OIn w==;
X-CSE-ConnectionGUID: DXZ8ILU7RYOK8l6JvdxfKQ==
X-CSE-MsgGUID: UDwhCG8OS/KmKsSVv5rD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63913527"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63913527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:43:06 -0700
X-CSE-ConnectionGUID: f5ik8KsER4WKgawXTOUkFQ==
X-CSE-MsgGUID: jnxTo1uTRFSBpredW/iIeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223205475"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:43:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:43:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 08:43:05 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcOsXaQj3TpesfjobOBFTru3rYY68hqgdBcBt3vabPXc25fbS/3waqOIh3jbH1kifJPH1MupWiNIA1BKUryzNg8vmqybjyJvdEbcwRbf8ExwIVt/L5GLhVSD2cQ16B/hJMzO+OvGKSr5nlenNLEdVtoQk5+ycAWLTIL3+qSQ8QYTeIY4Qq12OvLiOuK3q1ib8eUPCkP6w0hMP16qk39vV5i8WikzDhtsP6Bjr7y/Vg3hJKLNpEySc55/uPXR5XdfXvr0qXwb7XgkntpxQloaRQHD+Jz1X5m6Q9zhrSXVLAX5n0nbMYh0C+XOrSc7PISZTx6TqwZR3A27Ml1yBCEPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puxJ66oUuaZl34tN5cMYPQ4sLasGDyfAc8CPzzgW0h8=;
 b=AcncGzMHa3b190WSnAbcaTejd792oOo3VE/CSbps5HgDH98pB0xlFrcZHRHKG7pzKC5WZMB8xdrnk165qyjyNA7TxkzcnS86tQMKajbPGvqxLLsENJzEpv4zFVj9vs5FWGQrJDZODi8Ey/Aask3HkIPYaMYIdUz/r7puLIdd5x1jSnV09aNcY9J4RXC2nmPNlpYihO4AAeKBlXdcu5vm/vQjEzjej8s15ugiZm7XFS8+jrnEqrUAmiUdo3HZ1hsSNwCc0GcsIdx5p7ty7D94OvYofgpKsVBy5Dipli+A3co3JtSp77ut+xCfPoF4GfOpzvgcJ6QVrbxgqjLF61HgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 15:43:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 15:43:00 +0000
Date: Thu, 30 Oct 2025 11:42:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQOHgB5xHcHeBS9G@intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec74310-1629-4b1e-acf2-08de17cb0144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/N2YHQAnPmPYhtZVYyWPFOCjnEbbYtnb6l03ErMUMBH8jHC9AHr7JmtQmeus?=
 =?us-ascii?Q?1Sbyd/cwbtPB3f5yqbd8aoIStDqCvnhpVCloV/voGZRUo19gyAEldJwBhZNd?=
 =?us-ascii?Q?8KFLj1QIJxijvaOuoULB/8EuorMbeqZZ+YLvwPNKx+4vre1bRzu7b/J9TNY2?=
 =?us-ascii?Q?PmIe/X1VR7ZLNHYczPoD1RLOGjAoJ+OBQyEep28NEHaBMjsTeJhQIkdLE+vn?=
 =?us-ascii?Q?Ze/EX7OLBXLevCaAyR0/FjrlTVAZkbEz6i+xJ8uMN6fgOxVguebBokcgRT01?=
 =?us-ascii?Q?Cz1+UmT69nZwiiAqm9q5gouAIULaL09vdEOzt7en7RtdvP1xiYPT1ooLJTBw?=
 =?us-ascii?Q?yitvH8ffJUbIrhv4lTlu2FdKs0AJUTiUWGqaOsoZSEBi2beduq/hi97dauNh?=
 =?us-ascii?Q?uNXJmNAWuKtFtlPXQ2A6n2NMv2wouLWH2XM6L8bCGSC+0yEy85/8mTwWBqSF?=
 =?us-ascii?Q?I7vQuYzWPNyjTJ1hsABvkRXZ6cvP25sW+hUByuv2qlmNxfgwxOz9QMv03JSF?=
 =?us-ascii?Q?tjtR3mK9FYZPWMffRKnlWKRd1UE47k20iMhWVazid5PHf66BnzFFxnmY5qvb?=
 =?us-ascii?Q?II8dcVakwnpXHfzTn7wFBIp6lLZvUPcGAtEsNQ7p9RxAtYyccrJxOKwLWZSd?=
 =?us-ascii?Q?D9QSV7UR498jqfV/8VgM84SK3vtzQHeFXt7pHx5/y3s2pFd2Xo2BzZ8kjCMg?=
 =?us-ascii?Q?JZo+2EeILL3aKqd/kBJCLZZiXOHGbat7wYfTzWKlIBu/0RtBtskIC/FBt18M?=
 =?us-ascii?Q?tHSqlawIGtvQULjQPbdKM3L/lI42GO30Zr2uE4Q/CjCk/w2u2PmlhwhsZad/?=
 =?us-ascii?Q?tfnvCDeMOJPe8sKkDiZTe/Gz/BfV3HabAphJKc6Z+gSjCDHNl0il9IsoZQyQ?=
 =?us-ascii?Q?7Zy61i0cBIl7oIRTZxVzQT/FrQyV5iGCK/pyP6Nk1+uQ2REVC0IdH4harBfX?=
 =?us-ascii?Q?xh7cQQFNhtbdyYAdYtKDKx5A2ffv8x+r2Ojrv0OwrSbYhfy+A7C77ayRNGtx?=
 =?us-ascii?Q?I1vm6RRRlZULh9frNW9HUJKO9DO5hYkuEJ9qv/tFgO3eXD9vj8CzrV7oiUY2?=
 =?us-ascii?Q?qtJacaHEZ4HqhGYOPbdjmFbrNNJFZCV/paIP8ESM2w7wnivY955ArpMpaL89?=
 =?us-ascii?Q?EyE6uPdWvcxR2mOyIhhjlLA9XzsteisdJ3nEqE3SKKG13vfvFJ22D4ZFRah8?=
 =?us-ascii?Q?NDdtwahOVWFrxgzySqycnRN/yrXuwF+azMVGTvh3/QnMB2bHGg9zzXRBnOQ6?=
 =?us-ascii?Q?TlFF4Os7fTU4uubDCd9ryTbf9R6QNgbq+sQDQ3ONwBa3E2gd8qzBsMn+96F2?=
 =?us-ascii?Q?ez810HjZvNuhkZk0G3ybaPM0sJuywMsi40ngi4BkDmimaqELM2HeUwF1Zgpc?=
 =?us-ascii?Q?iLJJFsv6QGzoGgDKaWpBVrRkMkCvpZu94wuKoj8EUpppgeu9QD2Mu9Szh3NH?=
 =?us-ascii?Q?KynUFoEM/u1zYNlKUfh3lJ8k2seK8ZxLzZnkI3ZLO6JkD/X36sOP4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKWePbd9Pxbkhd3Ta/jxMHFHM2max6U24jdVeVCSDpwtH12HW2xU61ZQkLDP?=
 =?us-ascii?Q?Pk/emoG7duVk/ksjAMkMLJcE+hXeWCevLkK/1TygRzJwf4c0SeUKXMTlnZ9V?=
 =?us-ascii?Q?c15gkVF46jaH96xyBQrNOLB2seGmSfe8T9+x3D5QwUmcpY7SDnjprGYEmCeK?=
 =?us-ascii?Q?mr25GqXS8xRh/C0s3Ig6BfpLYjkqCmTOkPD/SqnX/qdu44lHPWkv3j2urHJm?=
 =?us-ascii?Q?/HfazxvJML4kBeyVbg5fU3uK2pckGyncc5FAa/DKjzRTb2CfJgaW1l74VnH5?=
 =?us-ascii?Q?0AKweK6SnlOvFgzXbx23LEssGfHKRh9Ov57HkAJAmS/Q0bHO4gxtdPLnPHAF?=
 =?us-ascii?Q?Hh34u817oovOhvb+E9rJS1Qg5eABwGyrmixEHkel2/sodwJaiZl9EKyUEi98?=
 =?us-ascii?Q?I9S2vyJx2zl//kwKxkwjsbtWPFgqGmWgYnVDzA10Hz0XsnTF7DLN83FW5259?=
 =?us-ascii?Q?SYSwNcVSI2NCvpGgVaf2tFwoRtr8/utzbFKuLRiEqRw9xX+bqxlJFBzdLlUD?=
 =?us-ascii?Q?ol6qcb8Puz0Tg9I1HT4QMcL/WCEivPZZ+KZvQRrNsnocnM8b5IpSSeheQMVF?=
 =?us-ascii?Q?E9VHmm88ZDPd0T0bLFc6ZhRCFfLvEXcr2kzSE80nthzNyayyZ+EeL90YHENP?=
 =?us-ascii?Q?xN9fh0FKb32wbKhhs3zr0Z4hhDavFz2bbPztCdaKoRDviopSvs3p6W4Nyve8?=
 =?us-ascii?Q?by8rxCOOf4ZWPVTvZs8o176v5dvexNrzoX3t0W5sGT/IQux7BYTBDgrNkTxE?=
 =?us-ascii?Q?8stXKJyL6PV8WxWIwBLoXtbWmYWjdQBFAcKp/csDYJNiyStlUn+jRCd0vql0?=
 =?us-ascii?Q?nZpaTFoUm0KVRDSZhZvajVBKzVs0s3/1C3YGxtAfvycz6toz5HFM/CO4n5DS?=
 =?us-ascii?Q?tk0fzWyX4eDdl5R2mWvcvZgCxe8AHRgqOKq1WMQ8qX+Z3SsfeLvwx2NxXZs/?=
 =?us-ascii?Q?G1xCh9Db85Z0/jAN83k/AZGuezO8m1tdb6UNqEo5OGBjCFe9luMvZhmFI1u8?=
 =?us-ascii?Q?oSnqT3gtDFU1KwpzmU8aWynVWswdI+03OdYqW0aw/vNeK1qy98ww3uT2Y70D?=
 =?us-ascii?Q?SPXyVpMHwoNLdfiRi2NbztNgoD0ci9lbsEhYYCjpEAOj4CyQpvDbJSPRu44F?=
 =?us-ascii?Q?3DIxUTJYI5WtzJ8HcihkFFL+gEFkCmFkj5PerKFRBGsbFgbfuZKJCRMXpFHS?=
 =?us-ascii?Q?QL1uTqOEpKsmaIMbLV0Zzbv9/izexzbnZKg2v3YqJErWLGC3R9voGD+bAmsT?=
 =?us-ascii?Q?WC//GJ0FUIddlKwSBjBpnM4kWAQdL7aMia9SO07ZsQ/r8RTeLs1mp0v2m+uW?=
 =?us-ascii?Q?eupa+2YAgSsxcjsyk0OOjTGkROveBhP6+5/cvpxhjQFUaE6uGkmWEfSnU+7o?=
 =?us-ascii?Q?Xy4MXXtlwc36FZVHXqGiNfy+zlJcZtrFeNBzlOp4WFjPNfRVlyAje7OoJjq3?=
 =?us-ascii?Q?R3U+AVCjQYSzX2Ap2nPRn/1bzW2KwKC6i+VQbRw8Utuq7vCA8x0LzhIFZMJx?=
 =?us-ascii?Q?smE43Vws87sni8NeHqsRE4kUpjy1/EG8FT6sZAExj8GPy6sJC+acPsfhCJnE?=
 =?us-ascii?Q?QrQJJHtuo1QBV0CnveH4rS44herT19gZCo8ZVwuSLj3Q2wqgAlKGoleXhS2y?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec74310-1629-4b1e-acf2-08de17cb0144
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:43:00.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAvX4vlbVJ98CoJfb5tUc55rtrxy9Pd2OO8JnkUyhtmbGsrZu/l+ffuEDgM0y9YfhDP0792iD9b+LuRMnNoF4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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

On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
> It's currently not possible to safely monitor if there's throttling
> happening and what are the reasons. The approach of reading the status
> and then reading the reasons is not reliable as by the time sysadmin
> reads the reason, the throttling could not be happening anymore.
> 
> Previous tentative to fix that[1] was breaking the ABI and potentially
> sysadmin's scripts. This takes a different approach of adding and
> documenting the additional attribute. It's still valuable, though
> redundant, to provide the simpler 0/1 interface.
> 
> In order to avoid userspace knowledge on the bitmask meaning and to be
> able to maintain the kernel side in sync with possible changes in
> future, just walk the attribute group and check what are the masks that
> match the value read.
> 
> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> 
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> - v2: Use space as separator (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 52 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index fa7068aac3344..ca45aea8c17a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -22,9 +22,15 @@
>   * Their availability depend on the platform and some may not be visible if that
>   * reason is not available.
>   *
> + * The ``status_reasons`` attribute can be used by sysadmin monitoring all
> + * possible reasons for throttling and reporting them. It's preferred over
> + * monitoring ``status`` and then reading the reason both for simplicity and to
> + * avoid TOCTOU (time-of-check to time-of-use).
> + *
>   * The following attributes are available on Crescent Island platform:
>   *
> - * - ``status``: Overall throttle status
> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> + * - ``status_reasons``: All reasons causing throttling separated by newline.

s/newline/space

>   * - ``reason_pl1``: package PL1
>   * - ``reason_pl2``: package PL2
>   * - ``reason_pl4``: package PL4
> @@ -43,7 +49,8 @@
>   *
>   * Other platforms support the following reasons:
>   *
> - * - ``status``: Overall status
> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> + * - ``status_reasons``: All reasons causing throttling separated by newline.

same

>   * - ``reason_pl1``: package PL1
>   * - ``reason_pl2``: package PL2
>   * - ``reason_pl4``: package PL4, Iccmax etc.
> @@ -111,12 +118,51 @@ static ssize_t reason_show(struct kobject *kobj,
>  	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
>  }
>  
> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> +
> +static ssize_t status_reasons_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buff)
> +{
> +	struct xe_gt *gt = throttle_to_gt(kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct attribute_group *group;
> +	struct attribute **pother;
> +	ssize_t ret = 0;
> +	u32 reasons;
> +
> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> +	group = get_platform_throttle_group(xe);
> +
> +	for (pother = group->attrs; *pother; pother++) {
> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> +
> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> +	}
> +
> +	/* Drop extra space from last iteration above */
> +	if (ret)
> +		ret--;
> +
> +	ret += sysfs_emit_at(buff, ret, "\n");
> +
> +	return ret;
> +}
> +
>  #define THROTTLE_ATTR_RO(name, _mask)				\
>  	struct throttle_attribute attr_##name =	{		\
>  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
>  		.mask = _mask,					\
>  	}
>  
> +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
> +	struct throttle_attribute attr_##name =	{		\
> +		.attr = __ATTR(name, 0444, _show, NULL),	\
> +		.mask = _mask,					\
> +	}
> +
> +static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
>  static THROTTLE_ATTR_RO(status, U32_MAX);
>  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
>  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> @@ -128,6 +174,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
>  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
>  
>  static struct attribute *throttle_attrs[] = {
> +	&attr_status_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> @@ -153,6 +200,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
>  
>  static struct attribute *cri_throttle_attrs[] = {
>  	/* Common */
> +	&attr_status_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> 
> -- 
> 2.51.0
> 
