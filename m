Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD74C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4094410E02F;
	Wed,  7 Jun 2023 04:33:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CBA10E02F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686112418; x=1717648418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rgi37/khlCBk6mVgAgCEwCJT9UxOuvflsXhgXKdtn+M=;
 b=mbZCPr+2a8gUqbnP2xDLtUJcsDSrejcXvcv5p8CevZEzsMPDNWrBSDdo
 2ghrs6uesLTL8dhoOmp8vmommm2lav+X6gsRPDB8qIMM9+4b782wGFoKQ
 dYqa+Cl5vVD3uvoF6s75xMNUbI2xKQVMro5iR36IqBTMlqeogS4rlPgNT
 tyn52dD0zuaUSU9nsX+ZAXvu0pA5Jz5DUiSPQ8+4O3W0P5+OovvCdTz4s
 EaryRhvlCftOmR1fW1MjO8s9+Y97PD0otNNO3MaRtzZ/7HUwhjzv+FNBJ
 jYIFHpH6SLr+KD4+LznGoWzCE/34XLrjEFLlw2Ta+v6ZksGwEEGmJfOnj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337237984"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337237984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="956053527"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="956053527"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 21:33:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:33:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:33:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:33:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaT8BkjKGx6kiJav5f+1K7PNmTtBDQ2XfBdvrVtCS9L0Vx2AowxT7wF7NSM78HAE6I5C9RiIfSbOMmJC0TMoRFsRCAvDkzNnY9GQmJHBjJOdURydveXZ+tq4mJhbemogc2yWOzxZ+X4TOZrN99/+4jA8cYu2i6lYlIj4ybV6ZxGDbE/lg9WVVJ+HhWrPBWWakcFrsHfOCzH6CfcZyzhgaKtC+VOAIRFj7Ft2s/f6f2J79P6knaZxAp7mYTA7IeM3yaRK1kLVY/cCTyJDvHTPDaiOs9CZ7g9FMdXymDZDPXAk9srxvSNMVQk7k7i7KpLKoPhKmEY/URPtnBMzFM0ROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73AbmzV7ggkWmconhGjqSPNXfY5ouP1ArP4hjX5u9WQ=;
 b=i4Fwh0PSiBCFLw6ppa5WJBI7sVKl/Xj/A1BSPnHCnokiaNn1+lQfuMhmQ6hCj3DcLrukNFViSwK3oiRDXhPlR3cDUj4pjJsSk8dkVHrveYXfPqWukZ0fHqPToZ/mk6UDqqwIJZ64ysbiMYeZhxYicRPvLc0V430chHISTdJUsqapVEavVesARdYfUs2YL7XCGVZG2mOcjmL6FR4Wnm9XVZbNzaeTo3dkqUtXQwOpnFITyXMTPM3p/l66VXbZqtddU/bmQwHMdoIsiAhhn0p8lMXa54morC9bQVYBvDRhUm80miSP08iixsrfhNc3+0ZxQ04xM75gKO7xSc7OveyEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19; Wed, 7 Jun 2023 04:33:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 04:33:33 +0000
Date: Tue, 6 Jun 2023 21:33:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ozcpduwlkdrbzx6bit2eqdrca3qawnjvoo454rrsebtelu24ng@yl6sktkr6fwg>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
 <20230606235242.1895643-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230606235242.1895643-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 4144a633-a3eb-4593-db20-08db671059e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXrkayfOWbMO8B1diHWZ3hw6cfGdH9/REAo5qElnFlVTRNkt39f+a4dCI+xG89iZCF9AhyA+CtU5rqEGvmH81IxMIZZ9eb2U5/cLmU4qxtS9SEvn6otQmbvfTTb9uqDrfEo53fKAe5bKsvPhtmacghUawXOjhj/itTaoUhTceqTRBCeaxiXzOsSrmQU6XaG/Z8bgUcdNKQXTn8FTesqQ+Hp7KIakpIy8N6lmi7yv4DBTUr5Hrczd/rBN9cbo4VwlqyFVI80HhGyuDD6rcURO+XJGrCyfebcT2u7Ja5yO5C/KlYyx1Cd0VtXGFfyAMkx1eX1oFJDF0/xYA2WAkEhQseUMJvSxbU+NBQMDBl8MCpwBYOM30USvYaDRrxXMkfTyYh+igxO1syJG5pnB4Y6awFmiREApZTcMjIcfZd2/tEGSGLZqTOPuJbcyayYBtOMbIyjfKTC5Xj19/RSNNXXwb2bUPh2NfXHMEoKayBQXGFOFRDm0dr/lY+718fFm3wQwuSe0YpZtchoZ+a/yRFG+ZABesJRGAS8Qt2ca1wzvPSO8YvPbSdZTsVr9MIBhY8QY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(186003)(6666004)(478600001)(9686003)(6512007)(26005)(6506007)(83380400001)(6486002)(316002)(8936002)(6862004)(8676002)(33716001)(86362001)(41300700001)(38100700002)(66476007)(66556008)(66946007)(6636002)(82960400001)(2906002)(4744005)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TNTtKgiClyNG3f03cOBB7PaRqsH6suBzi0P0p7N828fEYtCsEvBou9Ygz1Ce?=
 =?us-ascii?Q?Tb/88jG77F2/G5cnt4mvLUPJ3ARQH/HbqE+rYsX/PKd65WBgAm5V/4taA17u?=
 =?us-ascii?Q?RAqryxBok2bfrTekEhBNkb2DqZTcLmORmRLI/vxy34tmNjKSU7344+lCtysV?=
 =?us-ascii?Q?ZG7MFL4vis1MriOhaY8NSnP+wQVOjVqG+NF5J/W2D1SSzTSRv/JgodoZNBbz?=
 =?us-ascii?Q?x9f2eFYnKzBeA2v9WTrzXC94If1j+KsgfIi6+HMY4Q+83RtZpuiAmr0TpaSC?=
 =?us-ascii?Q?Q9xrztQIwL7VcwwWeq7HJtlvqq3wBlJtKDs6nFt54cSz29ANo6nAyG6/8EUU?=
 =?us-ascii?Q?UT22ZMOJqzye3iKX9FWxjtGsHDBx/0Z0Kkh7IMIkOYqpbrkMVwj0ugKR6otY?=
 =?us-ascii?Q?PgUeHRVa4tLLmqcCdFVMal1dN2qvJAhflHI9bLuaEpyz6p5E4qQtwKpUPfQh?=
 =?us-ascii?Q?1Te8MMoTL5t46HlZXlq8qVOjh49F189rvejv1tLbU4HBec17JqnZpJtXRv88?=
 =?us-ascii?Q?QAdBKizbRsBD2keeFZtmaREeFyexEdAUqUTQrRHGPk5WTdaTE4rWcBZcu+z+?=
 =?us-ascii?Q?m+mf6iVVfiMM7V2yuRua01Kc1tv0XmNyNYmpJLO4tz6IzR4Nuh8aFBsj7CV1?=
 =?us-ascii?Q?PAQitg5b+MI8vjuy6NMiJrH7vndbNEa/Uojt2Bl9nk2h1QeSsJrw4vDO5Fvm?=
 =?us-ascii?Q?CLqUvuxFkrns6IxPuKo8qyB7o1KYTLdPEcNc0Ql4u8gIy8wNaCllJfJwn6Nf?=
 =?us-ascii?Q?TSMFbDAgpfkjDYqcaaZOcyFgEO0+As4F3qKgMBxscvaSpIEewZY/N5UYyRth?=
 =?us-ascii?Q?aR0YgY5v+elzo0NGPobW3Nwi9tj6RAf988ZZbLC4FO2fHGZnK8Wyqhs0yNmb?=
 =?us-ascii?Q?7z0DUALjwHGnvqwfhD4txWXlxFKXmE+YV7frExd4a9bw9wE1N1aqUKCTE+o8?=
 =?us-ascii?Q?t+pbl1Q6UpP7bIbxOGz4Z7OOl23mD5scJNG8eNStjuEgTST9OmsWp7+QpJ5g?=
 =?us-ascii?Q?t4lH1HU1o+ogzc/CsjHJMGCuXiXpj5wfKW/4sDOobNLggxyE2Uctx/7MDu3f?=
 =?us-ascii?Q?uwwfrbHkb8w+W+ztcJfLlZpDVIDDwI2ijxupJBu/Z3MWx4H8lYPVgFbM9O/+?=
 =?us-ascii?Q?2CS6U9VrvLExMAEQCDbd422ePBSDf1CvbklfozHQQU/LDfsG/BOci+kf3ZdO?=
 =?us-ascii?Q?P7iaUrY9cl27HWnQzpMfBYQVcDui78FXNI3fG+HlSHOwA29KWjfrqNB2AZya?=
 =?us-ascii?Q?O0sukWG1QSxQIirwPvXgRU7uZuB8pspvUwgt+bO1zynN8+N5tH0RC1nZddXk?=
 =?us-ascii?Q?Fi1q4r3tFItUZrgcR7GylNw/MyDd6MraLfL+fbvupLnAxXbFADau11KErDin?=
 =?us-ascii?Q?9UilhNIvjnd1J4dMkMN7nmNpoo8V2GCNxlxK3DzYNhHYYJ6cnpKO3lv4E+QK?=
 =?us-ascii?Q?hQccaretU5ji0sw5gv0iPXhOxrBj7IyCOHK33eMnHeTTVsqBYXdD1MX4GYob?=
 =?us-ascii?Q?Ld5dnMMJbaAxq8gMWL0UR+30tWc8v5vxmDWPcgCWhA5alqZrLXa7/NnwMIIe?=
 =?us-ascii?Q?1xlTWidTJ06NCtJTeJ8stcv5M0tuTEGetRAhMoZWEKUoPAWHPidqUD7UmyRp?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4144a633-a3eb-4593-db20-08db671059e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 04:33:33.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXIZIamRC4OaR1WCTjz0nxFat+EPln8m4MYgCsA3hmDnNh79FYgjYt7cPhkM7L7pA/KlzNTceMXn/yvP5c8WeA9TqfPSVszXRHAnLVHN20E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/10] drm/i915/display: Include of
 display limits doesn't need 'display/'
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

On Tue, Jun 06, 2023 at 04:52:39PM -0700, Matt Roper wrote:
>Drop the unnecessary directory prefix.  This also makes
>intel_display_device.h easier to use from the Xe driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

is this supposed to be a cherry-pick?

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
>index 2aa82cbdf1c5..327520b0ecb9 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_device.h
>+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
>@@ -8,7 +8,7 @@
>
> #include <linux/types.h>
>
>-#include "display/intel_display_limits.h"
>+#include "intel_display_limits.h"
>
> struct drm_i915_private;
>
>-- 
>2.40.1
>
