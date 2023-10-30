Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62956C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 13:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143710E2C3;
	Mon, 30 Oct 2023 13:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E0D10E2C3
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698673006; x=1730209006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x53zQEoEZ+WbA0LAK36PixJLKy4hWMveQodVq2gCzbU=;
 b=U6L4C9GsqpuL2k3MNDhiSJLGwkq73z5IUxh40ObiCSFsneyw61y2IPCo
 S24mYaWJ9CJbrzqImnO9dzqs2wyNbzwe5jIImPn1SHbKoBLLBVSl22ebG
 3/EAUHG79G9rkmF1trCesGN/RGmiuNSJkdSl6rg3qouVIjGsCQTM4X37e
 PQ4XzyR8Q0xdz7crz+DxWngZ+8LU4jY0DlgJfzuPgcH5glUnPwezPODIV
 BNurJlqE785SJTnbRuIFBS18iaOgP/nq2ld0VsQxnJ9rf45tVdyU0pm2I
 t0TvPUGrFopi3KnyMJ1ZA4bIlLjdYNzHDcnl937ihXLJc6WAWytIdZ81s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373118679"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="373118679"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 06:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="763911314"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="763911314"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 06:36:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 06:36:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 06:36:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 06:36:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 06:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV/GeR86cqQ9DPT33LJc1GuKzhyBKuSYqbbCZP2XyjESHDwb5orsrY40/kHfQlXs83V76VpIE7xA1D5z7QdxpHVPR7n0XzbXpHjzGKY2aW/JBFI8IXvPR3lF2KHOlirypl17Jlr0UesnT2oT1WWrBv9P5kC7TP8fboAX9nKJcah+zeFErAY6cQxu9CJdBVpn/PoR3klQiMtPjFJoEo9jcbFj1yks8oIyl7wIXE+ji7TXpvL98lWHAbYOeRMiT36pzGVKZAX0go0IOqlk9sxa+DwdkuIYA/kEAaWtDAoQ7BfyZh43Zmz7JWojtyx429DsKozi5BfgDNyMbOLr62dpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x53zQEoEZ+WbA0LAK36PixJLKy4hWMveQodVq2gCzbU=;
 b=IukZ84Oi/waLsB+gU6X/BHsErUSX0hzyrR1PE3KSSBoG3zMqKNsCcnYrNg2/+r5CnKpBjiVdIr9RACpQbQ3ZENhkmekiogY7gugNfqrmrfcWyldJlBejqSzn07KFulCDffyqM8cKAwKOGhpXJfS2EF93Npae8LHWgW7QM2ZEVhEinLLq6CoVxYaYd5OZ+X1TiAQJR6o/BfIN/hGy5rhQZ7l+6fzX9EjdjnFlFPS25NxtXplJHTZ8LxOwZ4ezWanCwhfb3aSj5xHSwQ4Mis0Bs1Q5kwzBCZ7l9H7Q2B5keP/OX+GjSFLjvksqOUYAFSYMJrYhu9p+9KhBXZn/5Hi8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:388::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Mon, 30 Oct
 2023 13:36:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 13:36:37 +0000
Date: Mon, 30 Oct 2023 08:36:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Message-ID: <rtkeen2glxkgbkkvosxylxespxhkmvyf7fqlpvz6voqaj4j4wo@w3qx2t3x7zkx>
References: <20231029175326.626745-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231029175326.626745-1-kelbaz@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: d62bab82-5d22-4997-47e5-08dbd94d3d5f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +VrBcna3kt5kDYSYAhwkP7yXOf4kcvanB3gyO/qrx6cIWOl6afEur/WgZhzi/WwmgtJWCPVTRZ8Z9Oko9p3jkYcM4Gww3WSZSncpheBK6e3hkvh/KY7g+dEOwKI8oIMy37+eRLh/mEnQfwPu/Ufupo7CgQppcwyr72B1u2Hka65eZWn8envVQElilMHdGTEQRKJpOkfZrYJh6Ynbu3EdYMHOmfTkoVWet29TYyivxkPi+2hBHMeLSzjC+3XUZ3HCQDe+0zysa6hsA+mTV5wef+NmLemcaKT++6XdZzafFoD1EcCGcyRHAd1nARqt00QsIykM8tMpKunRfd5fJR7Pr699Ca/wzB+i3C55MU8SKbn+ODCXERNXAD9+aVLY2nDHf2+9QEES6RukXojqSPC67RqBgg1W8URBY9elvs1vSOK1+RK9gmhcAwB3BJF0k5U3GHufO2uhZv/Zfa0YYSWUeJcWPdY9diAftHBaK4pkJE0G+mddF8RYOyRobcFNLkTzPYdYrxvsvLzTh4k+e3okRVHccmYe0tRLDNibyBm0ilVgWhBhFJpJPnK9fumg32D2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(366004)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(86362001)(41300700001)(5660300002)(4744005)(4326008)(8936002)(33716001)(478600001)(38100700002)(8676002)(6486002)(9686003)(82960400001)(6512007)(83380400001)(26005)(6666004)(6506007)(66946007)(6916009)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Vk+QhAdkR62DORxf3p2AK+hpPjVhJXTTBux4k/4ZIeJIR34ru0I9IYccAfM?=
 =?us-ascii?Q?g00M1gPVaQ0qN+x5s+FcYS6axq8AGolc/Jf6ktzdZd6mEPNVlsap6/7kS7CT?=
 =?us-ascii?Q?u4VJCeOcipEDKjQjAmtY1IY+qUr8YpvBjL1xVO3gSjrccJCoR/bKpmOUpjXH?=
 =?us-ascii?Q?NP12ZFyZTBLNq2GQ4IqN+YcLxpYzh+XfDJAFwhS23QTvCDhs7ngb1pkaXaE+?=
 =?us-ascii?Q?tDuUoiUrURg/A/Aiu4ZH5UlMbgu/cTHpuEhAJoyZsmZaG00bhMk03ug5GNEc?=
 =?us-ascii?Q?51bpv3yKkIkDY7sybtfAJMI8z7gl+JPMTBb9Ubpi/h8U+UXr5g/AtZ2eRyjO?=
 =?us-ascii?Q?Dxb2zKSDHZOz0qUwxKHrVSA6ZS3xKKh99PVS6/yM4ZP+CwsyHy7clJedcTgA?=
 =?us-ascii?Q?AFKeXEzP9lCmCkE9rbjAUiMVfldS9HOWtKOVZC+yU1V6Wbzg/patPFPn6QXG?=
 =?us-ascii?Q?F/SwU6M+59jplf2VLL7Uz3qNiWuqeZeshZW7wLrNoSmdThzd92lh9QXrwsne?=
 =?us-ascii?Q?PuSiKH8c2KLdkQuyFCyMgqs+dc2dia4QSP++RQ5h45k6rARmdXxTcZ2zeRFr?=
 =?us-ascii?Q?s8tZSFyt9KJPnf8P33fwdpyIgXBW8O4UKVkdQ6i7IGjPZwZ0MAwbdpvvk3cE?=
 =?us-ascii?Q?eRWpLerV66Yi5+8ngSYs6SCpMfMY/vdaGl8Pqpu+2ioR6+EuEfuGmCpYMLSw?=
 =?us-ascii?Q?p0xyt+BVdQwFEc/FHXSBQS9HnkewX5VuywtIW8TrhOzxTiiLtteay7Tg7d4w?=
 =?us-ascii?Q?vG75yAvqcAgPRb2/X4RAaMS/olZpZG/Xwq8dxOiMJhkib7tPRNxmPVoH3wta?=
 =?us-ascii?Q?G27CHrld8fZbRtCqAj3atjLhpOoMFhAj5cB5YUx9qLqfiS/tkh8y3aBAM5PX?=
 =?us-ascii?Q?kjjpvhyvNAGrhksnk1EgaKXyN7NkAIGwRhUNBb4OY72fZGokB1PCmFsCmLp2?=
 =?us-ascii?Q?WrdVsl4PpS503+mMpLn0KXWY1zDpt+ZEB5xjUfXBJ6k+cVVzHEC/E+maHfLd?=
 =?us-ascii?Q?Z/uG20yowanK0ZTTTNSAbMDrp5+hP78+Kp2YKdB01WX873iHfbTY9wbMbPG+?=
 =?us-ascii?Q?32KIbHYM//W8Hzm8RzXFRDugv8btucMCaIjSdQYNw+DK5OvqSU/zCPA+nCqA?=
 =?us-ascii?Q?w4DOw+P/+OVDwXFJTPIonTblXzj5arnqwn7ugVSB8O9AsNV36cidQ0RdByFK?=
 =?us-ascii?Q?adM1py0f6fOKVpyxYBAfqT8weH/Xj33uqodwAobUmwKSlhAaXAUhI3Kpi1X2?=
 =?us-ascii?Q?I7vCk0af6wO5/SkjtYMdx1SwjI3+AWX28Tg0gZt9uBMze2EbtgpL7Wlni+Hn?=
 =?us-ascii?Q?r1ouwq1jKF5T3t2BxGckNrTTTJPRrFLxP++0Wksp9vgcSA/9FZaSbLFmfijk?=
 =?us-ascii?Q?rZl6Qkmk8iycfp25MJ2SoFENhfuTg6dghDr8Qy1PKgq3a7okpTqoXtzyOpNY?=
 =?us-ascii?Q?nqXvbqYoQv7GvDudETC6ITHThLaJ93qdKc/lcBpY/MYvQ+q0ixCr+ePF2exO?=
 =?us-ascii?Q?COWxnhQSEkIUXTAgLUQ4xWs+9eViFtW52bISYTugmwxsIhpcR0DLyMRgKNNM?=
 =?us-ascii?Q?6qq7c2lJlGXFeuckeyANxxEbd1BHhlX4ULRqa6B1TXqupFy6LVyFgLfQmdXf?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d62bab82-5d22-4997-47e5-08dbd94d3d5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:36:37.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/YvZtI+roM8YTUBLCT+avModuwg034553cBaF5mizN2D/xPdQPGoM1+Rb8TqgLL8GaYyD3mzi+sm68ky8WJGp8XT38OzupKbgmfNUNddCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: move the lmem verification code
 into a separate function
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Oct 29, 2023 at 07:53:26PM +0200, Koby Elbaz wrote:
>If lmem (VRAM) is not fully initialized, the punit will power down
>the GT, which will prevent register access from the driver side.
>That code moved into a corresponding function (xe_verify_lmem_ready)
>to make the code clearer.
>
>Signed-off-by: Koby Elbaz <kelbaz@habana.ai>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
