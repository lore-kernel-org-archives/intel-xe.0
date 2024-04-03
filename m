Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D558ECD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 16:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853DE112D54;
	Wed,  3 Apr 2024 16:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUC/BTzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E871E112D54
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712162756; x=1743698756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=owkGOgMAV+eH5CqV89LYj1pbhefqJxTxcXoWVxuEptg=;
 b=TUC/BTzZhmFDSDV/Zcy31ehXrP33Nn+3vnw5mDvecslYziKhilmRq8BX
 u1CFHXB5HDz94/2wzNe4WBhsUn3MS75qx/v4JneovsstgcD2DfUSFxBAU
 dKSeU3SrlLOmbn6FWHsxQgbDRZuH9mbjAt3lhnY+D2ArDEEdtjw6bJpA7
 2yxsjP4B24oMKLiTCYTYyXeEEcx1sG6YQ83otBGo+pmem7A3GM51CA1M1
 VJtXQwAP3RUY6bB3rOQKuGB0l3CNich7iUTsvPSyyEhNEpEDNASOnmcpD
 ApzjSueHJnZDQykCYmEBYjz4ihcvk4sKB+2lwSYFTIF+WjIXKBsXpVb8J w==;
X-CSE-ConnectionGUID: 6PDw1q7USumYhcBn8mT5aw==
X-CSE-MsgGUID: 32vgh8ouTR6TPOqn/DZ0zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11187953"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11187953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 09:45:55 -0700
X-CSE-ConnectionGUID: LVIuI0PETc6xSmWhyw89Wg==
X-CSE-MsgGUID: YAF9gOtqREO+YD5dwR1PNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18539757"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 09:45:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 09:45:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 09:45:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 09:45:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 09:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6PscihQRJsi/fg+q7VlU6QAFnU94lG03rDOBLqXL/6dGh5CLIeFX1DR7WdZ4oXKb5wFrid4epwpy+BP8BEU2/SZvuDzLofOE+T4oLL4FPF3wD2DdjIVRM1eio2DBVaRQHormxn84maeNU3v03CgzC/SloenHyK9fATOjgSbkd0SgBiwdKQ0+SCL6qH7viyFDNunumTo/wCKzf2kxfQsobl0fUFnZBI6Abarwhl1GQz/lQbdJ6dQtBqSvH44bMGcWBsfBAoOxrg5MplvlMHUGtf5ZwvPmcui+nVJXlcGlZ6t1y9GoZk18203Ak/jrsOj2DSiXaCTUyoWraa9aq0roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3ss5cb6oNOKbtzoF8LDvUtYCzBU2LSRXBvyuLRBIpw=;
 b=GLUrRByEsJaeC+jPNrQ/EDsy7CoQoS7UcEozJ52B0R8z/JKu7AfLkCFKud4qE7EcYAYOqrH0p9Z3pdvIgTDTzgjPk8cOP4SGq3xv2JVdBYPtrWKCwhBK8pRTz/XxLOcAUfc7/i+IT/IQW7KKB1BAZmu/dLFEChH+z0HlBmtmgtNVagjCNrDkFlhDhZTz0jZ7Pz7jLmbmhsLlAAhO2nIenL9cRkpnmfbL7rEJU82PT/nCeOckD/VbU4ehOxZ2Ygrey3yNNiXmuTVGPkvpgG9m+PCuG/lR558PQrGJ02XJZIspnQhoog2eXmufqpGtLIXjQQ1Gd20dTNRdyCrl+2VSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Wed, 3 Apr
 2024 16:45:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 16:45:51 +0000
Date: Wed, 3 Apr 2024 11:45:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/hwmon: Update xe hwmon with couple of fixes
Message-ID: <mz2ns3r7xksm7taxahew2ondbxniqdhouicfxkgnhy2yfj4h63@x6cimgqsxgdo>
References: <20240402180956.508398-1-karthik.poosa@intel.com>
 <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
 <a1895347-354d-43f5-8160-90d59ec7c597@intel.com>
 <3xsn5j3s74yggakrkrxq7ouwj6xm4xeenyb7gqgankhseglxwq@ohs3vm5m6in6>
 <1fa9c310-f30c-4a89-985d-a78336e8f63f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1fa9c310-f30c-4a89-985d-a78336e8f63f@intel.com>
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8229:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMWveEld0hd9FUvOjtcmXk1MXaVRDU4u6M8KZ2we6H+o44rgNkOFOfnN90/zhVAc1R3ukufshE7fkQHATj4ejr0fSaLFtwlwmXt+XwvRBM/EAq9xK4PO9VFnhzd6+hUNlSaiwB7Ot5teLJIgclHSm6xrQDGkxyEe8C5sCE2bVybATeetZjh3cN7JAH7io0iXZHLPaNeM6vU0vnf3toYmxhVFwMvksfjzs2/M8FG3QsUuG86R2wR00gjFQtKagvu7gklg4KbSEME4NhYXWHQ068B628GQ7h1N3Eiz3BZ87DswGCiYbwvmAoyKsw//+azMN8ur/j7OINnTjvqcIsuBATx4v/fbplLIl4PYRN6i9c6DAPd2n7j7KV22VVFKNdzxHfmzyntWluLHN105dsPsqp0k3Vorwcs4OTWZIpYwxOcCX3cvReD1rkGETvyN7WiUQenZSLlMOrilTzlXCQfqweZsPuQQF/b9p1P07eUa173VNKOGgIEBhiLcGqj3foR/A8QJCcUgvgP/SDa7B4OaVDK3dfUTnctx3cdBNi6u6/BHA9ibe9LsD+IuIOoL6nkZ2lW2BcNczSXsNpuhEFFo2R/QnLWv2u57GwElmT+9BDPrgTZNIUlfxNV088BpAR7qfziQKa7sPMJ+ocsvF6zsM1ZOvHcw9dk+yz8S11G56Y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yz2C+OTbsYKRSsz5eMo07wSz0D57ufPxZUkAKgtgjJwz7j4PZ1yR88K5+I7c?=
 =?us-ascii?Q?ZXttW6c7eZ2K6ZuMDR4Mx5QL4AUI/F3l6CWAvz/82Xa+0lp78JxjcEFilKHo?=
 =?us-ascii?Q?MrBKOujS+KSX3xl5RJBmMgCndm7yC0p9qa7UPOKqbB3gX2oJcD8a3MiL+n9n?=
 =?us-ascii?Q?z+IWltRn6yPOX0C3rfBdqnHUHhwUc56OojtQHbnFpR2KgI/fEtQbRPQP8aZo?=
 =?us-ascii?Q?8mOuLohDH+vmfY5cwGPGU8bZgt1bGVbx4rRwtXiFXxKQ6rS1aoJv4hgWhRw/?=
 =?us-ascii?Q?ExMSyXAnlcFpGYeSoAyvC5YYIx6UjLBwxgDXPkusJs1roeme83iIhszRsq3T?=
 =?us-ascii?Q?idyXO+HkMLirrvOtDofrtjEnN+BBNMwAzbowVusxQ0ZXcQ9tZo1EGnEvngkp?=
 =?us-ascii?Q?PW5hJFxruX9xJA9J8vORQE86zwdGPpCY22xtgAiEt7/aJURbVKVRxAuB4UgL?=
 =?us-ascii?Q?4f9qHHfu8IVRKCNzJLXbN0+hnT7q82mUHLUq0OqpN150I/DKQvnFpJ74/Ne4?=
 =?us-ascii?Q?exj8pVK83Beggqa/lqqjd3eeayLFv31L9tKh3PX+R4pAVEDg66iL3uKX+UmW?=
 =?us-ascii?Q?OyJ1MUh9TucdCXsiVE/12X9tVjyhSCcVJxpQRKZD4OTBkoT27VdtCh+87imX?=
 =?us-ascii?Q?qhMy+2jmb4CtZkorwE/2HCary7uKVk8CmiZRDsnpzV99FMLCW4tvoPuPQxgG?=
 =?us-ascii?Q?KN7HJczt106QRd6gEpmjyPfOVcCnxBxyxsSC1GQxUeMbKzgexAPWRwdB6+IH?=
 =?us-ascii?Q?9RVsm6hRuUdV+pWKzodS5wqyQlaaLrgbqXxyEPjU44qzapaZsDbZ1mG4ufrx?=
 =?us-ascii?Q?A4EtZtUkwvYdADjMtalVKc5LqPAOG0kdaBf+I/uFL6T7pGeTc1oY94KpZRoO?=
 =?us-ascii?Q?y7EW5ELvZieTvCbUsUpCQIMHTaAStPHDIUux9bPwIfxnSlPVFfCGeu/STk8y?=
 =?us-ascii?Q?Yhy/lWYUv0ryWUnCerYFJeo3KrTXTlH7pQo20N+X4fU6eKzHhSa9wcznth+s?=
 =?us-ascii?Q?8OJ3XyhenrcCsissIFwJNzcGhnp4EtUw9LaIxnspax+C8epw/0WQPptzyCOE?=
 =?us-ascii?Q?zQMKCRdqqiNGHcfAvXANuWqOoZtuAIdMYf96aC76dxUA+MDqr3hJDMSF98ht?=
 =?us-ascii?Q?Dvstg3pAxx2j1N+cVzWDLvS7AHG/0fM0k8Clj6nCm8QLHVDwm5ztpVPMp41B?=
 =?us-ascii?Q?2zdOp6/rh43agGVo678Nbb7l6U9oGfvJh1D1pHvOPkiY3R55m84xhZUMokOS?=
 =?us-ascii?Q?8h0pSN0jnkw110yDFHH2QPVA1m60OptvguGaKSuSo+N8wgJqAzJmyM0VRbLJ?=
 =?us-ascii?Q?ehHAJdDiSqZtY4Q+b0LPVwyUz37eOV8twuDYIOCrYtxHI1FAYshTWzvfo7Na?=
 =?us-ascii?Q?uVgRJ+YEYQOZb9C5sUc2Ht3O6tVp/PDNHud75oY/on1vmWw7nDxtegTQ/oFZ?=
 =?us-ascii?Q?B/aL9Zy5SPyWttYQY8VH5tOpYXZBTlTMyiCNpeQqBoSDoPcix+1yA00E7RoD?=
 =?us-ascii?Q?woh/sy4BA4fZ233n8Fb5cnkxQ9NAMsyuizlsKPnuKokc/uXQapNm40/ssr3Y?=
 =?us-ascii?Q?z7oHmA3kXDLXafWPHGaWY3UD42osdBcS8GpteY23EdaJzh4gFa+ZgoyiGv5u?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 587baa59-1915-469c-681b-08dc53fd8583
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 16:45:51.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwCFy1Ta50b+ENC9wtxQbrbvBGpegRKcyo0H5qU1La2nvLsezCpis2rHRTmqjQdltJWTy9IEi5YU0eJIkBy0kYQC592V1+MFU5XtqUx55d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
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

On Wed, Apr 03, 2024 at 07:54:47PM +0530, Nilawar, Badal wrote:
>>>Should this be added in xe_regs.h or xe_hwmon.c ?
>>
>>drivers/gpu/drm/xe/regs/xe_reg_defs.h
>Function will look like
>bool xe_reg_is_valid(struct xe_reg reg)
>{	
>	if(!reg.raw)
>		return false;

Read my other replies. No, you shouldn't use reg.raw.

Lucas De Marchi
