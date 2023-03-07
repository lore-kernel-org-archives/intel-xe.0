Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3BDC678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083E910E38A;
	Tue,  7 Mar 2023 09:31:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12DF10E38A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181467; x=1709717467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8YsSR0d2rmmr9cdFqvTDegaYMFWczcgutyBzT1D2/Ew=;
 b=Ho5HRX3ImvT38wucOsuRr0ZUP7Ro3JEZDlrae19o1FZ3lIw4NR8r+zgl
 7JSfVvy+8QgUOA0MqTY6d8khthbt9fZPknBa6p9lgzTnon2Doc4XogVGS
 qyuKo9dydSu/SzMBYEawF1EjOMzbb5P7jhaNCmM1lZFtbJXj7Wz+WGuQ6
 2SsXnQibQTdswdBsVPhQVH4h9WXKCEL7hBjDNgaouOeeeJcLfgmjckzPr
 ybCA3nC6NvvkTzQKDO7nIGWuXB0wtxj2YiizspwXxz8eoTFtP8HENE2xD
 FkpOgQXL9VS9TjvW/L6xgzctle4Wp8Nxw0fTJVTKkO8H8uqB56OFilZCC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333279287"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="333279287"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745404541"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="745404541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 01:31:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 01:31:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 01:31:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 01:31:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqEy4dFVajsgA1U6rIFLfDZPMFwcqJtqkdyXJ+WCwCCMiuS9URyowgUT5zZGxpIfMdFZkExmezB6jzpzpKPWSzH4r/jS5sx9BL/bd14WspHDQyoVhVUuCJcc21uw1/AQRwBuHKAwgSC/b0fs/bt405nG7Y8pnA0vRczFTp0Zr3TpjHvc9aqhcNBBBk0Hc9QTOXRO7Q1MbQcjoXubiw1nrL7nx1AHtd5vtZYLYU5UqRI3AVWTpDDdes6BzKoGhNlCeV2oDqIfN8IuDJLfXbDC+4dbxcAeG1xKJdTvFd1/c8xneDg8IfZthiohU7DriP99lH9cBsRQDmosa/ILw2uoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56UJQoa7afphJ4+Wv/aCG4KtbWCy5MM6fiTCvOSDWVw=;
 b=SISJj8wqg4CNvN/BrGWlE2IJylqAVS2Siq/EfFnOFWONm7XJJpDeUwEYMZnMawysnFa7N6f//fyCHoFKZFdzmOYuPFECczTV3u6XjMjjwWKyOauP2HcEbUoe/hJ4uLpJ2vy78jdqO7xlg+fTYJeCNxM4MBjWzlJQIFoD0Vf1liigHk2HCwDUFxmuFnDzvRQx9G2Bu4cAtLVHZxpB/8JJfwS6vec0featgTQ7vreB0pIgHtnj90OyvfvmHCAvJm9bWRO0k+mJspEkbJ9lmD8UAaAx14a9/tuBmSggcqMtj+Rxs68d2T+fjsSPJCdyZQ8bQwM1FESvlJgt3XGlqVI3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 09:31:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 09:31:02 +0000
Date: Tue, 7 Mar 2023 01:31:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230307093100.oyfvwrhpb7pogvrd@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cac653-76dd-4dfb-6de8-08db1eeeaa8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5stYm2JwyzRmyXA0x7C7hMd/61faCxXe+D4tTmo++JPebzFNqQfyF8DM94uAyTNNQCYroyPeZ8ILYoUOhIlWkajv2ASnOR1slb9CpAtc/Dl/HtGZ7T3u4po8kI1ezsRf+PLuYb4vwyFirPYA+6iph580TBysjEwFhLpKJlZeVcNK6zXKO6CP69ZcnY35skPFoaROKpGCcGll3lhb1UY+/sStm3wdze+ugDpqPUY5C/+ImcPIiqkhybF/oJn7OmBnayAFPM12kArhk6IwX6H75CK/HHMna30iFDs8PCFnvBBRfcPNVTBb+z68HbD99S8hCPBk0UHAIpubhM2k2tM8G1LOrVRFqqbH6WxCDRfvoszE6U/XcizSS3BxY+r+uo4F3/oQFMgYUjm5G3M9mdmIrowSFMtcuRqvm0cTTMmiAZlWMlcODeeCgVyZjp1ZIgPF4nQMnR+2wCfn+aEmgeojni26b/o454J2c9uAzxFARboynniiH7M7SRR9aNGk0ZgNNAVe2bdgE09N1gys4se3tL1tG4Iu5RQGy5VIgm1BLHfhbJh86TfIzCLpeViDGkx4bAIIWx3YNZMxEcrbBcNrTM2JjpusIYQ4WqblgUJ8n9/KqMWvxafaiTTqraRlrR20GKKqtxI7bxTpADtWizerCKyKkysIvk/tsVcTTChkl1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199018)(5660300002)(478600001)(8936002)(36756003)(6486002)(9686003)(83380400001)(186003)(41300700001)(2906002)(38100700002)(1076003)(26005)(6512007)(6506007)(316002)(66946007)(66476007)(66556008)(82960400001)(86362001)(107886003)(4326008)(6916009)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CYy09lW2xO/kDpZXFZX8XtWTPlWOIl/pMcbLlcnHznTqtxO+9eOHUr8iaL9p?=
 =?us-ascii?Q?FstGadf6RZum0wjbrNBpTSqW5OTtTMOUSr8bK75bIT2O8voTyWfhQFjvsy+y?=
 =?us-ascii?Q?jOosUMf80dxLkcRCu3tkBiLvEWSjnf8UB5raa5yj2VEyJglnixT/y4mulI1C?=
 =?us-ascii?Q?/wfdVtTku8aNNEJR3CEKPDN8BDEgV+FgaY5kU1jcv8Nmz4LncMbqNHXjY42e?=
 =?us-ascii?Q?j/cDgAO9R2aMGqSF/7dE16+wbDwJ2rtAtsTu7pj1cr7G5GuD1begYOIXa3vV?=
 =?us-ascii?Q?xe7wmqAdLCB87m82GRcZKrm/zWXoxH8j+QGphTfYDuDsMDdiuhPaJNKdvXkZ?=
 =?us-ascii?Q?hmMvouY4MsAF+qojQmIcs98uLevAHMuOKfeHgW8NN69UUR5mp42g0xhFhVXr?=
 =?us-ascii?Q?xLZ2brXCj/XO4ROiWVgAD3F2FmD6ep1thLeZsY3krO6ULDObLHmWUsbAqlRZ?=
 =?us-ascii?Q?VmFaJwoutrVReIG/f2mJr8F3HRgDU+aY69OE7HYgT1CC57lmYc85rZhc3+WV?=
 =?us-ascii?Q?HPWgp/wEMkVOXlzJ1tHyPSQ8RMkb6Lut1PQPfsiT/MLNu7zeqBl6zm5AwMZ5?=
 =?us-ascii?Q?0ZS/I0DGD5T2VhqS+C3c/kwvLiJ3hY+W/vz+jGTWmn053YohZZUcmdC20jSY?=
 =?us-ascii?Q?tlb+CC52C2gQpXjpx37KBY4ReZAm/TghuKF/f3pLEMpM1h6+yciNE+koo+vR?=
 =?us-ascii?Q?qv8DG04K1HU3iZrqKP8y6Tu2K/Y/Hv5tDsNieGeRMFuwa/ntxqxPVRrRQsvg?=
 =?us-ascii?Q?v4DITvHv5UPM2OUqCIrEZRDJembZ59sgYJynxiaVO0IjrzeyzNDztrF0CfTv?=
 =?us-ascii?Q?F5uSD5bgEhb8IIRV35sG8qqtf7NvJkSn8Fup+gdfgmSrkqQFKC48UVPVyfuh?=
 =?us-ascii?Q?8SXFUJLZByee+kwFbmr5/EfURhSqD9Zm3I2nmw3+D4xrk9BVB09lK0I6jrm5?=
 =?us-ascii?Q?bfkkjxXIg6wgYz9AI16teL474NJizdEGmmyvupA8LgW9Fsj+2OMHDzzqGwDR?=
 =?us-ascii?Q?irvbNl7H95lY462zhar1F4e18j3fOF2OtsozqzgA7KZ1rnbwNzlHQ4sw3YrS?=
 =?us-ascii?Q?eEwbjN5LPYjQrxLu57IotUChs4N4oU2f31ICDI7ABwlLHhiGiQTAdi3sZ5Rc?=
 =?us-ascii?Q?XsGlyn6WzuW6lEKPCIK9sQuk7cLImRBr0P2MCPw3Xsv1a15bQttxjiPf0vcD?=
 =?us-ascii?Q?mMOJ8m5JcqNVujhh3BokM5zhYP8cHqWoSvnLGEPes5JelMXcrt5Ri73bNdaU?=
 =?us-ascii?Q?GbNcjq7lR9h1UaRW8X4gTNHELAH3HsCLbv3iPPNU7R+yDbChAbO/7yT7zdCg?=
 =?us-ascii?Q?H9bwxCosokw04CXqZH7ehUlS9DnfIcRpGrcacPvUHLGrEBHl/wMhFkH5AABI?=
 =?us-ascii?Q?skAd72qRPALSy3rVT8vLOMIHUMeLh9sY1lIPGrvL24LogCUttdJWotu7NvXv?=
 =?us-ascii?Q?aoHjyxFY+T+T7JOohGzOmBoUvT3nvygJB37+KZhR7LJDHhF49QYpZOAuYarM?=
 =?us-ascii?Q?mVV57HQn/3V88KDoonNal3Hk9uovIHsmewToLhIiV9rQm54Zk9ExHOdhzT/w?=
 =?us-ascii?Q?QLzsZPqIx/TElUjMAXndRhswN4UJghIiNPgFRL4q/2s7fk8KFSrbhJAEc+0n?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cac653-76dd-4dfb-6de8-08db1eeeaa8d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 09:31:01.7064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjvhINmOyZrsZUS+UiTx5CSPtjCZmZX2sJzlbNdyufGkko3nJhw4PPwPuLMW35dFmW4fTQJpWXBfUk5pALokzvzCuG8Y92bFHhX4rHoa7Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/19] DG2 + PVC workarounds and infra
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:24:27AM -0800, Lucas De Marchi wrote:
>Bundle together pending changes for DG2 and PVC workarounds. This
>includes previous patch series from me thar are pending review:
>
>1) "drm/xe/mcr: Add L3BANK steering for DG2"
>(https://lore.kernel.org/intel-xe/20230307015635.986043-1-lucas.demarchi@intel.com/T/#t)
>
>2) "Allow const propagation in gt_to_xe()"
>(https://lore.kernel.org/intel-xe/20230306175025.720323-1-lucas.demarchi@intel.com/T/#t)
>
>3) "RTP and SR improvements for PVC WAs"
>(https://lore.kernel.org/intel-xe/20230301093112.2893689-1-lucas.demarchi@intel.com/T/#t)


for this 3rd one, the patches are similar but not exactly the same as I
tweaked the order, fixed some issues etc. So they can be reviewed here
rather than in their original version.

~                             
>
>4) The WAs for PVC and DG2
>
>This has been more tested on DG2 than PVC. Driver at least still loads
>and and basic tests fine. For PVC I may need to do some
>manual executions to make sure it's not introducing regressions.
>Some of the RTP improvements (item 3) are not really required, but they
>helped when adding these WAs.
>
>For "drm/xe: Add helper to get dss per group" and "drm/xe/rtp: Add match
>helper for gslice fused off", Matt Roper: can you take a look if I got the
>condition correct wrt the group?

now also Cc him since I mentioned his name.

thanks
Lucas De Marchi
