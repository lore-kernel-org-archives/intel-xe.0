Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8306FCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4547E10E863;
	Wed, 27 Aug 2025 15:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jG7yEXsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A8210E863
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756309976; x=1787845976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NRDY2htOxxzInMhNyVD7KweCl97edEijCa3UBuxrfx0=;
 b=jG7yEXsJ64uEHgk0cQtZONjBQIM+zrBBnNR984LBbsfd046hwKFXm1A4
 m/XPA5TyEbqAxATtRbR8F2oZNtyv6t/Qw7s8GyA5LP91U2nvPgSbedsli
 aMYgIO/dRJTlgoYd++AkJxdDZVIS94zMk069tkxu1UHvzg2TnFy3yV0Iq
 6LGmPvUVs6KyI2uamzsnIr7SbgAl3XTjkzCAlT2WjXlmoffYn5MeAAITW
 qMLXOsCnf7KPYHZG19J/hXYYAbEPIBOHby4HwBn/5IHVJkGt4ZUaw1Yn4
 QBtqYl5MmKCkeoOswiI861uq5siJLMu23CzaqLyQZ/c2dIL4TrgBSQ5EC g==;
X-CSE-ConnectionGUID: OnhZYAh+SGyz62oC8KRs+A==
X-CSE-MsgGUID: wC7LQ6yZRV24B+ArSR87IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58631128"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58631128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:52:55 -0700
X-CSE-ConnectionGUID: Z8i+I6KyRU+9o7F1ZMdvXw==
X-CSE-MsgGUID: OXSy+KpFTUmz4wmY/zsm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169388115"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:52:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:52:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 08:52:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIfvZbRVY3HMLhJ4Bd94pC6oiSSWYBDSZlsDt3VMLVMtJhEMGn26t+9tBbZS0E5QEqpvUzCzgcLYyPVi+LJdfobaYURIugkqXlX9lIa09Y28oQntpwv1Cc/MU+Fkv7mX/htLUEwx/+cCOxwutFy9Fef1UzWuEoB+qd2vSnlYqor40aHRupAQhT7zihLfxyuo12ROIdX22pIz1+zLP7umvrTtrhtbe7ijaCFKO2BdyJBFLsqWd0/qGCFbcy5sr78iobSp0ripej2EATPP7yTRir9TK3m4KRa7swYee0l/coFxVndYAHXvNIYO5TzX4R9QP87FOtwMjxAQhhZ3CEr1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEzNVBM64XpLGUmBU3Q5Qv2MuUfnWWInYTRNToum3bY=;
 b=cOTAksKtebEPcBk1t95ztRC7lm70xdsotHfsLOMMUvWbEfpy8SHecBVxxf1orlxUcialkVAhQn3bRRVUllTwprAFJ4gvEpefQ3Bh5QlAnJQHfvcJSNaKOLjTWIphXAtZNgdFwkytMDBBJyHr2GRMFWpvptOtNRN44wsWHKNO1sp1VEWINrdPXDQ7jyDbip0+Dxnj4bwuIJrIA7JplXuN6KDXel5cVYPUo35KwCmihQ9y/NIoGUtNASecfpOmx85poYhp5LPITylJGDnFb0OCGYiTxkSnZUkrw0wqYiGDupDfB4mCQCmOxcvr2TKM4r5S0eSKxWi2I8FMlfNnuo3iJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 15:52:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 15:52:51 +0000
Date: Wed, 27 Aug 2025 08:52:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 09/16] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aK8pz/4W62DMiDy6@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-10-thomas.hellstrom@linux.intel.com>
 <aK46+muNkR2uAq75@lstrano-desk.jf.intel.com>
 <cc739f6d910cf772a10b4304c205b971f15bf7dc.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc739f6d910cf772a10b4304c205b971f15bf7dc.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 43706685-5337-4cb9-47d4-08dde581c6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+d6YrQvQP+o1Gglqd9u5m7mUkL07LZeY9N6jiQXI4/erD2XhAvICGTHULJ?=
 =?iso-8859-1?Q?HZyGPqHH0+KStq4E1cdLxo2ieOAb4Tc6E/zpy/iT4SHgk7DWQ0I69I0pik?=
 =?iso-8859-1?Q?mb9lYM06WyYQjfLt/k7Y2qJgZ6igQ4X3NH3almTm0/Ar53qIGXo8k87Rds?=
 =?iso-8859-1?Q?nOOww2Tnr1CSE+YewKS6mXfRiKvCtCOQ2YpTP1poAp928eEjccYvlAGiNc?=
 =?iso-8859-1?Q?qY0MsRwQdOX0MygqXzPP1EYV/MFFuhS96ZcXXOKCySROkNnYrDeFBa9PPx?=
 =?iso-8859-1?Q?cwP3kSMWZnd46Wozq2ORyj+r28pWF+I9pLu0vi3g5tlnYg8aHIEwhHiYOH?=
 =?iso-8859-1?Q?gnZEpVxm4esEn0LFHowfggqfKhzWMHGcaQHxO559mEc4vmyDTPu8joEsLE?=
 =?iso-8859-1?Q?q0zsyCEhFzm5EjNaTL+62qvX/8lyxkSERiC21KRORqVXJiFmpsAfPZUhcj?=
 =?iso-8859-1?Q?R4e8n7wVIkpKeWoqZsC5rL+QriudyrKDq1y47SfYH5j8xMNX2hXxBSdbGb?=
 =?iso-8859-1?Q?teFui+rJJmF4/zE7/AtzvxXqqJOV9Q+g5ut4CN/hi+w0I7j92UA2nahRSr?=
 =?iso-8859-1?Q?w5nZsey3NWGgOkQGZbW6E9h765oTOu6xfBnLMnwmc4IvX6om4bRTbxUwpj?=
 =?iso-8859-1?Q?APbXcCluMlwGGcxJbzVRCy5+Bj3HfMc1ZDhjFxtK61fTv7Hjag7y9V4Vxp?=
 =?iso-8859-1?Q?tZxNze7yUgSc73yFrpCFv9fhOo2i2cw11CyRhMhWS6ChJfN+OVj9FoRSjx?=
 =?iso-8859-1?Q?dLbeYUpsmsJY6zlggd0oWcmlN07iw/oF5JdWxz++ZirAkx3AkA91lqcb12?=
 =?iso-8859-1?Q?34ycSHy9tIiB5viOo5xOqxmobrMeefyVwSpaV9kWy1sGWaMQp1rQOWxvID?=
 =?iso-8859-1?Q?wpoFebtNMMDeZHl2h3P36DMoCiiKX2nvDUv5shsaH3EC4sWqkNrR8zyyuf?=
 =?iso-8859-1?Q?cCOz8heMh0Dxy3NQD1dfWX64NErEmNZTvXIZTovczcWHlxIuuudoctpFmc?=
 =?iso-8859-1?Q?mZV5NVXR8LZbMh2ABLyxY5r/ANiluYV6E0r6FG8TZDzStYdD8i//lqpdTN?=
 =?iso-8859-1?Q?cTlE/8rNjIgwKRy7aoGOJiLC7tm4HlbuqSty2xDWA+gR9MXlmloCQ+2HnX?=
 =?iso-8859-1?Q?o3Ebkzs53RVyuNk1K28Zld3W7MuEPAt1E/865QkdAeg78pnBQrKACJl8Xo?=
 =?iso-8859-1?Q?6i495C9Tzlxakmapq9jefbkOjPm7s/sl8Jas03f0c3cctSM06zh1dI4xqu?=
 =?iso-8859-1?Q?e21bQBnhxZTOSHxLQDi4kqgBe4J4vHmBY+Z72EFyHAXY1AYQrEvT0ytI3J?=
 =?iso-8859-1?Q?jRXjY9GqyodonlhOjogqp9L4uU+0jwV3QP1v1dviSPYYZ+MFSVkqUGPzbr?=
 =?iso-8859-1?Q?xeWSYGSz+xUOH7bIRRHa83oNEa4tqqg/Ljpn3Mc8Rg1Iacd+Mt1LBrN3+E?=
 =?iso-8859-1?Q?uWTVF0aI9wWobYx22no4TfeD/ow7dotMaUB5iBo8lIXvTn8fsThtX7yznK?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kMqf9Ai86yu7wQFJqkPOjzeqK2nfyG90Kadr4HcCs08CxUsmrKIgPxxF29?=
 =?iso-8859-1?Q?RrX7pV+OqDNRGDC1uRii9yiHlE5PtgvLDlLbWJFwzoSE55aMeyXaLGFMWQ?=
 =?iso-8859-1?Q?FA0FNTzXMvFOjF/J0facQPebgCw3a+YGH+g8vDGHCUSThJJ8bvpJ0ziIPw?=
 =?iso-8859-1?Q?cF3G/7YMhQi9eONy/CQ3vpSU5GiAw917tUoBSnlQ41+5gFgqOF/MSIGpha?=
 =?iso-8859-1?Q?BfTX2h2V2+TLdK2M+eq5qsKHAxXeYEjvcphGjzxoBpzihpBAURBSq7FdKT?=
 =?iso-8859-1?Q?cI5EqQ0zjfe/O99CO84aY+yj8OHK94I9CCVUmQbGaNm38tLFU2S60fnZn0?=
 =?iso-8859-1?Q?3xhqkeL2MKGbpd5lwCx+2HxWSHRenD84MA3O0GX54laqwU4l3AIx7Qudk4?=
 =?iso-8859-1?Q?zYnnuur+UpQc3DOUSKd9u0M3s/kkWzW1s0D7FpVV7ll5/YFv8QZv7McR9o?=
 =?iso-8859-1?Q?LbEiz5otAOX5OWEU8+Z1MGlfGOXeBj+T2Dj0DbSiKAAMzzq1mP6i+rVaf5?=
 =?iso-8859-1?Q?sDz4EK2BBW5Y3cIEVgNh+wLwCz/vPrQl3O0NMnDdbQibXUSb7mMDAz1c48?=
 =?iso-8859-1?Q?+0Vr82CLjt0vXdnKsZSTi9a1m6VOo+QqD0ywepTbAz55T9f8oWfvm+e30u?=
 =?iso-8859-1?Q?6JV56fm1DxejpmEF8r235Zo6YjXe/ybf1pkm70b+JPcGS11vUs42wRu/KN?=
 =?iso-8859-1?Q?mlfjtiasEhZBWeToUfFxlRSaUIdKxzQDmMikicsFNCy0B8G2VLCyUngFu6?=
 =?iso-8859-1?Q?NrLbS4PMhu5aLhrXKrTfKuPtSdxQDiQzoyJB8gcZ03uLifnAA+3BD1Bm1d?=
 =?iso-8859-1?Q?JSgPSKmDnFavhm4Pr4Biz6K+7X1T1Kzt8q6STCJXTbIoYrbh1D4B04w2Wx?=
 =?iso-8859-1?Q?tPvxdqLwEQHMK9AWQQHNtjyBTzeix6M1DPpLAHhX2IzAi8d9rXPk7iEJsR?=
 =?iso-8859-1?Q?PFYR+KD9J52tiXL7wp6dTXSi6zqbyH9Z2CNjp4rUMyVov7rBdpdeAu1XJo?=
 =?iso-8859-1?Q?MFbeZa7PczwNmVCfbwFG4Y0U77ky0WWjNV46/5FNyU7XsWBt9SCkXScvo+?=
 =?iso-8859-1?Q?dZpAd25v09kHoYUbE1s+WD/bTDt+G6THnklUefOGhfEAAnFv1SQFWnIVvr?=
 =?iso-8859-1?Q?MVGCmkKhaMiC8KdAhXTK9zemHvr6miO45xBlXdEsoH49oPO1kvKEqgUbCQ?=
 =?iso-8859-1?Q?Cs8ZLAksrUYhX/l3PS7dshGMmuZb4XKF4GVAdfU5MpVW0AyW7nbHcek69j?=
 =?iso-8859-1?Q?feizCC0H76dNlwhDw/PHMJUVhv7VKva4sERU3FZBdjCZaJDZs6m18Bs0+m?=
 =?iso-8859-1?Q?QJY38vRyESHLOkKqV43/cqjVxKmo6vmGHjluGjrx8vxdC3ByE8CwtRI9tH?=
 =?iso-8859-1?Q?QbWL2ydq1RncsJAgXPjNx4gmbwOikJQVRb9SMhT3Yizxhx+RH/Kr5XnwHg?=
 =?iso-8859-1?Q?7Sw25foKvRTkQwSRf2Nd5odiPg85+Mlw4RLbgpx6xnDgxX3V9DKtmZP0Ks?=
 =?iso-8859-1?Q?nQ13gWBsDqHl768Z1XOmkSfCnc242/QyvrvsYjKq/JYonc0b2lxqNmFrxT?=
 =?iso-8859-1?Q?VxWSXGMPULUM++3VkGUBWr4tZrLhItDZQMAiq84HCTsGJaBAcLYTMSMbg2?=
 =?iso-8859-1?Q?+ybNbqKFhDAYLJxP7lKIV3j8QOQGLjJsEjP6Wxnht6IQSac+qi8Luh+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43706685-5337-4cb9-47d4-08dde581c6fe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:52:51.0847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VpsJuVwC7IBiiI2EZ8giv+9cqY4w5E2J7CjuB6aleiOt0pUgR9Ch9diYgK1ZV72iCHUKTh1l1L5L6CzUJ8OdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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

On Wed, Aug 27, 2025 at 04:16:25PM +0200, Thomas Hellström wrote:
> On Tue, 2025-08-26 at 15:53 -0700, Matthew Brost wrote:
> > On Fri, Aug 22, 2025 at 11:40:23AM +0200, Thomas Hellström wrote:
> > > The CPU fault handler may populate bos and migrate, and in doing
> > > so might interfere with other tasks validating.
> > > 
> > > Rework the CPU fault handler completely into a fastpath
> > > and a slowpath. The fastpath trylocks only the validation lock
> > > in read-mode. If that fails, there's a fallback to the
> > > slowpath, where we do a full validation transaction.
> > > 
> > > This mandates open-coding of bo locking, bo idling and
> > > bo populating, but we still call into TTM for fault
> > > finalizing.
> > > 
> > > v2:
> > > - Rework the CPU fault handler to actually take part in
> > >   the exhaustive eviction scheme (Matthew Brost).
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c         | 191 ++++++++++++++++++++++++-
> > > ----
> > >  drivers/gpu/drm/xe/xe_validation.c |   3 +-
> > >  2 files changed, 163 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 76e9c93826a2..686ca5d6038a 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1713,57 +1713,188 @@ static void xe_gem_object_close(struct
> > > drm_gem_object *obj,
> > >  	}
> > >  }
> > >  
> > > -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct
> > > xe_device *xe, struct xe_bo *bo)
> > > +{
> > > +	vm_fault_t ret;
> > > +
> > > +	trace_xe_bo_cpu_fault(bo);
> > > +
> > > +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > >vm_page_prot,
> > > +				       TTM_BO_VM_NUM_PREFAULT);
> > > +	if (ret == VM_FAULT_NOPAGE &&
> > > +	    mem_type_is_vram(bo->ttm.resource->mem_type)) {
> > > +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > +		if (list_empty(&bo->vram_userfault_link))
> > > +			list_add(&bo->vram_userfault_link,
> > > +				 &xe-
> > > >mem_access.vram_userfault.list);
> > > +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static vm_fault_t xe_err_to_fault_t(int err)
> > > +{
> > > +	switch (err) {
> > > +	case 0:
> > > +	case -EINTR:
> > > +	case -ERESTARTSYS:
> > > +	case -EAGAIN:
> > > +		return VM_FAULT_NOPAGE;
> > > +	case -ENOMEM:
> > > +	case -ENOSPC:
> > > +		return VM_FAULT_OOM;
> > > +	default:
> > > +		break;
> > > +	}
> > > +	return VM_FAULT_SIGBUS;
> > > +}
> > > +
> > > +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf,
> > > struct xe_device *xe,
> > > +					   struct xe_bo *bo, bool
> > > needs_rpm)
> > > +{
> > > +	struct ttm_buffer_object *tbo = &bo->ttm;
> > > +	vm_fault_t ret = VM_FAULT_RETRY;
> > > +	struct xe_validation_ctx ctx;
> > > +	int err;
> > > +
> > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > +		return VM_FAULT_RETRY;
> > > +
> > > +	err = xe_validation_ctx_init(&ctx, &xe->val, NULL,
> > > +				     (struct xe_val_flags) {
> > > +					     .interruptible =
> > > true,
> > > +					     .no_block = true
> > > +				     });
> > > +	if (err)
> > > +		goto out_pm;
> > > +
> > > +	if (!dma_resv_trylock(tbo->base.resv))
> > > +		goto out_validation;
> > > +
> > > +	if (!dma_resv_test_signaled(tbo->base.resv,
> > > DMA_RESV_USAGE_KERNEL))
> > > +		goto out_unlock;
> > > +
> > > +	if (!tbo->resource->bus.is_iomem) {
> > > +		struct ttm_operation_ctx ctx = {
> > > +			.interruptible = true,
> > > +			.no_wait_gpu = true,
> > > +			.gfp_retry_mayfail = true,
> > > +		};
> > > +
> > > +		err = ttm_bo_populate(tbo, &ctx);
> > 
> > The version of the fault handler before didn't have a ttm_bo_populate
> > call. Can you explain why it is added here?
> 
> It's called from within ttm_bo_vm_fault_reserved() but with a blocking
> ttm_operation_ctx. Here we call it non-blocking and if it succeeds the
> version in ttm_bo_vm_fault_reserved() will be a NOP.
> 
> The functionality is to bring in bos from swap if needed. Or to be able
> to access bos with deferred backing store allocation.
> 

Ah, yes. I see that now. This made notice potential another issue. See below.

> > 
> > Also in we have this code in ttm_bo_vm_reserve which rejects external
> > object marked as unmappable. Do we need something like this?
> > 
> >         if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL))
> > {
> >                 if (!(bo->ttm->page_flags &
> > TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
> >                         dma_resv_unlock(bo->base.resv);
> >                         return VM_FAULT_SIGBUS;
> >                 }
> >         }
> 
> Ah, right. This essentially blocks imported dma-bufs from being mapped
> here. I'll fix. This reminds me to add a comment to rework the ttm
> helpers to move this stuff to TTM.
> 
> /Thomas
> 
> > 
> > Matt
> > 
> > > +		if (err) {
> > > +			if (err != -ENOMEM && err != -ENOSPC)
> > > +				ret = xe_err_to_fault_t(err);
> > > +			goto out_unlock;
> > > +		}
> > > +	}
> > > +
> > > +	ret = __xe_bo_cpu_fault(vmf, xe, bo);
> > > +
> > > +out_unlock:
> > > +	dma_resv_unlock(tbo->base.resv);
> > > +out_validation:
> > > +	xe_validation_ctx_fini(&ctx);
> > > +out_pm:
> > > +	if (needs_rpm)
> > > +		xe_pm_runtime_put(xe);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
> > >  {
> > >  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> > >  	struct drm_device *ddev = tbo->base.dev;
> > >  	struct xe_device *xe = to_xe_device(ddev);
> > >  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > >  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > -	struct drm_exec *exec;
> > > +	bool retry_after_wait = false;
> > > +	struct xe_validation_ctx ctx;
> > > +	struct drm_exec exec;
> > >  	vm_fault_t ret;
> > > +	int err = 0;
> > >  	int idx;
> > >  
> > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > +		return ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > >vm_page_prot);
> > > +
> > > +	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> > > +	if (ret != VM_FAULT_RETRY)
> > > +		goto out;
> > > +
> > > +	if (fault_flag_allow_retry_first(vmf->flags)) {
> > > +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> > > +			goto out;
> > > +		retry_after_wait = true;
> > > +		xe_bo_get(bo);
> > > +		mmap_read_unlock(vmf->vma->vm_mm);
> > > +	} else {
> > > +		ret = VM_FAULT_NOPAGE;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The fastpath failed and we were not required to return
> > > and retry immediately.
> > > +	 * We're now running in one of two modes:
> > > +	 *
> > > +	 * 1) retry_after_wait == true: The mmap_read_lock() is
> > > dropped, and we're trying
> > > +	 * to resolve blocking waits. But we can't resolve the
> > > fault since the
> > > +	 * mmap_read_lock() is dropped. After retrying the fault,
> > > the aim is that the fastpath
> > > +	 * should succeed. But it may fail since we drop the bo
> > > lock.
> > > +	 *
> > > +	 * 2) retry_after_wait == false: The fastpath failed,
> > > typically even after
> > > +	 * a retry. Do whatever's necessary to resolve the fault.
> > > +	 *
> > > +	 * This construct is recommended to avoid excessive waits
> > > under the mmap_lock.
> > > +	 */
> > > +
> > >  	if (needs_rpm)
> > >  		xe_pm_runtime_get(xe);
> > >  
> > > -	exec = XE_VALIDATION_UNIMPLEMENTED;
> > > -	ret = ttm_bo_vm_reserve(tbo, vmf);
> > > -	if (ret)
> > > -		goto out;
> > > +	xe_validation_guard(&ctx, &xe->val, &exec, (struct
> > > xe_val_flags) {.interruptible = true},
> > > +			    err) {
> > > +		long lerr;
> > >  
> > > -	if (drm_dev_enter(ddev, &idx)) {
> > > -		trace_xe_bo_cpu_fault(bo);
> > > +		err = drm_exec_lock_obj(&exec, &tbo->base);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		if (err)
> > > +			break;
> > >  
> > > -		xe_validation_assert_exec(xe, exec, &tbo->base);
> > > -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > >vm_page_prot,
> > > -					      
> > > TTM_BO_VM_NUM_PREFAULT);
> > > -		drm_dev_exit(idx);
> > > +		lerr = dma_resv_wait_timeout(tbo->base.resv,
> > > +					    
> > > DMA_RESV_USAGE_KERNEL, true,
> > > +					    
> > > MAX_SCHEDULE_TIMEOUT);
> > > +		if (lerr < 0) {
> > > +			err = lerr;
> > > +			break;
> > > +		}
> > >  
> > > -		if (ret == VM_FAULT_RETRY &&
> > > -		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> > > -			goto out;
> > > +		if (!tbo->resource->bus.is_iomem) {
> > > +			struct ttm_operation_ctx tctx = {
> > > +				.interruptible = true,
> > > +				.no_wait_gpu = false,
> > > +				.gfp_retry_mayfail = true,
> > > +			};
> > >  
> > > -		/*
> > > -		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > > -		 */
> > > -		if (ret == VM_FAULT_NOPAGE &&
> > > -		    mem_type_is_vram(tbo->resource->mem_type)) {
> > > -			mutex_lock(&xe-
> > > >mem_access.vram_userfault.lock);
> > > -			if (list_empty(&bo->vram_userfault_link))
> > > -				list_add(&bo->vram_userfault_link,
> > > -					 &xe-
> > > >mem_access.vram_userfault.list);
> > > -			mutex_unlock(&xe-
> > > >mem_access.vram_userfault.lock);
> > > +			err = ttm_bo_populate(tbo, &tctx);
> > > +			xe_validation_retry_on_oom(&ctx, &err);
> > > +			if (err && (err == -EINTR || err == -
> > > ERESTARTSYS))

This if statement looks odd.

'err && (err == -EINTR || err == -ERESTARTSYS)'

The 'err &&' is not required in the way this logic is written.

Should this be:

if (err)
	break;

Or is this an attempt to call ttm_bo_vm_fault_reserved which calls
ttm_bo_populate without gfp_retry_mayfail on OOO situations?

Also you don't check err == -EAGAIN in the existing logic which
ttm_bo_vm_fault_reserved does on the return of ttm_bo_populate.

Can you explain the reasoing here? Also a few comments in code
explaining the reasoning of the error handling would be helpful.

Matt

> > > +				break;
> > >  		}
> > > -	} else {
> > > -		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > >vm_page_prot);
> > > +		if (!retry_after_wait)
> > > +			ret = __xe_bo_cpu_fault(vmf, xe, bo);
> > >  	}
> > > +	if (err)
> > > +		ret = xe_err_to_fault_t(err);
> > >  
> > > -	dma_resv_unlock(tbo->base.resv);
> > > -out:
> > >  	if (needs_rpm)
> > >  		xe_pm_runtime_put(xe);
> > >  
> > > +	if (retry_after_wait)
> > > +		xe_bo_put(bo);
> > > +out:
> > > +	drm_dev_exit(idx);
> > > +
> > >  	return ret;
> > >  }
> > >  
> > > @@ -1807,7 +1938,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset,
> > > void *dst, int size)
> > >  }
> > >  
> > >  static const struct vm_operations_struct xe_gem_vm_ops = {
> > > -	.fault = xe_gem_fault,
> > > +	.fault = xe_bo_cpu_fault,
> > >  	.open = ttm_bo_vm_open,
> > >  	.close = ttm_bo_vm_close,
> > >  	.access = xe_bo_vm_access,
> > > diff --git a/drivers/gpu/drm/xe/xe_validation.c
> > > b/drivers/gpu/drm/xe/xe_validation.c
> > > index b90fda3dd5f4..826cd09966ef 100644
> > > --- a/drivers/gpu/drm/xe/xe_validation.c
> > > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > > @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct
> > > xe_validation_ctx *ctx,
> > >   */
> > >  void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > >  {
> > > -	drm_exec_fini(ctx->exec);
> > > +	if (ctx->exec)
> > > +		drm_exec_fini(ctx->exec);
> > >  	xe_validation_unlock(ctx);
> > >  }
> > >  
> > > -- 
> > > 2.50.1
> > > 
> 
