Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA509C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 03:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0E10E011;
	Wed, 19 Feb 2025 03:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGfExfOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7F10E011
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739935063; x=1771471063;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QL0JF9YTll3EqMEmHDMKPU/Tuz93lUcR/snP80oAfno=;
 b=IGfExfOwm7h7i4lx8bLcNtc3tT74606OsJJHjUIqS+X8YmpNFs2kDEsD
 26m28J3L9vQ+6pLsLW9o+sgvWrzlA/wOG6XNyvZzdUFtuNWtojEInyCRO
 ji/WhNa9/Vn00Az4P/yD+x89KQ9NDjI2GJ5zIlE0X3dyZjSilHkpYWBnv
 6UpCSr45OyRUbU729AdhLeI9zfTw4hjXI7xwnR0ktuZAiwu4GD2dwgqic
 jTDl6SzuqrlN50D++aQek5f7iwJAIyBDSEMk2XXJkWuWK6EhTmcQ/iVT5
 DyvhmFeJZq7xVSYVa45PSV45nWVpmmqFFDy94GuSUuYpcWGK9D93Z5un+ Q==;
X-CSE-ConnectionGUID: igDmqRkWQxGsmyum/SW76Q==
X-CSE-MsgGUID: OIVbUPAsQZmU0Nr1Cosd7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40523434"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40523434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:17:43 -0800
X-CSE-ConnectionGUID: Whpc06PaTO6wDJynMnSc7Q==
X-CSE-MsgGUID: hw6d84T6S2mdMQskq0sjPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114438402"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:17:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 18 Feb 2025 19:17:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Feb 2025 19:17:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:17:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvM8OvTZwC1egnqiDi2wW98qRgtz848sdlcuMa34D9S7oknFVtflvKuBkj0NhmrQA8/qKR6AbE3EG6Xdwta4y2zNUstOZVJpgxltCiYHb5fFLptMXvOKPfpiw0iKsHMZznvc0y1BLJ/CSPaXiE0musCEWL0etIQWAGidkiDrwKOsQKtg7PJJisnDdG+uiO62W2n+wF96enKraLnB8+xJC3QZUEH8Etkou4CAno85/Yf8WxaOmQX6mZjFqTCOy9YaW7UIPN8+hEtlkH7Dc8xU6ck/tM0mIj7XlEbwyYCbr7bwb5tUUsECzgdIttxBAnaqS6uQVNVadi+DY5U2TEfmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3uILuKFp4AJ49fKxfMICjYkOAhdRC3OAFblbt6xtFY=;
 b=vsHm45qMN+jt3Nc0Gxxeck4K34cKqe912hbrSb2V/lSeMOqOGmZdpzyH4y0A+pWZSFoPHTQjHnuIgBozqjwFG+PpwWT2k24WjYgd/umtKZL+lC392u/Nl67s25IOor0OL8LBvdmcuHAUwFfjHboJPWvq0aCIf+8d/cr0qWmPNI8UQ/2+XhiF5nIRTMqQTN4T6yxO2Z5X7ost/Qu36dubx6rXkNxu9eTdp7AHk/n6YvvfaUSB1Rfn2TlkHQz1+ZA+fDhOydXNWxw79JygboJ4z0tkYAuVttyBzqLeYFylNOdbNiQi766odIfkasvUrUCorXYBKJrustf7LrVq6biNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 19 Feb
 2025 03:17:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 03:17:28 +0000
Date: Tue, 18 Feb 2025 19:18:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Message-ID: <Z7VNhu4kgfEqTjb5@lstrano-desk.jf.intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
 <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
 <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
 <e7a999a1-f5be-4fa0-8557-2cf293da385a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a999a1-f5be-4fa0-8557-2cf293da385a@intel.com>
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 85994283-ff7d-4166-9c9b-08dd5093f09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mDo/m7bRHuNPXG17YIZUDVesfEOamtfto5KTx9pOzG6CE8RbgELE7UxUuR?=
 =?iso-8859-1?Q?L7P1Nk6YsSo5DEQe1q3E9b5zXtY2C2c94Pc+ZnsSFBgE/3Fr3B0Uo77EUZ?=
 =?iso-8859-1?Q?OKNoZDv2RIsHD/ATm/m74sHjPCbXeDVtAP2RX39cv9kKYFZukVP2Y0uuuT?=
 =?iso-8859-1?Q?trl8HTKBuxLYHDFuFGITJEUCFlR+hsO1i2Xy8rhL1PC04odwGQx8YsOJ1I?=
 =?iso-8859-1?Q?mMpTxZMukin6bLvcjCLHtTaP8wcNbpyGqjwFkjxWDaTEj4yi9X5Cg9B4MK?=
 =?iso-8859-1?Q?xd6xjfCCNB/uOrUo/kFStZBDoroiIzkII+f/WBjSYkRfrhrOthSlzSOf40?=
 =?iso-8859-1?Q?SAcULAMruvHXkv2a6iNtbr6Rk4ct3SVLrMss9IVYDKCp5nQhkE2cwGkj/s?=
 =?iso-8859-1?Q?IEQSl+rV82I2oSnFQ4AtXcFSrv5xPGOc8CVq71YiBt9My6GZleQY1jibdR?=
 =?iso-8859-1?Q?dHxm2ZOl5+tRJ1VM3S/1wLENPN5BCfh/DKHTF8Zy3Mj+u6DZFHDt/lJES+?=
 =?iso-8859-1?Q?mZ+5oym2FC6G4NMeM/IGngXfUouzLjB9Q0zqVFCUQUFC9Td1Nrcq1efK29?=
 =?iso-8859-1?Q?Xvn38yU+Oq5H5P3SwtiN9C40cBKptc7u2NjWowySpPNzbLYoo6Pf/oC4gh?=
 =?iso-8859-1?Q?tgEspNRq+3dLSJsrXDhbm0w9teAdxwEvDYPSmvPLlzFTqmKWAIuInBgT9B?=
 =?iso-8859-1?Q?1qal9zAzX87RM061EDh42pQLV2nqG8wQtNRBgb3L4oCQldqbGVB+lkDBy5?=
 =?iso-8859-1?Q?4d6xgzJGqzMxn8qIgjb9sYdE5f1o9fKlnsOfQkXI0+Zyjnq0jGAHVDjNcM?=
 =?iso-8859-1?Q?SVK287eILD4HbXnktIvkGKgK7qy+Ctg+CJnYcfd6sm9kLpLY4CW250Ku4Z?=
 =?iso-8859-1?Q?A3g9FQ4vqEMzEW2cChmvycfZYjxy7263I9okDwm3BjGG7we84AFCce+nI0?=
 =?iso-8859-1?Q?q3hj1pDpkDwtos0ddMf80yRQuM5gHguRNuXelKjsyms1RsKIK05ZibSrbv?=
 =?iso-8859-1?Q?F2i4L+C05FL0miQoPg1yzLdZ/t7+/2fPLQ+iNNWmFMpM/rEmYq6ta1unON?=
 =?iso-8859-1?Q?115ZFChN+bKJxHHBHEqzADrZYQQ2aBBt5YXwlqN1bnPseTZe2AHhEfLhTU?=
 =?iso-8859-1?Q?Rg71I8b/8EfVuqPEvI+KIXfIZMjob3qTq1YnUo+w88wfFAWKVArV6rGmZr?=
 =?iso-8859-1?Q?iZVR1Moqo49o2TQRAmLzVaKti8BcYHhxRoGx8/A9T/dvRrOPBfxuLrsrpv?=
 =?iso-8859-1?Q?SpkXqE0ZMYCl0NKL7eDTQUp9658b+CgUMur77RTtCZhmwi9wnbgLrMZZua?=
 =?iso-8859-1?Q?Q6ITQFnCEfLg+P1mPKY+LW972csLLUHcG8SiwZSb1X1LL4L3LvRHSab/Gx?=
 =?iso-8859-1?Q?Oqx4jWLDjmM4G5y9WMbmWvrx7OZ/JZrKbqQhT5TLopV7iZxTK57rtB7IGr?=
 =?iso-8859-1?Q?8G4YW2viQuH9RC/g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uQsbHR+Lc+cVEM8xX22uJQUhPcaJGpB3QmnysRRW9DolFK+2pz9gHCvZJy?=
 =?iso-8859-1?Q?tsPHB0/lpZIq7/spmuSZzs/GR3M2KZsA1MfKvY5TAodLUsj0iuVwjoB/t9?=
 =?iso-8859-1?Q?vxzy1dfFvqr/GjpdhXjEThWD30pqwshZXBIuf63+cTtNWK++VQmeQC8KUx?=
 =?iso-8859-1?Q?ED8WKqQHqaPQqHA725Tp3XLzqir9O3fihsBvOYqIItAsaSxKptzvDwj/Mt?=
 =?iso-8859-1?Q?ilrAJQ8Orhea6y6qirf9oVEmb3vi9SKLSRmVGINgZok7RiA1uxeVugj0iZ?=
 =?iso-8859-1?Q?K5E1fyiJLoWT58WcrZbMNzMgdwHu7e5bAmjZH4HA/w4BEFOPaVkwwttj7z?=
 =?iso-8859-1?Q?B+G6067CjwieP/k8TmyXlvS2EGOAazUuoLZVzMHOvEOn+ZDd1xoYlW8H7s?=
 =?iso-8859-1?Q?B1/6MIsL0l0schi+tLDAk0NH4L0KTwrQzZDRUTJ/rsPBHrrqf49ChalwWH?=
 =?iso-8859-1?Q?dG1TeJ5BLYX9E57+w5D5kYPcMA0bAGEwNp/9witSiUjfuA5mRrPvw09Tbi?=
 =?iso-8859-1?Q?yIWC+rgw2L8K2rU2liVn0sRjglQxKeNxCQ9zx81GiM7TMKmUn0RPoj7rFV?=
 =?iso-8859-1?Q?h2JKKa3UveqtgqXpq8Q0zwMomY96xq0KXV4Ok47FETcA/DAKXxgOdhQgoW?=
 =?iso-8859-1?Q?BFF1FunKgGF5ZXLje64LbDpcuyaOmo6XdQDUJlfCj3Z0EIux86hGTC9V7Y?=
 =?iso-8859-1?Q?y02df+RRuOmQBqsgIKBOXpKnSetCgqEb1/Wve5X3Jh9Cb8FlwCGQt21sBD?=
 =?iso-8859-1?Q?Jko7e7F+zRc98o8/KpfjlfJHxJ2acsYQNZwlKMUVTT5FBlaOCwFlB0i5gL?=
 =?iso-8859-1?Q?hym0HkQyelBJrJdDDYsqzlVsj112lnl8DensQdQWO/AQQv0ammmzurVGUb?=
 =?iso-8859-1?Q?2x/JQAf/83O46Y1zSgAfxoDUQc5hjfy4MQWBOXI0l5+xcrJHK6IbPIIx9I?=
 =?iso-8859-1?Q?TsJHn70w02bLOVPTK569x1jlBvjedeUhOg5YlRow5eQLBIkBHHW8RXPu7v?=
 =?iso-8859-1?Q?qxSFj0rG7ByaFVuTfn8DX6e9EGDyx/nXJaTQqeq5+T0b5hgBQsUhYh9QPo?=
 =?iso-8859-1?Q?FhjebXNGDmftQNQHTMfFwtu5dblCdRBtdp8L6OoAnpFCyZqn8jBbhg+/qV?=
 =?iso-8859-1?Q?7hqw6Aryciw+I85dLHZCiTRn8GB+jNxi5Thl+OryixgbLgv0SsW/ibuDGt?=
 =?iso-8859-1?Q?ej71St6gbRveKdu5xqJX4LgonN8RmPb3/pKswrkc71HZh1jHuGs8mfGYAw?=
 =?iso-8859-1?Q?tr8/aZWxeVrCo0LfovIeK9A/BNYqGbdQOaO2YHLob0gPZ1dZuXZlf9Axfa?=
 =?iso-8859-1?Q?xHOQz0YGW2aT1iilS4E5BDl1S/ggJGdMO1GoiVny+qcDBVGAM31M/HjwRp?=
 =?iso-8859-1?Q?zR+VQQfJdxWj8Yb5SVd4Rh349Z4OYTeO3RbrgL9Pwoo1b5qUwrT92ILclV?=
 =?iso-8859-1?Q?cc53FYV2Gl3/UWHIDlO1n6uxTVvyYIHhYH+iJ+EXs/g6seXXTIdBuXnvsU?=
 =?iso-8859-1?Q?MCBltekLXrfGBYV6yrn9WPdvRdG9OtZeQSlxacK7xg1SClZxzWFM7UfP0r?=
 =?iso-8859-1?Q?DkHR3NELMSfTL89JK1McvvRaLR8/utaHNJa1iLgPy+qv/eDwiN79hiHu9L?=
 =?iso-8859-1?Q?HN7dkYCE3UwvmhD/w+tN8APR1/0m64Q8AradIrvEctWIQm6AGrPhS7MQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85994283-ff7d-4166-9c9b-08dd5093f09c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:17:28.5106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f7uYEnxNneMlgoP46rLxt0jjhrk3OfIMGmXe5H8LhOyuELWypJnZkKIG4M1v3OuU/1SP9a+QXfaYpbTKjxCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

On Tue, Feb 18, 2025 at 04:38:34PM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/13/2025 12:19 PM, Matthew Brost wrote:
> > On Thu, Feb 13, 2025 at 09:23:26AM -0800, Daniele Ceraolo Spurio wrote:
> > > 
> > > On 2/12/2025 10:42 PM, Dan Carpenter wrote:
> > > > On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
> > > > > On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
> > > > > > xe_exec_queue_kill can sleep, so we can't call it from under the lock.
> > > > > > We can instead move the queues to a separate list and then kill them all
> > > > > > after we release the lock.
> > > > > > 
> > > > > > Since being in the list is used to track whether RPM cleanup is needed,
> > > > > > we can no longer defer that to queue_destroy, so we perform it
> > > > > > immediately instead.
> > > > > > 
> > > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > > Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> > > > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Patch LGTM but can this actually happen though? i.e. Can or do we enable
> > > > > PXP on LR queues?
> > > > > 
> > > > This isn't really an answer to your question, but when I reported this
> > > > bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
> > > > xe_vm_remove_compute_exec_queue().  So it's possible that this was a
> > > > false positive?
> > > We currently don't have a use-case where we need a vm in preempt_fence_mode
> > > for a queue that uses PXP, but I didn't block the combination because there
> > > is a chance we might want to use it in the future (compute PXP is supported
> > > by the HW, even if we don't currently support it in Xe), so a user can still
> > > set things up that way.
> > > 
> > > > > Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
> > > > > catch this type of bug immediately?
> > > > There is a might_sleep() in down_write().  If this is a real bug that
> > > > would have caught it.  The problem is that people don't generally test
> > > > with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.
> > > We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it locally
> > > since I use the CI config), but since PXP + preempt_fence_mode is not an
> > > expected use-case we don't have any tests that cover that combination, so we
> > > return early from that xe_vm_remove_compute_exec_queue() and don't hit the
> > > down_write/might_sleep. I'll see if I can add a test to cover it, as there
> > > might be other issues I've missed.
> > > Also, I don't think it'd be right to add a might_sleep at the top of the
> > > exec_queue_kill() function either, because if a caller is sure that
> > > xe_vm_in_preempt_fence_mode() is false they should be allowed to
> > > call exec_queue_kill() from atomic context.
> > I see what you are saying here but allowing something 'like we know we
> > not preempt queue so it is safe to kill in an atomic conetxt' seems
> > risky and a very odd thing to support. IMO we just make it clear that
> > this function can't be called in an atomic context.
> > 
> > We likely have some upcoming TLB invalidation changes too which I think
> > will move all queues to a per VM list with the list being protected by a
> > sleeping lock. Removal from this list should likely be done in kill too.
> > This is speculation however.
> > 
> > I agree some test cases for preempt queues and PXP would be a good idea
> > if this isn't explictly disallowed at the IOCTL level.
> 
> I have a test written locally and I've managed to repro the atomic sleep
> issue. Unfortunately, I have found a second issue with a locking inversion:
> we take pxp->mutex under the vm lock when we create an exec_queue that uses
> PXP, while here we do the opposite with the kill() taking the vm lock under
> pxp mutex. Not sure yet which of the 2 sides is easier to fix and therefore
> if this patch needs an update, so I'll hold the merge for now until I have a
> clearer idea.
> 

I'd suggest q->pxp.link to pxp->kill.list + a worker to do the kill
then. The kill is already async so likely not a big to deal make it
more async.

Matt 

> Daniele
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Daniele
> > > 
> > > > regards,
> > > > dan carpenter
> > > > 
> 
