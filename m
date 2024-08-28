Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D769C54F32
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 12:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD2510E1D4;
	Wed, 28 Aug 2024 12:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOLUbdW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA33810E478
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724847745; x=1756383745;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xZXhLTx/cXaYMI0zhtbwROo/Ncl7SrN2g2hG7N3RitA=;
 b=ZOLUbdW/zKWfdxCngLkSKjnbC4eryhamw/WUY9Xsoy1N1mXzfs5dpajY
 1iC9tStgHBceeKo8/bTEs1w9iOgnVVBsaTRNj2efdQ3m25Fw+iiJ6yudb
 9tswuBtVzctZ/d02xS/yShB1jBWZ6mdM/B38KV4yA79Fy2bUJQtovVRLE
 lAX+limQXWKz9v2/o+i0BRthGdnqz2Z7Jl+z4iS646+ED9Vs71Av+0SkP
 Ovad0654XMW31PDG9A2oJGzRkpe1Q56/E5v5mI2fCYMgqjxFtmjurLy/M
 5qkR0AtaoekXYDzY9/wcn/Mg6g+/xKqhYKL29qfJVj9WBezvCH5wv1BnO g==;
X-CSE-ConnectionGUID: MlzDAWUERV2xDmqllB3QCQ==
X-CSE-MsgGUID: 0uFK0E2uQ+qpzpXzvU2WZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33941868"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="33941868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:22:25 -0700
X-CSE-ConnectionGUID: p3z/UvtDQYOzR2kNcctbZg==
X-CSE-MsgGUID: WTqx3SBsTCOAEnJB+c4tBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63909797"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 05:22:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 05:22:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 05:22:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 05:22:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 05:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip/bnV7Q0HeezTWhLm5zcIzeeK/Z3s6EaUUPLVPY0XgNgrztoigXIm5603mSHBIHY+O7AzUpvu0eudgIJn5cNw/fj8Fk7AuXGiStt5HCDv3MhWN6lFp5AiP5bUN9Bi/TW2mTcOGf7BoJoa7V59udwrQbEmIJ8Rs4E/LkDCRJ0sqxy6WoXi1+P9G4GIqh51Rss3DA6zGnRcccA3dJxJxV/8ZTY1DU8BDsE5pASlgNVHxow5KU6yKx84q+RB6GUAEeBlKHc/067CZJX+Is4V4ssa2MEkPKOH42S1+4KEbd+sCTp+trRQD/3fkUsc3ZUoOtut03pOzfp+Jj3GURE76s3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP9L2oseX577x2AqvNtM4kMSzyKBt3lsO7o0RXY0tKE=;
 b=J0iqtcz+3gn6L6KJrLd3+FA99F15EQsxPQvJf45XdV+R0TougJptnOy8Dr/tuLLj5hoPe/y/RIOibcOgS1VWGTvTF3NgnorDTT27ve/m+CYkAnQMVS0a9+NHmmOv8r1ki2w16e58mC/dm4vT2pvCoSLmSahdQtPuAS26jURE6kWjT09CnEG4qCMb2q2yGurjmaeVY7wbj2eww9ctASpsL7Dv0lBwTCgC0dzzCdbAHq8bvbBC10f4TPziAQrU0NBIAiOAC2+QA1nG0Yp47uD6P6VTzjMrG7kqQJVcARWvYeptWoSpNHkgobmt9q5wxEG70HPAYDxVmgu1tcUC4ZHygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 12:22:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 12:22:19 +0000
Date: Wed, 28 Aug 2024 07:22:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Drop force_probe requirement
Message-ID: <kbmz3xqpsngb7yq6fhrtxvfxilh5wzpgbz5cgwujwrmv5s572k@vjedhdbwvukt>
References: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: c04aaea6-a81a-46c7-1cd9-08dcc75c0f7c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+eMVhWwdhmjF3ceB1/kFsujae58agOpnLH1o/5BiB+/gjtHivGws4zsGIv?=
 =?iso-8859-1?Q?lDTOk/0zzl0GB+5mFTSLkVLwjeAWg5ujj8CBLqgtUHYvgREo4KAAES0Lix?=
 =?iso-8859-1?Q?s364RZfjwQg4FgIR5Ltp0U+2XajJafasKmYh/w1cxZSHcZILs5g6qyFE60?=
 =?iso-8859-1?Q?qBJVLQh17SAxVyGCdYGI0NrsL0gIXZpH+Mbu40ctYhYs8Vkl+Q1kA2QskP?=
 =?iso-8859-1?Q?YlPR7+v1J5DOlAXZY070H4aHc2C56/Ry9a80WxmNHJjmJpSLul+fUFU2Fk?=
 =?iso-8859-1?Q?EGGnKI820RWTOUhTdHOCkqRMqlLZHRZJz9ssTBJLl9/OFGJK0p8+QVhvaG?=
 =?iso-8859-1?Q?lq5EuBDxS98eKeykLY3BbD1Okw8uGv8areUUt/ylw/6KFiwPBJRuZy+0E3?=
 =?iso-8859-1?Q?N0cHQS2nJrtEnEw3DxxQTk8gveGZxpJpJdXa3HLUb1phcMFM7neQ2AIjqf?=
 =?iso-8859-1?Q?qmtXj/9uzFvAjWYLh+Jk+377TO/zpYB7NrR4UUyloWit6wZkJbLr/ja1BQ?=
 =?iso-8859-1?Q?EVLsiMY+KFlA4MvJlkEHA5UyUADGYWZExXiUfVVA6/ea4bjU6BXH0Nd2qK?=
 =?iso-8859-1?Q?+ta4dN1GCEkdl1mehwNqYq9vLkt44/lgfbg6pIbR7eaRMabbf7JLoDXY4W?=
 =?iso-8859-1?Q?cTA5eA5RVZctCOpGJoToA3FKevJnOCE2hIS0zmzkszpIXj3Wkh1sRL1VRM?=
 =?iso-8859-1?Q?1QlOb4esQRUatY0Oz9OqnShWvpkQWI+tTdE1jqghkMVWZuZEuzXOpBhn6h?=
 =?iso-8859-1?Q?uuBqCzKYWYtzCaIxnwwOU/zW7FICVqROuf5EYgRBSoPc0V2qPYnOuv419b?=
 =?iso-8859-1?Q?SY0Yq9IzDmee/bBYFLXl3uLw/hZgE+G1Haa85iTdl3KQzATaaPvxy6CLhY?=
 =?iso-8859-1?Q?+0UCCOwOySSHUlNHJUVoIGOUlsnH0wSDcNMHxrrFQbYoE6A1uMOmb/cWAh?=
 =?iso-8859-1?Q?mRRVbsOIC0OL0SAOxhMv654cD/TdSKLQV1F+gglb9z/Ghej3JnHw/PDXeB?=
 =?iso-8859-1?Q?D3Vco4f9pXsxZuKy+FMNCP08RG3/aMpwDsPSfUkl/rAXdvtTeVgKQfqq6k?=
 =?iso-8859-1?Q?QtH1ZnnXjTa9KuKYtnXaQz5pUwg9QpqHxJihWaBTBGNGqPBumDRrHNNynH?=
 =?iso-8859-1?Q?V5OhQUJa0WIlQ0S6tzHp8Kr5niZZ1wQQZ7dGG3ulS0KN7gXSApyGLCLxBu?=
 =?iso-8859-1?Q?AM51B95pHDKwou6/sa+5MTcrZbl3Wa3xVBVeDdrGqZ52JvTgX6NGZvzedc?=
 =?iso-8859-1?Q?3hyU+LsTRsY+oEfeKqkxdW71vtMeSUeQ7amfxDoTI7ICGKDa7+vMzMGUl1?=
 =?iso-8859-1?Q?HPMmfIjPXqF4KqJ1xxoAMXBPGjDyS4+3nkFZDWg39qfSaGO3SbGhMbxTJ6?=
 =?iso-8859-1?Q?I2RzZ7I89hPpKzwKj35YrV/gJ8xmmFhjT8qHb4FtuFtQ17D+eKO7MPqx/Q?=
 =?iso-8859-1?Q?DoMlQG6nDKuQ8hfRxe37nyGnYsyaMPrM1xU6mQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g3InBhNLJ6+EKIe/pRUQi8PyCFU/C4Ct6Q8ee4MSCRuXTqjbksCLmkJBis?=
 =?iso-8859-1?Q?KU2yEv9LPr9SA1+vYp7JuAGAEbvWMTtppVQxa+5V87L2ri3NXC7TEAcjl2?=
 =?iso-8859-1?Q?Nx5up7+RNOg/xN0A6oCrkXd+wnGhLTo+Pn9Z7QVGzUexAvX3jujTgiU8HT?=
 =?iso-8859-1?Q?T3zl6OsNbHm0UsJZkhS3BPWns/s+WkBrLVc1sFYIBTNbUD7IBHA1sM+Mbq?=
 =?iso-8859-1?Q?jgDOjVQsrLpFeq2QX1/uzxXgfUvnl69h1iEsGavermRLa8FB4PHIsGS5Ee?=
 =?iso-8859-1?Q?ylwKLWLnhVxX7ESSIiAAp0imDlkqFIF9B5tJ5OSnuEJKPAegCg91/gXQJV?=
 =?iso-8859-1?Q?RLmdE05wIRWoQhq2Kl3+XYEJCv5tAWzN4xPWDVkIy6ZHLoODsW3KDF0X4t?=
 =?iso-8859-1?Q?A2YUX5Ei5TvFGSwhFnUq0bknGVhl5sh+p23EQWrHp/bG5hSDy8aq3oanOV?=
 =?iso-8859-1?Q?7tGS+j1LDhUVdKDuNUPLnKj62dwUTetquQQpcfRKS52+BZQdsyelKhmdAw?=
 =?iso-8859-1?Q?w5N1lGrzCnqg1k5u1lpdyuv7MU69t6nbia9ayfLqfgqYj28UV60aIeLTWe?=
 =?iso-8859-1?Q?1A0K9HKY8SLP2Q9vwmbsPahmuDIl96ueTNPVhS7d4k0UnZFDv/esXB4fk1?=
 =?iso-8859-1?Q?wcgVCVN7QU/1j6lJU6J343Z7rjbUc38VPqLvHlTCoPMfRCZqrMlyCapswP?=
 =?iso-8859-1?Q?x7xHBPFGgYZSAqCbyFcdg6ttvsJmsR5sPe/mYf5+296et7HeNY+Rn8Etgg?=
 =?iso-8859-1?Q?2ygM63znh/pjgSgH3UVkYiykzHhxJiQ1tn6klVbIlQY/19TvXqUkk7aavF?=
 =?iso-8859-1?Q?Trxmsu4cZseMVp/NlvOq6lo11sDilGDpm6y+hlljSY9jCxewgqS15bfv2S?=
 =?iso-8859-1?Q?2nLxh2/62IuqXqzhDJaEUA3clowoS2d1W2gCdQFzS1gilt8p0wGa/P0lRl?=
 =?iso-8859-1?Q?FQbVmTVEehaLWPytwqz7zIX3pikgCVL/1jkbKUxs0ENBvAyVvHi2x3JHy6?=
 =?iso-8859-1?Q?ANDtFSBsBTbSdnI8U9S3Hs7uC8ns8KlmpSQVmZJpEpzdWgC8K5VnWai0R7?=
 =?iso-8859-1?Q?sXNxfDZi7bK3NI/uSwGU9dB4sYdySqeDZIAO5fbvcoFdZVdSM36FCEzY8s?=
 =?iso-8859-1?Q?Y39WnM7EFXt1c+oO0gg3QrQ9va8D0PCwSClp7pTDmbD0R3mXNdrvLLMki+?=
 =?iso-8859-1?Q?ypjUSXAwJs+t+dbIxcrJyNkA+oEP6cnWOBiGEjZ4BjtlgdnsGPskU32r0z?=
 =?iso-8859-1?Q?bCRXAhSe/Et64c4wviYSD4sUBymNv3bfxj96p5hgHwdPVGO2vtf5di5Cw5?=
 =?iso-8859-1?Q?jdNBsAW6Zl9tNNrSiSUmXW2xoOdOYy4UYi0/85B7fWrhfFG7ddl2ifUoDo?=
 =?iso-8859-1?Q?VEjwciiEMdBhaiLEDi6QkKCZBL/l+ckVNRQOfMRUqRr5yN71T+iwK0HvP6?=
 =?iso-8859-1?Q?SuZ45tsZfEJ0kh6oJmqbu/qSEvkBrP49iFU0255bMQ+oNS1zS1Agy2LqKb?=
 =?iso-8859-1?Q?UFTHTxg3z1zKQfl36EQCIJ9L/G/TJTxS0euQ1WGYQ90mvvSKmtz8IPNVPB?=
 =?iso-8859-1?Q?TSFWkpqs+aJZtPtWtK5XyNsYmmQngajUk5v/w8YzFv6fZqY5v3nmjp6e6M?=
 =?iso-8859-1?Q?vmUxv4Zs1IiOxRMVlIn55qhVVszXAbnQHpLTY/z/y6LdtE5KU6+cLHlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c04aaea6-a81a-46c7-1cd9-08dcc75c0f7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 12:22:19.1582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB+1F+NSBg9vzgI7b6dPeRgEN7pj2COJo3SB9ahC15EkP/yEe63qk7HUPl8dX2tKIFElmdOI+iK6Cu8T9g/wyJHiwmvTN7VWaSSEJ/MRss0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
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

On Wed, Aug 28, 2024 at 01:51:52PM GMT, Balasubramani Vivekanandan wrote:
>Battlemage platform is sufficiently tested and found stable. CI is also
>pretty stable.
>Removing the force_probe requirement to enable the platform support by
>default.
>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

main caveat is that there are things needed that's going through the
drm-intel-next branch. That is known and we are testing with the merged
result. We need to get this in and drm-intel-next needs to get a pull
request done.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index fa57996f9c37..330cd2d785bc 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -348,7 +348,6 @@ static const struct xe_device_desc bmg_desc = {
> 	DGFX_FEATURES,
> 	PLATFORM(BATTLEMAGE),
> 	.has_display = true,
>-	.require_force_probe = true,
> 	.has_heci_cscfi = 1,
> };
>
>-- 
>2.34.1
>
