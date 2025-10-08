Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9856CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 03:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA4510E03A;
	Wed,  8 Oct 2025 03:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOBhWstI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64210E03A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759893366; x=1791429366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yYf6eYlxy0wX7o0hUpxkHaBacehlqmJTk9iyi/6BbiY=;
 b=XOBhWstIqdOq0kx9JaHwA5Whk0NjdibYw8C4by0yyaQequC9Wol6TzE9
 qM2UuhghBRKgAZ2sT+wezCrt5U0BD2IZ9tDBaESwJjX1P7KHKzl1SK3sY
 XkG/xcm7fznkBTcWRMlKHrcaKj9GX7+poqjEaI6TYRDWVMx6hKMzIgPm7
 siDOMvgtsyiskRJO9PpTN1kQ3lpIjzOX92ecYBnn2ZHUVwPDGzNCJykf+
 AqyqPmqITPSKyhtVd1BnLPOFRyrf8w67YhgnbZk6T+vb7LIE/Uf2e7kNw
 6OTLKiKUjDYyyogN6Sy9ktluoc/7BHcdGzMhZQc4eETKSst9dTbvgGHdn w==;
X-CSE-ConnectionGUID: uVXR5tp6QKipyYf59XMw/w==
X-CSE-MsgGUID: dJI1c4nLRDSODWPtNTGCbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73184797"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="73184797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:16:06 -0700
X-CSE-ConnectionGUID: pFcNa7ZGRAmsrYE+g/FdIw==
X-CSE-MsgGUID: ysJBH8yyTOC10vSQ9TijPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="180273748"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:16:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:16:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 20:16:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llL7CSB4ugPRgVwt5s0rqrM95c/wJgCeRwBoJ8oMbI2P1AYeTwDR8UxysJRFVAsio4pCWY/NkisJG3+qt9m7xi4y5wKUG/oA8jdc2BiLJS+kpIh7Oicyb3rVo5RfTXDwkoSEKahFrUPJBbNsOLVPRPvmlmWAYeQZ9BNfUhwoEzpn0KaDE/N28vCIW3yrvqNLVaPKtPMV8vSXNg70ND1woS0f0FuVxpDGs+SeunlD68jvMlwhNuang1W7K093SprxrRepSekH1dvVFF84tAys3GDzS2gUCFASLQA8IlMHoyNQimE/Q0NKx7UrZGQB0SFEwJ4efoT/VnvJYgGnsW1Bmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC9+/OZ1BNOK0Tk1leguiBRz4DPwYik3A2QkzH6RmtY=;
 b=rPyMo6Kq55hGFM5fHkYIPC/GsIEuXQRrgGZ5kmQEUAONjZ6RUhkCtcTvXQ2JPPmbWfJfZHrzjMkdZeLkPhrTjQLWneLF6792xEDMs94KeZHDnuCqloNz9VmzsBVXqq/fh8UogTNeGQE/DqKCEs4VSlFAWNgyI1QEf/Vb129hJBxvf2+Kn3eS9xXXx6PR82IzS9CYsLArbMDBdwxObguGy739EUDfOmjjsGnUF4dhvU5GQmZdmwEiNNsG6pTbLODqKUE1pTbMHli4Soc5iaD2p0mLDG070VOeXAZzO+eaJBKONm75uoqtxdW3fnycwr8ShcpY4HJpmixOevaSnSqnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 03:15:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:15:52 +0000
Date: Tue, 7 Oct 2025 22:15:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 21/23] drm/xe: Break GT setup out of xe_info_init()
Message-ID: <6mht6nqwy3qmcteg5ga2dan36ditjy3letqull4rsvzt2gvzqg@uwi45p5q33x2>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-46-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251007204829.1468209-46-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe748c1-7425-4c53-ce94-08de0618fcdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?klsFoRrG3nPNnkGFUPXNZ0gW6foUTuY+iteidJDWduTpCXFMabShUUXsCtBw?=
 =?us-ascii?Q?xGCMRiI6mugvNCW/3OWWddwN5w8gI6cd5opT3zQyCp3eaohEHbRViuzvm62E?=
 =?us-ascii?Q?JWbaJ4n7rcXhP7CJb9XvqBKfux12oIG64yKTS4XC9i4c7qzapGnPu+nG5D0h?=
 =?us-ascii?Q?PxSTajMUgJFYvetWstP+RAUo5ETfj3fT3F1auRWHP8eGYipIazb1KvaahMOb?=
 =?us-ascii?Q?eAJUWFXarWq2IE1Hp1KeI7D94/D1MAw2cfxSdD1aKLKZnS48Fa99socWAKne?=
 =?us-ascii?Q?dm/67R41Xbw0Va6MztCtu80snY2KsYA0565twtZrqgjIVLicZEYkElLB4aY2?=
 =?us-ascii?Q?BZbrav7Ir9bRJiULOVbaGKwTxBrJh0IzsO98Xkelv0aHtJTc83oI9i74VrBu?=
 =?us-ascii?Q?mHV80msrhCRfid83jacflguvF/WnhhlwztbKoKpH8THV1gd7s0xzwLDtM1nA?=
 =?us-ascii?Q?2ofWaXRuekx0i+XoQ7euBVnYxhuS9+/mXbWo9mb7RFbFTot3V58kyk1rBFOC?=
 =?us-ascii?Q?syT4dGGzodpUbrbVMXw8H/+OJZ/2eXINShhNZJjzqzfDOXV5/G4wAoJ4qkaI?=
 =?us-ascii?Q?3BSF2iqAuPq0tJ+5Ja9EjHktgXFkN9D1mep1ojTyfkFHErEl9tb2LD9vKfmF?=
 =?us-ascii?Q?bFuZ3+v57CcVnBS3pin6Bj6zY2mQiSjwBYjEzkPkltHBCChwy2anvowz9adA?=
 =?us-ascii?Q?DzAbEfxghJ4ppdF9NHg7X9QgO+kOHv59EglrOYE4Mq0OIrvDQWs/SBY4nvpc?=
 =?us-ascii?Q?SRog5WUJCn4SEtUNAjmll5sHpwYawP9JKiPjfRX6eRNNYbyC+nx7nEgx3aPw?=
 =?us-ascii?Q?8NuMo5Sx78XzRk3ic7EnfibYaMRJjksWwHv1QhS74DAx/XuqBpK35et7ZKPh?=
 =?us-ascii?Q?Yjz/kBNRvM8ULGIFRXdYR/QdOj5MdVb7trDssUjJRU0LvPZgVW246K/WTwWz?=
 =?us-ascii?Q?MYUnB5xkIJVDifrZZkE6DEVhYGu/s4dZPE0OXM9/ILW8mub2ZAnDK207QqCs?=
 =?us-ascii?Q?mLiQZ1Rn3Gdh4oD2N+PUlwsM4VV15VMiOTN/twDfv2uUN8JV4ycMDZtEKDAr?=
 =?us-ascii?Q?OWyIEGmCuYTZHio/EEvnolHw3PFQtok5RdIQC5UO2GJ+xhhNVZxb5vn8/sz/?=
 =?us-ascii?Q?2Ao2x0vcnDdNm+b0xDD9lVfr3NwDqpFnbIyxPG+Ir4wSXFH5Eb8m+aP0Vtsh?=
 =?us-ascii?Q?cdNh8AZeNbF2ZycYgb/Q2poBV3YreNrpspFb2tNuAYIu2eBg0kW6K/1zwJOK?=
 =?us-ascii?Q?B3lltcatbfx6SXAn67aWZuxhyvGK3QK7epS1cIHbBiv4G7aTo/X70DUYS0nc?=
 =?us-ascii?Q?v/2fYOwPYPcVfty+U6WoFpQiBz668OvaSluEp/EtfSD3wJwKmdSufZjKpufU?=
 =?us-ascii?Q?sR+GXoETPZETtSWD8AsiqjiBuMqQOQwqjwTuucM8LlcRNRoVRIEy57ZoATuG?=
 =?us-ascii?Q?4Zw6G8Vp9GxbpB1es2KE7vP3BkOV/k2c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FZElzDkKjbWoS57uVs8JOCPkul+nNd0ZaJYJIfspkJ+voZ9wg8AFFYg4JJIW?=
 =?us-ascii?Q?llKe+1kxmuCNK+uJpfTFV7LzJpLsmKnnEshsJVtSvQSDzpVsrczJM2dXwH9s?=
 =?us-ascii?Q?Q01LwAU7mdMGhzWIcWL5LhSQm71sq3wHgWHdgEZcFH4JBPyI7LmdsOcPRVGc?=
 =?us-ascii?Q?oqQrzVDZNw6CXj43KCS1lzxm7cuWhCGdvgUXlc7YlLR1SN0i94+8CmGg/65c?=
 =?us-ascii?Q?Ebtc0QfAX8NTm8/HtQ4vgXsMicKE4h61SSmUzHwUlSKSBscyHnhypGQ3Yja2?=
 =?us-ascii?Q?t3gTyAbmXr7KBEqApYlbqb6Ki1lOfTv8JqV96Qmc6Z+ehMzDXMrhv7ces3Kc?=
 =?us-ascii?Q?Xh0Vvbyb24xV4DE6WCh7ucsywy5RM95bXvLSNvQsMKDgxnuvlL8KNmzn8gBR?=
 =?us-ascii?Q?osYcJVwoU3JtPD//oH97php6hcQtcWKVBplDC4kHH3zixqSATX+h5pVDUeRj?=
 =?us-ascii?Q?lcelhnZ1fO5LtELneZsetoJ54D36L7ZR7Dp4PjCAxLcrEztnT4a9JM/O0FXa?=
 =?us-ascii?Q?OkqKFLmAwOrRtOISqjiPJKPKBdJxVIAGsIOJDdpq8c0B/pG6fQGtK2ftyedZ?=
 =?us-ascii?Q?PTbu1tCEQ3JrdQDiNsL5r8vFTQUj7laRHn5MZx1W3386wiboJ9Lm8AufJkF8?=
 =?us-ascii?Q?Yf7khQ0QGtN2vTxVPLz5oPLeEqYwtmiCCEw+Bha8D1w7YOXJpPquYORNDZrh?=
 =?us-ascii?Q?EjGyvs80ZZ+mMLYpgxSGyuNk3eS+ogRRhjxe8e+6QbroNvONgXJWRmAD69Ne?=
 =?us-ascii?Q?W1B0ifYou8DT+TVPBTWVw5zHmw3cQiJc2vgYcU2Ua1Z0xhryDqVdLus36uJN?=
 =?us-ascii?Q?iGNcNId7/3HTQzZ/RxNWV4RO+9PFgry8mD+w7pR7cADn5HL0KcYEDwXnsKj1?=
 =?us-ascii?Q?yaVRah4E1bo4pM2kbkkd3i5ugPDILYj4zo6RRf4xGO+67cSjTvgX30R1BMct?=
 =?us-ascii?Q?EtP8s7xV2hRSG7+bGYVJC2u5DeN251H6KUNmQCwIWXOY6SBY/85FLEdTSne0?=
 =?us-ascii?Q?VVCxDwrnvWDRBqz8gir7n5w+6sxLyxjvgxJslM2tvJVR5KeaknUolv1xT6+M?=
 =?us-ascii?Q?5ne83mTWKJmcKrtu1L+0eS1AzwU+aN7nBlnzRTi11AwYQYhf0oF9hl/MLE3y?=
 =?us-ascii?Q?Snd5LyyFip8uTJbHSm/Gp/C4kfbgb+N3JwW4CUmC6ZpI7d6CLoQpoE/hH+Xj?=
 =?us-ascii?Q?jfIB9cLkrA1am5TXJ1CpRsk0vjX5EL+jzARAM5LUuaJxZxmTXrorqscWYqEv?=
 =?us-ascii?Q?9hEepe4pxG9N0E6tMvPDMYHru4UhNU9qWXG9L1eFHS/yfpybD3a05KkRHag+?=
 =?us-ascii?Q?Arl3MpukHfF85FMohP8ZxIQmr8mvVrEdaT+onk40QdwpyXaInaeybDLOPnGe?=
 =?us-ascii?Q?wrTs51fNI7xjZKT/HYeSST1tWblSoapACm+HUa8Sle6c6TkSSc7ahoCZ2ecR?=
 =?us-ascii?Q?nlLctTL7A2wdV+X8uXS+lPuVpAdnr5enI+NSZOAYDHutqXmXY6D4RgXtE7cD?=
 =?us-ascii?Q?00YK/bnyi7s1opqLFj1XjZyUvW4jZT9E3N7YGrE9mkO2j9W44nnSk2xqOguB?=
 =?us-ascii?Q?LzT3s37i5VNT2PizPdLcNiYrrtzUSnJ9TqLFVYST0fRGVlv03ysd+Kcwh+qM?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe748c1-7425-4c53-ce94-08de0618fcdd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 03:15:52.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxo3evHrfgmO+0/I23XaT8wY9eLFlAi+Yzj1KHtMqaNi2QenBD6VulhIA9f+TBTcmq+dbtZbH9dupA1YMZcmgES9RrRTnILE+WjPTdkoY54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
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

On Tue, Oct 07, 2025 at 01:48:51PM -0700, Matt Roper wrote:
>xe_info_init() is getting a bit long and hard to follow.  Break the
>allocation and basic initialization of the xe_gt structures out to their
>own functions.
>
>v2:
> - Rename new functions from init_* to alloc_*.  (Gustavo)
> - Move early NULL return of media GT before allocation.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 88 +++++++++++++++++++++++--------------
> 1 file changed, 54 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index f7aec1c5959b..a5932e4f4a23 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -688,6 +688,53 @@ static void xe_info_probe_tile_count(struct xe_device *xe)
> 	}
> }
>
>+static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>+				      const struct xe_graphics_desc *graphics_desc,
>+				      const struct xe_media_desc *media_desc)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_gt *gt;
>+
>+	gt = xe_gt_alloc(tile);

Eventually I think it makes sense to move the desc defines to the
corresponding _types.h header and then leave this to be done by
xe_gt_alloc().

But that is a (potential) separate cleanup. This looks good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


>+	if (IS_ERR(gt))
>+		return gt;
>+
>+	gt->info.type = XE_GT_TYPE_MAIN;
>+	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>+	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>+	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>+
>+	/*
>+	 * Before media version 13, the media IP was part of the primary GT
>+	 * so we need to add the media engines to the primary GT's engine list.
>+	 */
>+	if (MEDIA_VER(xe) < 13 && media_desc)
>+		gt->info.engine_mask |= media_desc->hw_engine_mask;
>+
>+	return gt;
>+}
>+
>+static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>+				    const struct xe_media_desc *media_desc)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_gt *gt;
>+
>+	if (MEDIA_VER(xe) < 13 || !media_desc)
>+		return NULL;
>+
>+	gt = xe_gt_alloc(tile);
>+	if (IS_ERR(gt))
>+		return gt;
>+
>+	gt->info.type = XE_GT_TYPE_MEDIA;
>+	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>+	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>+	gt->info.engine_mask = media_desc->hw_engine_mask;
>+
>+	return gt;
>+}
>+
> /*
>  * Initialize device info content that does require knowledge about
>  * graphics / media IP version.
>@@ -770,48 +817,21 @@ static int xe_info_init(struct xe_device *xe,
> 			return err;
> 	}
>
>-	/*
>-	 * All platforms have at least one primary GT.  Any platform with media
>-	 * version 13 or higher has an additional dedicated media GT.  And
>-	 * depending on the graphics IP there may be additional "remote tiles."
>-	 * All of these together determine the overall GT count.
>-	 */
>+	/* Allocate any GT and VRAM structures necessary for the platform. */
> 	for_each_tile(tile, xe, id) {
> 		int err;
>
>-		tile->primary_gt = xe_gt_alloc(tile);
>+		err = xe_tile_alloc_vram(tile);
>+		if (err)
>+			return err;
>+
>+		tile->primary_gt = alloc_primary_gt(tile, graphics_desc, media_desc);
> 		if (IS_ERR(tile->primary_gt))
> 			return PTR_ERR(tile->primary_gt);
>
>-		gt = tile->primary_gt;
>-		gt->info.type = XE_GT_TYPE_MAIN;
>-		gt->info.id = tile->id * xe->info.max_gt_per_tile;
>-		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>-		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>-
>-		err = xe_tile_alloc_vram(tile);
>-		if (err)
>-			return err;
>-
>-		if (MEDIA_VER(xe) < 13 && media_desc)
>-			gt->info.engine_mask |= media_desc->hw_engine_mask;
>-
>-		if (MEDIA_VER(xe) < 13 || !media_desc)
>-			continue;
>-
>-		/*
>-		 * Allocate and setup media GT for platforms with standalone
>-		 * media.
>-		 */
>-		tile->media_gt = xe_gt_alloc(tile);
>+		tile->media_gt = alloc_media_gt(tile, media_desc);
> 		if (IS_ERR(tile->media_gt))
> 			return PTR_ERR(tile->media_gt);
>-
>-		gt = tile->media_gt;
>-		gt->info.type = XE_GT_TYPE_MEDIA;
>-		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>-		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>-		gt->info.engine_mask = media_desc->hw_engine_mask;
> 	}
>
> 	/*
>-- 
>2.51.0
>
