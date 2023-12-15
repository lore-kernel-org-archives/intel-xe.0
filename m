Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BF2C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE7A10EA43;
	Fri, 15 Dec 2023 16:37:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033710EA43
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702658259; x=1734194259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5vnxKX+bVXyx9tZ2HdOxApxicGvoRS6H9o+ZYjwDh7c=;
 b=DrXYhJo4gjs3GC3+XFomNLCZfx4y3nlvOknJy4myM0BjprrD9X7h60lX
 f4g1GXhLBkqkUsLVdXgCg8YAdbW8soyZDFKHGgshnNo7vs0Z6sbiagm/Y
 TO9v9ff/Ds2iwWHI2tmTpqwJ9mGddr8LCHjyFUb28ZWLVDrY0sLZFa4FS
 xxwCMV9Z0IX2qVCQ0yOHQVXiBfNGutWhk2GnRsF1bg9+C/idych2U/2C7
 O3sWtxkbOecw+IEC9V8KGraFkoMy15DjlvstBLSr5Mw5JHJ9bv6fYypmK
 VehfwXebQ9816Cs4gO2qwjcqq56JXWU6wQMmNaiKuc3tw3iF4ImcLnuM0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="398088604"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="398088604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="948021934"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="948021934"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:37:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:37:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:37:37 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:37:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK4LqIuhlm2FlzS0sICZRhxrF2fMVzpb76ZV7RTmx2PnHMyUMHJTYko3HA/wqRBXGOqu7/89qO7LnMAwRTWTLZDhX314zjQO4/z0NgiRSbk/q2lD48NSMMtqRsxfiCqZw71UqIgO5w16WqU9JaCninqG3TN04pwWCtYFiIm8xc/XR4coOFUjm6yZjqrINKA0sfzGOuiYYWkv5/DyNFu+Q5J//g2he9jp4xWmovP8AJTo/fgRJDWeMTCtZxKjELZ9YPZj6Dqzy3RJ2Z/qS8A9uC8pO8CKovjY5iiof+yhcXVgtUkd1tsOtXWUq+1IGiFBqdKZLNmEpZ3U3iWvAPW/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiTZvOIyAEYR9IoBGxVLKSnBVIZ4L6h3p+nSmKSEGEA=;
 b=EfCyMbke/CzF543AYr4PVz+qMEfS1PLa3JbEwZtBHUnDRU6HIX5XNjrYSO4d+f0fVG9Ve7LaX+lEGAF/W6+2pgoEjpyKie78kGsXnqOpzuosnuLGuBmytvkWdBR0Tb801i+pKzUEAhDMxoeoh7A9WrpFF0bntYDTKn+K2hjQnZViMr8xgS3o5MOtFeDa5YEPNTjRYvkRII9wpmo/b3/eYCrCvF4sJCYyE9V2yEHVcnddwFVzMSPy23cQHg0NDG9bcF+7dveh+LfT3bVHD1JGixatdQ7dnt1bM1UXa6MfgUiqLERwW7seAC+zgVCnZvydtoU1wWvWRuYHSIIxoEky9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 16:37:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 16:37:34 +0000
Date: Fri, 15 Dec 2023 10:37:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v3 0/3] Add support for XeLink device
Message-ID: <4xjueszswl6yixxcmhigz6hefx4vht3c4s64t4spihih7onpnh@7hywjhl6z5fs>
References: <20231213214525.2584729-1-david.kershner@intel.com>
 <IA1PR11MB6418A9FFC88A65541BE9004AC193A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418A9FFC88A65541BE9004AC193A@IA1PR11MB6418.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1efa4f-52a3-4ac6-ab92-08dbfd8c2426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cE5gbV4fMAot0RBvzL2eCiuH+eQ1Iuq5maROfnjyZv7EuNAZWkwqfFqepKee37laP7FE5TGhb+KeZUtcDbYFTpFizEeh9e9TPTRJjV1Syc05qqrd6gOF1bRnxDQsW+WULtZ011654lOle6UHe2j0JnhSP7sABzvTuUAvByVe33ugGWDHyexukRicrp4Ag7HZSSkBYzOzCEwjbbtql2xLXTskQVaueoHjJsM80t7GlIZm03sm3EW5ZLYeAE/VSXI6kSY7PW8d/dz7etHnBbmPFJshdGQr0enaCB2kSj6sFadNcA2jggxnVH59TRenpBLo8NhBllg6ago04gKK7eVvJA4hr3IyrVVwJmTqzi6iaS2WnoU2Unj18JxwheNWPL2dT8wr1AtFxpOiuRTZac4RlDhKKyl5T0BSr67RbDBmmxz7mwF77G13HjGZQweNDz382f+82yXyaJJGUKB4rlacFvZ3VL6iLP469xLc1R9i86sd767oi38+sueieZePA8PrQqw+t//OMgYIfWjTkuAJ04W4ZlH3lWNSXLKGuW6wV7dXLUOF7PWa5cPXIjIO/d+K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(6029001)(7916004)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(9686003)(33716001)(6512007)(26005)(38100700002)(8676002)(4326008)(6862004)(8936002)(316002)(2906002)(6486002)(5660300002)(107886003)(478600001)(6506007)(66946007)(66476007)(66556008)(6636002)(54906003)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fBP5tMRRO/UdcBfm9QXSk0rlLqOcLpKTYKDezneb5bACLxc1Hxahi99x7TLH?=
 =?us-ascii?Q?N+MJQ/MW0mXGFuTxj/FXEWdi28Bwc9xhVNpgaFucd1fLk14fL6cCzM7ywSN6?=
 =?us-ascii?Q?IreWoV6qVICpi4Iqfv5YwU0m+cKwwNcwS9ABJ14mnkDh/2OkD7UY/6pdX/QS?=
 =?us-ascii?Q?dCcev3rAjGpHQ4uiclcgOVfYxCZXVX5p/ZgQkyjSRIg7gTSDwHIC3lR/g0ut?=
 =?us-ascii?Q?yMDB0siooRXJN67SpK1Z+dOhX7dUaivL1cs1MUKzrKx1tReub0aHIF/pyEfE?=
 =?us-ascii?Q?05PjUdScWMyjQI2qIKJXRwVNQRLBCN1B59mT8MzEULO2MhYAQ4korr10jHXd?=
 =?us-ascii?Q?BBXb2NeBiDZF0ZO2305TMBLfL1mcZU/Ofj1h7tBw229bTTA1wmGVLjIVx9Yo?=
 =?us-ascii?Q?HR1BCb+LoJG7rLsAasjbBoulILwCfCYAZxO/DEjhWG/IJS0Ml83z8MrVgLgy?=
 =?us-ascii?Q?bfhLkNkNNkmcfdt8fX652CCYHuV0x5kxgIUI1wxJmFGoZcwqlXiokXPARPFn?=
 =?us-ascii?Q?3afiGdo4DK1+JYOBkUSrnPBBW2ERsY5A3dB9ri2nuRopTxaOXVQcOu9wZzim?=
 =?us-ascii?Q?Nb5tKkslgEVyYWUxW1DtOv3tys2xm7wQZfcByYcsYh6vOT+tkh+wAr1IpkIZ?=
 =?us-ascii?Q?tQQw/dtgXGz3eRVjZs+tVGIlBeNxo6PFk8RlX0f4vDDKkrCNSvR1J4wIV2Ie?=
 =?us-ascii?Q?Cy011UaqMTU2vw2bpA0ka1wmXvspUKw5JtAdogzzKyl7qMThEyZ7vRQAHrJP?=
 =?us-ascii?Q?nQoJWAjcodXuLl7wYqqC6dFQ9I0Y05C3vrMYYGiYQJZozR9bVB7y37hZ2BmV?=
 =?us-ascii?Q?IAmi8+jaxLV2TndCJVHKQXrjz449oT4kEe5xrY9Ydh+PMXbG4gt8p4hCACSU?=
 =?us-ascii?Q?aFaD3o85irKtR22otz1SbLN37pdLAHTaR33ufaaXgrkPbD6tuhTJ+E9piYfw?=
 =?us-ascii?Q?iCwuAgK1HzIXZkv6o340TE4v5ShYteb/vORgbgBbXyTljrlRHym0V6mpK144?=
 =?us-ascii?Q?SQkeXyuiZbhCLla2YgUa96+C3+WxkAfoWqu9L8hAGk78uP4oOEyhLuUzDRdA?=
 =?us-ascii?Q?QvLGgGKND7SHVuNmllZwImd3aAhazrXZElfgkNfC4ha07o3KndORbLtROdii?=
 =?us-ascii?Q?Pw19JhkSwamSquJkZjDhhG/DB+dN5efqtFZdoHpPHQKDVNX9DfZiNDISEHFJ?=
 =?us-ascii?Q?ZbI8On8UA26+gGS6tjGRsD6M3CKPi346qruNmCxCL68v48oOUkknwBTCla9p?=
 =?us-ascii?Q?WrWbEHtbRXsoC4NceVql8xG7xyc37z+3xQRRmcu5CY7De4l3X1x+ZqHZd/+4?=
 =?us-ascii?Q?XxdYfvXxrplzWQA3laBGZWtLHzl72cVgubZxCLijg6dS677rWB8nFTzEGvyc?=
 =?us-ascii?Q?gRjn488vz1LqqqnWFH3bYyYEE62dUZC57coQLp+DvbL2o4qFpybcdfdjqtzT?=
 =?us-ascii?Q?bgWoaeT6O+Dl7fJZXgX/OVZOEuyL79ItJue1IFnRndBXNED/NLHPiPc/wVUz?=
 =?us-ascii?Q?wPYqFaVuvRmw6io8dR3Ep7ddt2DxkJbf19M9DkBvWb2MdU0B5f0mdB1fKO+r?=
 =?us-ascii?Q?qI+0A807MxZ02Ml0751u+qSe4JmuEtP/nLDnvp8cxBgl5m2woAb76wPNN33W?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1efa4f-52a3-4ac6-ab92-08dbfd8c2426
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:37:34.8366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3J0JAbiq0dCHMduO0RE4K6XG+EnRe0z4Gy/j9UOdwSFyh7llYxFCsx1gUddmpEU41TAkFSx+A9F3irnXIp4ttyQTgY8bC5r+3tSI0tNgAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5598
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck, 
 John" <john.fleck@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 02:50:25PM +0000, Ruhl, Michael J wrote:
>>-----Original Message-----
>>From: Kershner, David <david.kershner@intel.com>
>>Sent: Wednesday, December 13, 2023 4:45 PM
>>To: Kershner, David <david.kershner@intel.com>; intel-
>>xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>; Fleck,
>>John <john.fleck@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
>>Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
>><matthew.d.roper@intel.com>
>>Subject: [PATCH v3 0/3] Add support for XeLink device
>>
>>First patch set introduce the needed Xe infrastructure to support
>>XeLink device.
>>
>>The XeLink device is a glue-less module attached to a GPU device that
>>provides connectivity between different GPUs on the same system.
>>
>>The XeLink is part of the GPU (the register space is part of the GPU
>>PCIe BAR), so it cannot be a completely separate device driver.
>>
>>The Linux kernel provides an interface for handling this type of
>>device, the Auxiliary Bus API.
>>
>>The Xe and XeLink will use the auxiliary bus to enable the XeLink
>>and the Xe to probe and communicate.
>>
>>A followup series will include the XeLink driver code to provide
>>full functionality for the device.
>>
>>Changes from version 1:
>>	- Fix kernel-doc error
>>Changes from version 2:
>>	- Fix up rebase conflicts
>
>For the series:
>
>Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Hold on on merging this as it touches the uapi and we are in the
final phase of uapi cleanup for upstream submission. We don't want
last minute additions there.

Lucas De Marchi
